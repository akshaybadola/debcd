The various scripts need be inspected more carefully to gain a deeper
understanding of what's happening. One has to adapt the paths
etc. according to the environment.

Steps to build the complete debian bootdisk:

1. Install the required components in a minimal debian environment. It
can be gui or without depending on the target systems as they are
intended to inherit the same environment.

2. Extract the contents of the cd using some tool. I used **7zip** and
named the target directory "deb".

3. Create a directory for the ".deb" files which will act as your
local cache. I've used "files" as the directory name.

4. Place the script **getpacks.sh** in that directory and run it with
the package name as argument. It'll get that package and the
dependencies based on the currently installed packages in the system.

5. After all the required packages are there in the cache, run
`apt-move -c apt-move.conf move`, though it'll complain about
corruption. In that case, run `apt-move -c apt-move.conf fsck` and
then *apt-move -c apt-move.conf move*.

6. To override the priorities of the packages so that all the packages
you've cached are installed you have to replace all "optional" and
"extra" priorities with "standard" except for the grub-* packages. An
example **override** file is also present in the scripts directory.

7. After that run `./debcd.sh`, which will generate all files and
checksums for all the packages in the pool.

8. After that `./preseed.sh` which generates the final iso and copies it
via **scp** to some machine. That can be omitted.

