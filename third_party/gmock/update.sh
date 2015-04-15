#!/bin/bash

cd "$(dirname "${0}")"
rm -rf repository
curl -L -o "${TMPDIR}/gmock-1.7.0.zip" \
    'https://googlemock.googlecode.com/files/gmock-1.7.0.zip'
unzip "${TMPDIR}/gmock-1.7.0.zip" -d .
mv gmock-1.7.0/fused-src repository
rm -rf gmock-1.7.0
