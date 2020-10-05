# The Kafe Homebrew tap

This is a custom [Homebrew](https://brew.sh) tap for libkafe source build.

## Setup

You can add the custom tap in a MacOS terminal session using:

```shell script
brew tap libkafe/kafe
```

## Installing Kafe

Once the tap has been added locally, you can install Kafe with:

```shell script
brew install libkafe
```

This command will download the latest available Kafe source archive, build the binaries locally
and install the `kafe` command line tool, as well as shared and static libkafe libaries and development
files.
