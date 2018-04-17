# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=Spitfire
do.devicecheck=1
do.modules=1
do.cleanup=1
do.cleanuponabort=0
device.name1=santoni
device.name2=
device.name3=
device.name4=
device.name5=
} # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;


## AnyKernel install
dump_boot;

# begin ramdisk changes

#add init script
insert_line init.rc "import /init.spitfire.rc" after "import /init.environ.rc" "import /init.spitfire.rc";

#lazytime
patch_fstab fstab.qcom /system ext4 options "ro,barrier=1,discard" "ro,lazytime,barrier=1,discard"
patch_fstab fstab.qcom /data ext4 options "nosuid,nodev,barrier=1,noauto_da_alloc,discard" "nosuid,nodev,lazytime,barrier=1,noauto_da_alloc,discard"
patch_fstab fstab.qcom /cust ext4 options "ro,nosuid,nodev,barrier=1" "ro,nosuid,nodev,lazytime,barrier=1"

# end ramdisk changes

write_boot;

## end install

