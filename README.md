# debcd
Scripts and configs for making an unattended debian install CD

If a similar environment is to be installed over many systems then it
helps to have an unattended installation disk. It can be prepared from
the Debian distribution DVDs/CD and Debian is readily configurable in
that regard.

To create such a disk a new disk has to be authored with the required
packages if you want the install to be completely offline. All of that
can be configured in the *preseed.cfg* which is included in the
scripts. If a network is available then the packages need not be
included and the network can be configured and the packages installed
using _pkgsel_.


Rest of the options and others can be obtained from a debian
environment using debconf-get-selections {--installer}, and then can
be set accordingly in the *preseed.cfg*.

The steps are mentioned in the Steps file.