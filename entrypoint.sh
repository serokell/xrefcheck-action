#!/usr/bin/env bash

# This script downloads xrefcheck from GitHub releases, unpacks it
# and optionally runs.
# Inputs:
# • $VERSION is the version of xrefcheck, can be set to "latest".
# • $ACTION can be 'install' or 'run'.
# • $1 stores all command line arguments that will be passed to xrefcheck.

set -euo pipefail

if [ "$VERSION" = "latest" ]; then
    URL="https://github.com/serokell/xrefcheck/releases/latest/download/xrefcheck-x86_64-linux"
else
    URL="https://github.com/serokell/xrefcheck/releases/download/v$VERSION/xrefcheck-x86_64-linux"
fi

case "$ACTION" in
  "run" )
    need_run=true
    ;;
  "install" )
    echo "xrefcheck will be installed but not launched"
    need_run=false
    ;;
  * )
    echo 1>&2 "Unexpected action: $ACTION"
    exit 1
    ;;
esac

# Download xrefcheck and put it into `bin/xrefcheck`.
# We put it into `bin/` so that it's less likely to interfere with anything.
# Perhaps it's better to put it into some global location, we'll do it one day.
echo "Downloading xrefcheck version $VERSION"
mkdir -p bin/
xrefcheck_path="bin/xrefcheck"
wget --quiet -O "$xrefcheck_path" "$URL"
chmod +x "$xrefcheck_path"

# Run xrefcheck.
if [ "$need_run" == true ]; then
  set -x
  ./$xrefcheck_path $1
  set +x
fi

echo "::set-output name=xrefcheck-path::$xrefcheck_path"
