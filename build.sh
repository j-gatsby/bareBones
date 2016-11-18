set -e

echo Compiling bootloader...
i686-elf-as boot.s -o boot.o

echo Compiling kernel...
i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

echo Linking...
i686-elf-gcc -T linker.ld -o myOS.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc

echo Verifying multiboot header...
if grub-file --is-x86-multiboot myOS.bin; then
	echo multiboot confirmed
else
	echo file is not multiboot
fi

echo Success.

