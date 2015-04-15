#!/bin/bash

set -e -u

APPLICATION='gtest'

RUNFILES="$(pwd)"
export TMPDIR="$(mktemp -d -t configure)"
export PATH+=":${RUNFILES}/third_party/${APPLICATION}"

replace() {
  sed -e "s/${1//\//\\/}/${2//\//\\/}/g"
}

mkdir -p "${TMPDIR}"
cp -R "${RUNFILES}/third_party/${APPLICATION}/repository/"* "${TMPDIR}"

cd "${RUNFILES}"
for file in "$@"; do
  source="${file##*/}"
  source="${TMPDIR}/${source//__//}"
  cat "${source}" |
      replace '#[[:blank:]]*include[[:blank:]]*"gtest/\([^/]*\)"' \
              "#include \"third_party/${APPLICATION}/\\1\"" | \
      cat >"${file}"
done
