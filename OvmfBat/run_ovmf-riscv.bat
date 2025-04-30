chcp 65001
"C:\Program Files\qemu\qemu-system-riscv64.exe" ^
 -M virt,pflash0=pflash0,pflash1=pflash1,acpi=off ^
 -m 4096 -smp 2 ^
 -serial mon:stdio ^
 -device virtio-gpu-pci ^
 -device qemu-xhci ^
 -device usb-kbd ^
 -device virtio-rng-pci ^
 -blockdev node-name=pflash0,driver=file,read-only=on,filename=RISCV_VIRT_CODE.fd ^
 -blockdev node-name=pflash1,driver=file,filename=RISCV_VIRT_VARS.fd ^