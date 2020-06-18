#!/usr/bin/env bash

# This script downloads xrefcheck from GitHub releases, unpacks it
# and optionally runs.
# Inputs:
# • $VERSION is the version of xrefcheck, can be set to "latest".
# • $ACTION can be 'install' or 'run'.
# • $1 stores all command line arguments that will be passed to xrefcheck.

set -euo pipefail

if [ "$VERSION" = "latest" ]; then
    URL="https://github.com/serokell/xrefcheck/releases/latest/download/release.tar.gz"
else
    URL="https://github.com/serokell/xrefcheck/releases/download/v$VERSION/release.tar.gz"
fi

case "$ACTION" in
  "run" )
    need_run=true
    ;;
  "install" )
    echo "xrefcheck will installed but not launched"
    need_run=false
    ;;
  * )
    echo 1>&2 "Unexpected action: $ACTION"
    exit 1
    ;;
esac

# Download xrefcheck archive and unpack it.
echo "Downloading xrefcheck version $VERSION"
wget --quiet -O - "$URL" | tar xz

# Move the executable into `bin/xrefcheck` and remove everything else
# so that it doesn't interfere with anything.
mkdir -p bin/
xrefcheck_path="bin/xrefcheck"
mv xrefcheck/bin/xrefcheck "$xrefcheck_path"
rm -rf xrefcheck/

# Run xrefcheck.
if [ "$need_run" == true ]; then
  set -x
  ./$xrefcheck_path $1
  set +x
fi

echo "::set-output name=xrefcheck-path::$xrefcheck_path"
