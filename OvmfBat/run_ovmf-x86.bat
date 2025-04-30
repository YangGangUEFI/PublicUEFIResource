chcp 65001
if exist EfiFiles (
   echo "EfiFiles already exist!"
) else (
   md EfiFiles 
)
copy Build\Ovmf3264\DEBUG_VS2022\X64\*.efi EfiFiles
copy Build\Ovmf3264\DEBUG_VS2022\IA32\*.efi EfiFiles
"C:\Program Files\qemu\qemu-system-x86_64.exe" ^
  -m 2048 ^
  -pflash D:\OpenSource\edk2\Build\Ovmf3264\DEBUG_VS2022\FV\OVMF.fd ^
  -hda fat:rw:EfiFiles ^
  -cdrom D:\OS\zh-cn_windows_10_business_editions_version_21h2_updated_march_2022_x64_dvd_63c593c1.iso ^
  -hdb QemuRes\linux-disk.img ^
  -usb -device usb-mouse ^
  -serial stdio ^
  -global e1000.romfile="" ^
  -netdev tap,id=hostnet0,ifname=tap0,script=no,downscript=no ^
  -device e1000,netdev=hostnet0 ^
  -device virtio-rng-pci ^