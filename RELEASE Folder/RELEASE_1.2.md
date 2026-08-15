# PyDeployCLI v1.2 Release

## 08/15/2026

## Improvements & Bug Fix
All Improvements Were Done In Order:
- `install.sh` was updated to include the installation of `python3` in the case users didn't already have it installed.
- Possible Bug Fix: Updated the instruction to run the one-line install from `sudo pydeploy` to just `pydeploy`.
> This was needed because running `sudo pydeploy` made the program run as `root`, changing its home directory and file permissions.
- The wait time for the `status` section was cut from 5 to 2 seconds to keep it more fast paced.
- README: An uninstall command was added for anyone who wants to remove the one-line install, and it's updated accordingly to the new v1.2 release.
