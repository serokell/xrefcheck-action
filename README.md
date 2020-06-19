<!--
   - SPDX-FileCopyrightText: 2020 Serokell <https://serokell.io>
   -
   - SPDX-License-Identifier: MPL-2.0
   -->

# GitHub Action for xrefcheck

This repository contains a GitHub action that simplifies the usage of the [xrefcheck](https://github.com/serokell/xrefcheck) tool.

## Usage

By default this action installs the latest version of `xrefcheck` (it downloads a static binary from GitHub releases) and runs it with no arguments.

### Inputs

Please refer to [action.yml](./action.yml) for a full list of inputs.
Quick overview:
* `xrefcheck-version` lets you pick a specific version.
* `xrefcheck-args` lets you pass custom arguments.
* `action` can be used if just want to install the tool.

### Outputs

`xrefcheck-path` output will contain a relative path to the `xrefcheck` executable.

### Example

To run `xrefcheck-0.1.1` on your repository without progress reporting (since it doesn't look nice on CI):

```yaml
jobs:
  xrefcheck:
    name: Check references
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: serokell/xrefcheck-action@v1
      with:
        xrefcheck-version: 0.1.1
        xrefcheck-args: --no-progress
```

## For Contributors [↑](#-patak)

Please see [CONTRIBUTING.md](.github/CONTRIBUTING.md) for more information.

## About Serokell

Xrefcheck and this repository are maintained and funded with ❤️ by [Serokell](https://serokell.io/).
The names and logo for Serokell are trademark of Serokell OÜ.

We love open source software! See [our other projects](https://serokell.io/community?utm_source=github) or [hire us](https://serokell.io/hire-us?utm_source=github) to design, develop and grow your idea!
