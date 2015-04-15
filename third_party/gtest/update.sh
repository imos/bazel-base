#!/bin/bash

cd "$(dirname "${0}")"
rm -rf repository
curl -L -o "${TMPDIR}/gtest-1.7.0.zip" \
    'https://googletest.googlecode.com/files/gtest-1.7.0.zip'
unzip "${TMPDIR}/gtest-1.7.0.zip" -d .
mv gtest-1.7.0/fused-src/gtest repository
rm -rf gtest-1.7.0
