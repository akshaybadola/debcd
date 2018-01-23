#! /bin/bash

apt-get install --print-uris -y -d $1 | grep -o "'.*" | sed 's!\(cdrom.*\)\(Binary\-\)\([0-9]\)\(.*\)\(/pool.*\)!file:///mnt/deb\3\5!' | sed "s/\(.*deb'\)\(.*\)/\1/" | sed "s/'//g" > package_list
pkg_list=($(cat package_list))

# hack to use cp when protocol is file:// as wget doesn't support that
# curl is not installed on a default debian xfce install
for i in ${pkg_list[*]}
    do if [ 'file' = ${i:0:4} ]
        then cp ${i/file:\/\//} ./
    else wget $i
    fi
done


#apt-get --reinstall --print-uris --yes -d install $1 | grep ^\' | cut -d\' -f 2 > download.list
#for i in $(cat download.list); do curl $i -o $(basename $i); done

## hack for copying without curl
#for i in $(cat download.list); do i=${i/file:\/\/}; cp $i $(basename $i); done
