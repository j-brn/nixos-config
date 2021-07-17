{super, ... }:
{
   qemu = super.qemu.overrideAttrs (old: {
      patches = old.patches ++ [
        #./0001-disable-evdev-capture-on-start.patch
        ./0002-use-iothread-for-evdev.patch
      ];
   });
}
