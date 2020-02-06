#!/usr/bin/env sh

set -e
set -v

dist=$MIKTEX_LINUX_DIST
tag=${MIKTEX_LINUX_DIST_CODE_NAME-${MIKTEX_LINUX_DIST_VERSION}}

mkdir -p ~/tests/$dist-$tag/test
git clone https://github.com/MiKTeX/miktex-testing ~/tests/$dist-$tag/test-suite
docker run -t \
  -v ~/tests/$dist-$tag/test-suite:/miktex/test-suite:ro \
  -v ~/tests/$dist-$tag/test:/miktex/test:rw \
  -e USER_ID=`id -u` \
  -e GROUP_ID=`id -g` \
  -e MIKTEX_CHECK_REPOSITORIES="$MIKTEX_CHECK_REPOSITORIES" \
  -e CTEST_OUTPUT_ON_FAILURE=1 \
  miktex/miktex-test-$dist:$tag
