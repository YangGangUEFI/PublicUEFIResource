@REM truncate -s 64M Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/FV/QEMU_EFI.fd
chcp 65001

if exist EfiFiles (
   echo "EfiFiles already exist!"
) else (
   md EfiFiles
)
copy Build\ArmVirtQemu-AARCH64\RELEASE_GCC5\AARCH64\*.efi EfiFiles
copy Build\Lvgl\RELEASE_GCC5\AARCH64\*.efi EfiFiles

"C:\Program Files\qemu\qemu-system-aarch64.exe" ^
  -M virt ^
  -cpu cortex-a57 ^
  -pflash D:\OpenSource\edk2\Build\ArmVirtQemu-AARCH64\DEBUG_GCC5\FV\QEMU_EFI.fd ^
  -m 1024 ^
  -net none ^
  -serial stdio ^
  -hda fat:rw:EfiFiles ^
  -device virtio-rng-pci ^
  -device virtio-gpu-pci ^
  -device qemu-xhci,id=xhci ^
  -device usb-mouse,bus=xhci.0 ^
  -device usb-kbd,bus=xhci.0 ^