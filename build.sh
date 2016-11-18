set -e

echo Assembling bootloader...
i686-elf-as boot.s -o boot.o

echo Compiling kernel...
i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

echo Linking object files...
i686-elf-gcc -T linker.ld -o myOS.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
echo NOTE: We use the compiler as the linker, as it
echo allows for greater control over the link process.

echo Verifying multiboot header...
if grub-file --is-x86-multiboot myOS.bin; then
	echo Multiboot confirmed
else
	echo File is not multiboot
fi

echo Success.

