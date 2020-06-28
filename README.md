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
* `action` can be set to `install` if just want to install the tool and then use it manually.
This functionality is experimental and maybe be reworked later.

### Outputs

`xrefcheck-path` output will contain a relative path to the `xrefcheck` executable.
In a future version it may contain an absolute path.

### Example

To run `xrefcheck-0.1.2` on your repository in the `local-only` mode:

```yaml
jobs:
  xrefcheck:
    name: Check references
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: serokell/xrefcheck-action@v1
      with:
        xrefcheck-version: 0.1.2
        xrefcheck-args: --mode local-only
```

### Supported versions

<!-- Make sure to update ci.yml when you update this list -->
- 0.1.2

## For Contributors

Please see [CONTRIBUTING.md](.github/CONTRIBUTING.md) for more information.

## About Serokell

Xrefcheck and this repository are maintained and funded with ❤️ by [Serokell](https://serokell.io/).
The names and logo for Serokell are trademark of Serokell OÜ.

We love open source software! See [our other projects](https://serokell.io/community?utm_source=github) or [hire us](https://serokell.io/hire-us?utm_source=github) to design, develop and grow your idea!
