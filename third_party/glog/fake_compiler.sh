#!/bin/bash

set -e -u

args=()
for arg in "$@"; do
  case "${arg}" in
    '-lgflags'|'-lgtest') :;;
    *) args+=("${arg}");;
  esac
done

"${args[@]}"
