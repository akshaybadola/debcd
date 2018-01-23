#! /bin/bash

if [ -f deb/install.amd/initrd.gz ]
    then rm deb/install.amd/initrd.gz
fi

if [ -f initrd.gz ]
    then rm initrd.gz
fi

cp clean_initrd.gz initrd.gz
gunzip -f initrd.gz

if [ -f initrd.gz ]
   then echo "exists"
fi

echo "preseed.cfg" | cpio -o -H newc -A -F initrd
gzip -f initrd
cp initrd.gz deb/install.amd/

xorriso -as mkisofs -o test.iso -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin -no-emul-boot -boot-load-size 4 -boot-info-table -b isolinux/isolinux.bin -c isolinux/boot.cat deb

# easier to scp from virtualbox which I was using as the deb environment
# The ssh keys are stored on the target machine
scp test.iso joe@mymachine:~
