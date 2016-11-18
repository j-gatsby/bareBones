mkdir -p isodir/boot/grub
cp myOS.bin isodir/boot/myOS.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o myOS.iso isodir

