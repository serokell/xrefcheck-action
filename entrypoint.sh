#!/bin/sh

set -euo pipefail

wget -O - "https://github.com/serokell/xrefcheck/releases/download/v0.1.1/release.tar.gz" | tar xzv
xrefcheck/bin/xrefcheck --ignored xrefcheck
