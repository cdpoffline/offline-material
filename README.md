# Offline Material

These materials can be served in case the dojo has no or bad internet connection. They can be distributed via a local website through activating the [`http-server`](https://github.com/cdpoffline/http-server) module or copied onto USB-sticks. You can watch a small [video](https://www.youtube.com/watch?v=C_XpfdWB7Q8&feature=em-upload_owner#action=share) about it, have a look at an [example setup](https://cdpoffline.github.io/try-it), or see the [`overview`](https://github.com/cdpoffline/overview/#overview) module for more content.

There are several [modules](./modules) available which you can use. Contributions welcome.

## Installation

This was tested on Ubuntu 14 and 15.
To download and install, download the file [`download_and_install.sh`](bin/download_and_install.sh) and execute it.
It will download the repository and call [`install.sh`](bin/install.sh). If you already have downloaded or cloned the repository, you just need to execute [`install.sh`](bin/install.sh).

## Usage

Once installed, you can use [`modules.sh`](bin/modules.sh).
You can activate, deactivate and update modules.

- Show usage:

        bin/modules.sh

- activate one of the [modules](./modules) [`lightbot`](https://github.com/cdpoffline/lightbot/)

        bin/modules.sh -a lightbot

- update the overview to include all activated modules

        bin/modules.sh -u overview

## Developers

You can find the available modules in the [`modules` folder](modules).

New modules can be added, `lightbot` as an example:

    git submodule add git@github.com:cdpoffline/lightbot.git modules/lightbot

You can use [bin/modules_do.sh](bin/modules_do.sh) to perform actions on all modules.

    bin/modules_do.sh git pull
    bin/modules_do.sh git status
