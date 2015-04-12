#!/bin/bash

cd "$(dirname "${0}")"
rm -rf repository
git clone 'https://github.com/gflags/gflags' repository
rm -rf repository/.git*
