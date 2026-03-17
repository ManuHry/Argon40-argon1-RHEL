# Work-in-Progress RHEL-based Argon ONE scripts

[![SHA-256 checksums generation](https://github.com/ManuHry/Argon40-argon1-RHEL/actions/workflows/argon40-checksums-regenerate.yml/badge.svg?branch=RHEL-compat)](https://github.com/ManuHry/Argon40-argon1-RHEL/actions/workflows/argon40-checksums-regenerate.yml)

## Reference

Source code is based on [okunze/Argon40-ArgonOne-Script](https://github.com/okunze/Argon40-ArgonOne-Script/) for simplicity. Quality and reliability seems enough.

> [!TIP]
> Using corresponding \*.\***.sha256** files you can compare checksums with original files... or even generate checksums manually!

> [!NOTE]
> Argon ONE V5 and Argon ONE UP scripts added upstream at 03/17/2026, check **.csv* file on this repo root for more information.

## Why this repo

Main goal is to adapt existing [Argon Forty](https://argon40.com/blogs/argon-resources) ONE scripts to add compatibility for RHEL-based distros, like [Fedora](https://fedoraproject.org/wiki/Architectures/ARM/Raspberry_Pi), [AlmaLinux](https://wiki.almalinux.org/documentation/raspberry-pi.html) and [Rocky Linux](https://docs.rockylinux.org/10/release_notes/10_0/#supported-microarchitecture-levels) that has native Raspberry Pi support. *Gentle warning: check docs before as some OS versions does not support all Raspberry Pi revisions*

> [!TIP]
> Files that has been edited are named *\***-custom**.\** to be easily identifiable.

## How to use (at your own risks!)

> [!WARNING]
> Dependencies are still downloaded from Argon Forty server. If you want to avoid any conflict, host files locally and adapt ARGONDOWNLOADSERVER var.

Simply use the good old dirty command from Argon Forty (change path as your needs):
```Shell
curl https://PATH_OF_HOSTED_FILES/argon1-custom.sh | bash
```

And if you need Argon Forty NTP script with pool.net.org instead of Google:
```Shell
curl -k https://PATH_OF_HOSTED_FILES/tools/setntpserver-custom.sh | bash
```

## Progress report

Implemented modifications:
- [x] migrate from Google time servers to [pool.ntp.org](https://www.ntppool.org/)
- [x] add SHA256 checksums of original files to allow comparison with Argon Forty servers
- [x] add RHEL detection and use dnf (perhaps yum for legacy compatibility? *quite odd...*)
- [x] append already existing packages detection *(for example wget and python3 can be missing on minimal setups)*
- [x] rectify Argon Forty download server references to already existing var

Waiting merge:
- [ ] add AlmaLinux rpi-eeprom-update procedure
- [ ] prepare downloaded files for RHEL compatibility?
- [ ] prepare wget detection for upcoming RHEL 11+ (wget2!)
- [ ] probably more...

## Tests and reported compatibility matrix

> [!CAUTION]
> **DO NOT USE ON PRODUCTION!**

> [!IMPORTANT]
> Some tests are needed... please report if following works for you:
> - installation script does not return any error
> - argononed.service starts without warnings
> - you can change behaviours with argonone-config
> - fans turns ou/off and adapt speed to temperatures
> - shutdown button works as expected (test short press, double tap and long press >3s!)
> - anything useful

Icons | Meaning
:---: | :-----:
✅ | works / no issues detected
🚧 | works partially
❓ | needs as-is testing
❌ | does not work
💤 | currently not planned
👽 | no OS support for this RPi rev.
⏲ | waiting for code readyness

RPi rev. | Argon ONE rev. | Specificity |  OS version | Status | Comment
:------: | :------------: | :---------: |  :--------: | :----: | :-----:
CM5 | UP | *👻 none* | Fedora 42+ | 👽
CM5 | UP | *👻 none* | AlmaLinux 8+ | 💤 | needs argononeup.sh modification
CM5 | UP | *👻 none* | Rocky Linux 8+ | 💤 | needs argononeup.sh modification
🚀 5 | V5 | *👻 none* | Fedora 42+ | 👽
🚀 5 | V5 | *👻 none* | AlmaLinux 8+ | 💤 | needs argononev5.sh modification
🚀 5 | V5 | *👻 none* | Rocky Linux 8+ | 💤 | needs argononev5.sh modification
🚀 5 | V3 | *👻 none* | Fedora 42+ | 👽
🚀 5 | V3 | *👻 none* | AlmaLinux 8+ | ❓
🚀 5 | V3 | *👻 none* | Rocky Linux 8+ | ❓
🐢 4 | V2 | *👻 none* | Fedora 42+ | ❓
🐢 4 | V2 | *👻 none* | AlmaLinux 8+ | ❓
🐢 4 | V2 | *👻 none* | Rocky Linux 8+ | ❓
🐌 3 | *legacy* | *👻 none* | Fedora 42+ | ❓
🐌 3 | *legacy* | *👻 none* | AlmaLinux 8+ | ❓
🐌 3 | *legacy* | *👻 none* | Rocky Linux 10+ | 👽
🐌 3 | *legacy* | *👻 none* | Rocky Linux 8-9 | ❓
Zero 2 W | *👻 none* | 🔬 distro PoC | Fedora 42+ | 🚧 | argononed.service starts... 🤔
Zero 2 W | *👻 none* | 🔬 distro PoC | AlmaLinux 8+ | 🚧 | argononed.service starts... 🤔
Zero 2 W | *👻 none* | 🔬 distro PoC | Rocky Linux 8+ | 🚧 | argononed.service starts... 🤔
<!--
🌠 5 | V5 | M.2 NVMe PCIe | Fedora 42+ | 👽
🌠 5 | V5 | M.2 NVMe PCIe | AlmaLinux 8+ | 💤
🌠 5 | V5 | M.2 NVMe PCIe | Rocky Linux 8+ | 💤
🌠 5 | V3 | M.2 NVMe PCIe | Fedora 42+ | 👽
🌠 5 | V3 | M.2 NVMe PCIe | AlmaLinux 8+ | 💤
🌠 5 | V3 | M.2 NVMe PCIe | Rocky Linux 8+ | 💤
🛩️ 4 | V2 | M.2 NVMe USB 3.0 | Fedora 42+ | 💤
🛩️ 4 | V2 | M.2 NVMe USB 3.0 | AlmaLinux 8+ | 💤
🛩️ 4 | V2 | M.2 NVMe USB 3.0 | Rocky Linux 8+ | 💤
🚗 4 | V2 | M.2 SATA USB 3.0 | Fedora 42+ | 💤
🚗 4 | V2 | M.2 SATA USB 3.0 | AlmaLinux 8+ | 💤
🚗 4 | V2 | M.2 SATA USB 3.0 | Rocky Linux 8+ | 💤
-->
