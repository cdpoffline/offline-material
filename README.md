# Offline Material

These materials can be served in case the dojo has no internet connection.

## Installation

To download and install use download the file [`download_and_install.sh`](bin/download_and_install.sh) and excute it.
It will download the repository and call [`install.sh`](bin/install.sh). If you already have downloaded it, you just need to execute [`install.sh`](bin/install.sh).

## Usage

Once installed, you can use [`modules.sh`](bin/modules.sh).
You can activate, deactivate and update modules.

- Show usage:

        modules.sh

- activate [lightbot](modules/lightbot)

        modules.sh -a lightbot

- update the overview to include all activated modules

        modules.sh -u overview

## Modules

New modues can be added, `lightbot` as an example:

    git submodule add git@github.com:cdpoffline/lightbot.git modules/lightbot
