# msteams-profile

> Shell script to manage multiple Microsoft Teams profiles so you can sign in with multiple accounts on Linux.

This is the GitHub repository for `msteams-profile`, a shell script I developed to manage multiple Microsoft Teams profiles so I can sign into Microsoft Teams with more than one account (but sadly not at the same time).

Since my University started to use Microsoft Teams a lot as well as others I communicate with on my personal account, I wanted to sign into the desktop app with both accounts - hence this script was born.

Tested on Ubuntu Desktop, but it should work on other distributions too.

**Important:** Make sure Microsoft Teams is **closed** and **not running in the background** when switching profiles!

## System Requirements
 - Linux
 - Bash
 - [Microsoft Teams](https://www.microsoft.com/en-GB/microsoft-365/microsoft-teams/group-chat-software)


## Installation
Installation can be done in 2 ways:

### Via apt (recommended)
If you are on an apt-based system, you can install `msteams-profile` via my [personal apt repository](https://apt.starbeamrainbowlabs.com/).

Add the repository like so:

```bash
echo "deb https://apt.starbeamrainbowlabs.com/ ./ # apt.starbeamrainbowlabs.com" | sudo tee /etc/apt/sources.list.d/sbrl.list;
sudo curl -o /etc/apt/trusted.gpg.d/sbrl_msteams-profile.asc https://apt.starbeamrainbowlabs.com/aptosaurus.asc
```

Then, install it like so:

```bash
sudo apt update
sudo apt install msteams-profile
```

For those not on an apt-based system and have knowledge of your system's package manager, please help out with packaging efforts for other Linux distributions, and then the instructions here can be updated.


### Manual installation
There are 2 files in this repository that can be installed manually.

Firstly, `msteams-profile` is the main shell script. Put it somewhere that's in your `PATH` - I suggest `/usr/local/bin` if you have root access - otherwise `~/bin` should be fine.

Secondly, `msteams-profile-completion.bash` provides Bash completion support. Place it in `/usr/share/bash-completion/completions/` and call it `msteams-profile`. If you don't have sudo access, simply put it somewhere in your home directory and update your `~/.bashrc` file to `source` it like this:

```bash
source path/to/msteams-profile-completion.bash
```


## Usage
Usage is quite simple. When you first call the script, it'll transparently setup a `default` profile that contains your current Microsoft Teams profile data. Get the name of the currently active profile like this:

```bash
msteams-profile show
```

List all available profiles like this:

```bash
msteams-profile list
```

Switch to a profile like this (the profile will be created if it doesn't exist):

```bash
msteams-profile switch PROFILE_NAME_HERE
```

**Important:** Make sure Microsoft Teams is **closed** and **not running in the background** when switching profiles!


## How it works
This script works by moving your Microsoft Teams profile into a subdirectory, and then using symbolic links to point to the currently active profile. With this, it allows you to sign in to Microsoft Teams with multiple accounts.

The same principle should work on Windows too - just with NTFS directory junctions instead of symbolic links, and with different paths of course. I'd write a batch script, but I don't currently have a Windows computer upon which to develop one or the time to do so. Pull requests welcome :-)


## Contributing
Contributions are very welcome - both issues and pull requests! Please mention in your pull request that you release your work under the MPL-2.0 (see below).

If you're feeling that way inclined, the sponsor button at the top of the page (if you're on GitHub) will take you to my Liberapay profile if you'd like to donate to say an extra thank you :-)


## Licence
msteams-profile is released under the Mozilla Public License 2.0. The full license text is included in the `LICENSE` file in this repository. Tldr legal have a [great summary](https://tldrlegal.com/license/mozilla-public-license-2.0-(mpl-2)) of the license if you're interested.
