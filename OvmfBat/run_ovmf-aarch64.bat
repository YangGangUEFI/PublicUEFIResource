chcp 65001
"C:\Program Files\qemu\qemu-system-aarch64.exe" ^
  -M virt ^
  -cpu cortex-a57 ^
  -pflash D:\OpenSource\edk2\Build\ArmVirtQemu-AARCH64\RELEASE_GCC5\FV\QEMU_EFI.fd ^
  -m 1024 ^
  -net none ^
  -serial stdio ^
  -hda fat:rw:EfiFiles ^
  -device virtio-rng-pci ^
  -device virtio-gpu-pci ^
  -device qemu-xhci,id=usb ^
  -device usb-tablet,id=input0,bus=usb.0,port=1 ^
  -device usb-kbd,id=input1,bus=usb.0,port=2 ^