#!/bin/bash

set -e -u

APPLICATION='glog'

RUNFILES="$(pwd)"
TMPDIR="${RUNFILES}/tmp"
export PATH+=":${RUNFILES}/third_party/${APPLICATION}"

replace() {
  sed -e "s/${1//\//\\/}/${2//\//\\/}/g"
}

mkdir -p "${TMPDIR}"
cp -R "${RUNFILES}/third_party/glog/repository/"* "${TMPDIR}"
cd "${TMPDIR}"
./configure CXX="fake_compiler.sh ${CXX}"

cd "${RUNFILES}"
for file in "$@"; do
  source="${file##*/}"
  source="${TMPDIR}/src/${source//__//}"
  cat "${source}" |
      replace '#[[:blank:]]*include[[:blank:]]*"\([^/]*\)"' \
              "#include \"third_party/${APPLICATION}/\\1\"" | \
      replace '#[[:blank:]]*include[[:blank:]]*"\([^/]*\)/\([^/]*\)"' \
              "#include \"third_party/${APPLICATION}/\\1__\\2\"" | \
      replace '#[[:blank:]]*include[[:blank:]]*<gflags/\([^/]*\)>' \
              '#include "third_party/gflags/\1"' | \
      cat >"${file}"
done
