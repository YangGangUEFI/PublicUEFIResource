chcp 65001
if exist EfiFiles (
   echo "EfiFiles already exist!"
) else (
   md EfiFiles
)
copy Build\Ovmf3264\RELEASE_VS2022\X64\*.efi EfiFiles
copy Build\Ovmf3264\RELEASE_VS2022\IA32\*.efi EfiFiles
copy Build\Lvgl\DEBUG_GCC\X64\*.efi EfiFiles
"C:\Program Files\qemu\qemu-system-x86_64.exe" ^
  -m 2048 ^
  -pflash D:\OpenSource\edk2\Build\Ovmf3264\RELEASE_VS2022\FV\OVMF.fd ^
  -hda fat:rw:EfiFiles ^
  -cdrom D:\ravynOS_0.6.1_amd64.iso ^
  -hdb QemuRes\linux-disk.img ^
  -usb -device usb-mouse ^
  -serial stdio ^
  -global e1000.romfile="" ^
  -netdev tap,id=hostnet0,ifname=tap0,script=no,downscript=no ^
  -device e1000,netdev=hostnet0 ^
  -device virtio-rng-pci ^
  -drive file=D:\OpenSource\edk2\blknvme.img,if=none,id=nvm ^
  -device nvme,serial=deadbeef,drive=nvm ^
