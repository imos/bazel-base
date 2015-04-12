#!/bin/bash

set -e -u

APPLICATION='gflags'

RUNFILES="$(pwd)"
TMPDIR="${RUNFILES}/tmp"
export PATH+=":${RUNFILES}/third_party/${APPLICATION}"

replace() {
  sed -e "s/${1//\//\\/}/${2//\//\\/}/g"
}

mkdir -p "${TMPDIR}"
cp -R "${RUNFILES}/third_party/${APPLICATION}/repository/"* "${TMPDIR}"
cd "${TMPDIR}"
cmake .

cd "${RUNFILES}"
for file in "$@"; do
  source="${file##*/}"
  if [ -f "${TMPDIR}/include/gflags/${source//__//}" ]; then
    source="${TMPDIR}/include/gflags/${source//__//}"
  elif [ -f "${TMPDIR}/test/${source//__//}" ]; then
    source="${TMPDIR}/test/${source//__//}"
  else
    source="${TMPDIR}/src/${source//__//}"
  fi
  if [ -f "${source}" ]; then
    cat "${source}" |
        replace '#[[:blank:]]*include[[:blank:]]*"\([^/]*\)"' \
                "#include \"third_party/${APPLICATION}/\\1\"" | \
        replace '#[[:blank:]]*include[[:blank:]]*"\([^/]*\)/\([^/]*\)"' \
                "#include \"third_party/${APPLICATION}/\\1__\\2\"" | \
        replace '#[[:blank:]]*include[[:blank:]]*<gflags/\([^/]*\)>' \
                '#include "third_party/gflags/\1"' | \
        replace '#[[:blank:]]*include[[:blank:]]*<config.h>' \
                '#include "third_party/gflags/config.h"' | \
        cat >"${file}"
  fi
done
