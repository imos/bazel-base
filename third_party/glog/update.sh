#!/bin/bash

cd "$(dirname "${0}")"
rm -rf repository
git clone 'https://github.com/google/glog' repository
rm -rf repository/.git*
