#! /bin/bash

apt-ftparchive generate config-deb

apt-ftparchive -c config-rel release deb/dists/stretch > deb/dists/stretch/Release

cd deb
md5sum `find ! -name "md5sum.txt" ! -path "./isolinux/*" -follow -type f` > md5sum.txt
cd ..
