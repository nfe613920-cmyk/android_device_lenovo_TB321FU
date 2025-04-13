# TWRP device tree for Lenovo Legion Y700 (2025) (TB321FU)

8.8 inch a high-end tablet with snapdragon 8 gen 3.

## Flash instructions
1. Download recovery image from release page.
2. Unlock bootloader
3. Flash recovery
   - Launch bootloader then run the following command.
   ```sh
   fastboot flash recovery twrp-downloaded-file-name.img
   ```

## Supported features

Blocking checks
- [v] Correct screen/recovery size
- [v] Working Touch, screen
- [v] Backup to internal/microSD
- [v] Restore from internal/microSD
- [v] reboot to system
- [v] ADB

Medium checks
- [ ] update.zip sideload
- [v] UI colors (red/blue inversions)
- [v] Screen goes off and on
- [v] F2FS/EXT4 Support, exFAT/NTFS where supported
- [v] all important partitions listed in mount/backup lists
- [ ] backup/restore to/from external (USB-OTG) storage (not supported by the device)
- [ ] backup/restore to/from adb (https://gerrit.omnirom.org/#/c/15943/)
- [v] decrypt /data
- [v] Correct date

Minor checks
- [v] MTP export
- [v] reboot to bootloader
- [v] reboot to recovery
- [ ] poweroff
- [v] battery level
- [v] temperature
- [ ] encrypted backups
- [ ] input devices via USB (USB-OTG) - keyboard, mouse and disks (not supported by the device)
- [ ] USB mass storage export
- [v] set brightness
- [ ] vibrate
- [ ] screenshot
- [ ] partition SD card

## Note
1. Based on TWRP 3.7.1
2. Includes following patches
    a. Add gatekeeper and boot AIDL support for /data decrytion.
    b. Fix for a graphical glitch
        - https://github.com/polygraphene/android\_bootable\_recovery/commit/4e4dd385974e275fac5f894bf7ad00fb17004e62
    c. Fix for landscape theme
        - https://github.com/polygraphene/android\_device\_lenovo\_TB320FC/pull/2#issuecomment-2525420584
    d. Support for work profile decryption
        - https://github.com/TeamWin/Team-Win-Recovery-Project/issues/1256#issuecomment-2414079092

## Device specifications

Component              | Model
----------------------:|:-------------------------
SoC                    | Qualcomm SM8650-AB Snapdragon 8 Gen 3 (4 nm)
CPU                    | Octa-core (1x3.3 GHz Cortex-X4 & 3x3.2 GHz Cortex-A720 & 2x3.0 GHz Cortex-A720 & 2x2.3 GHz Cortex-A520)
GPU                    | Adreno 750
Memory                 | 12GB / 16GB
Storage                | UFS 4.0 256GB / 512GB
Battery                | Li-Po 6550 mAh
Display                | 1600 x 2560 pixels (IPS LCD, 165Hz, 8.8 inches)
Release                | 2024, October

## To build 
```bash
# Fetch sources
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp -b twrp-12.1
repo sync -j 20 --force-sync

# Apply patches
(cd bootable/recovery; git fetch https://github.com/polygraphene/android_bootable_recovery android-12.1-TB321FU && git checkout FETCH_HEAD)
(cd hardware/interfaces; git fetch https://github.com/polygraphene/android_hardware_interfaces android-12.1-TB321FU && git checkout FETCH_HEAD)
(cd system/vold; git fetch https://github.com/polygraphene/android_system_vold android-12.1-TB321FU && git checkout FETCH_HEAD)

# Build
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch twrp_TB321FU-eng
mka recoveryimage
```
