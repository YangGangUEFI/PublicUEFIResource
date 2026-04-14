"C:\Program Files\qemu\qemu-system-aarch64.exe" ^
   -m 256 -M romulus-bmc -nographic ^
   -drive file=./obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd ^
   -net nic ^
   -net user,hostfwd=::2222-:22,hostfwd=::2443-:443,hostfwd=udp::2623-:623,hostname=qemu