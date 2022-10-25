<!--
   - SPDX-FileCopyrightText: 2020 Serokell <https://serokell.io>
   -
   - SPDX-License-Identifier: MPL-2.0
   -->

# GitHub Action for xrefcheck

[![REUSE status](https://api.reuse.software/badge/github.com/serokell/xrefcheck-action)](https://api.reuse.software/info/github.com/serokell/xrefcheck-action)

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

To run `xrefcheck-0.2.2` on your repository in the `local-only` mode:

```yaml
jobs:
  xrefcheck:
    name: Check references
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: serokell/xrefcheck-action@v1
      with:
        xrefcheck-version: 0.2.2
        xrefcheck-args: --mode local-only
```

### Supported versions

<!-- Make sure to update ci.yml when you update this list -->
- 0.1.2
- 0.1.3
- 0.2
- 0.2.1
- 0.2.2

#### Updating supported versions

When a new `xrefcheck` version is released and you want it to be supported by this action, do the following:
1. Add one more check to [CI](/.github/workflows/ci.yml).
2. Update the list of supported versions above.
Optional: update the above example to use the latest version.
3. If necessary (e. g. if `xrefcheck` is distributed differently), update implementation of _this_ action.
If you do it, a new version of this action should be created, which means that a new tag should be pushed.
If there is more than one tag referring to some version, such as `v1` and `v1.0.1`, some tag may have to force-pushed.

## For Contributors

Please see [CONTRIBUTING.md](.github/CONTRIBUTING.md) for more information.

## About Serokell

Xrefcheck and this repository are maintained and funded with ❤️ by [Serokell](https://serokell.io/).
The names and logo for Serokell are trademark of Serokell OÜ.

We love open source software! See [our other projects](https://serokell.io/community?utm_source=github) or [hire us](https://serokell.io/hire-us?utm_source=github) to design, develop and grow your idea!
