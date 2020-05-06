#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5eb2c1cf91c5b50019bd4286/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5eb2c1cf91c5b50019bd4286
curl -s -X POST https://api.stackbit.com/project/5eb2c1cf91c5b50019bd4286/webhook/build/ssgbuild > /dev/null
cd exampleSite && hugo --gc --baseURL "/" --themesDir ../.. && cd ..
curl -s -X POST https://api.stackbit.com/project/5eb2c1cf91c5b50019bd4286/webhook/build/publish > /dev/null
