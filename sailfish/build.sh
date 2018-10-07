#!/usr/bin/env bash
set -euo pipefail

SDK_VERSION="1807"
TARGET_VERSION="2.2.1.18"
SDK_NAME="Sailfish_OS-$TARGET_VERSION-Platform_SDK_Chroot-i486.tar.bz2"
SDK_URL="http://releases.sailfishos.org/sdk/installers/$SDK_VERSION/$SDK_NAME"


# correct chroot file rights
wget $SDK_URL
bunzip2 $SDK_NAME
tar xvf Sailfish_OS-$TARGET_VERSION-Platform_SDK_Chroot-i486.tar ./home/nemo/.bash_logout ./home/nemo/.bashrc ./home/nemo/.bash_profile ./var/spool/mail/nemo ./etc/group ./etc/passwd

tar --delete --file=Sailfish_OS-$TARGET_VERSION-Platform_SDK_Chroot-i486.tar ./home/nemo/.bash_logout ./home/nemo/.bashrc ./home/nemo/.bash_profile ./var/spool/mail/nemo ./etc/group ./etc/passwd ./home/nemo

sed -i 's/100000/1000/g' ./etc/passwd
sed -i 's/100000/1000/g' ./etc/group

chown -h 1000 ./home/nemo/ ./home/nemo/.bash_logout ./home/nemo/.bashrc ./home/nemo/.bash_profile ./var/spool/mail/nemo
chgrp -h 1000 ./home/nemo/ ./home/nemo/.bash_logout ./home/nemo/.bashrc ./home/nemo/.bash_profile

tar --append --file=Sailfish_OS-$TARGET_VERSION-Platform_SDK_Chroot-i486.tar ./home/nemo/ ./var/spool/mail/nemo ./etc/group ./etc/passwd

rm -rf ./home ./var ./etc 

# correct i486 file rights
wget https://releases.sailfishos.org/sdk/targets-$SDK_VERSION/Sailfish_OS-$TARGET_VERSION-Sailfish_SDK_Tooling-i486.tar.bz2
bunzip2 Sailfish_OS-$TARGET_VERSION-Sailfish_SDK_Tooling-i486.tar.bz2
echo "before extracting second time"
tar xvf Sailfish_OS-$TARGET_VERSION-Sailfish_SDK_Tooling-i486.tar ./home/nemo/.bash_logout ./home/nemo/.bashrc ./home/nemo/.bash_profile ./var/spool/mail/nemo ./etc/group ./etc/passwd
tar --delete --file=Sailfish_OS-$TARGET_VERSION-Sailfish_SDK_Tooling-i486.tar ./home/nemo/.bash_logout ./home/nemo/.bashrc ./home/nemo/.bash_profile ./var/spool/mail/nemo ./etc/group ./etc/passwd ./home/nemo
echo "after extracting second time"
sed -i 's/100000/1000/g' ./etc/passwd
sed -i 's/100000/1000/g' ./etc/group

chown -h 1000 ./home/nemo/ ./home/nemo/.bash_logout ./home/nemo/.bashrc ./home/nemo/.bash_profile ./var/spool/mail/nemo
chgrp -h 1000 ./home/nemo/ ./home/nemo/.bash_logout ./home/nemo/.bashrc ./home/nemo/.bash_profile

tar --append --file=Sailfish_OS-$TARGET_VERSION-Sailfish_SDK_Tooling-i486.tar ./home/nemo ./var/spool/mail/nemo ./etc/group ./etc/passwd
bzip2 Sailfish_OS-$TARGET_VERSION-Sailfish_SDK_Tooling-i486.tar
rm -rf ./home ./var ./etc

# Import it as a docker base image & build the full image
echo "Importing base image"
docker import Sailfish_OS-$TARGET_VERSION-Platform_SDK_Chroot-i486.tar "hoehnp/sailfishos-platform-sdk-base:$TARGET_VERSION"
echo "Importing base image: DONE"

echo "Building image"
docker build \
    --build-arg "SDK_VERSION=$SDK_VERSION" \
    --build-arg "TARGET_VERSION=$TARGET_VERSION" \
    -t "hoehnp/sailfishos-platform-sdk:$TARGET_VERSION" .
echo "Building image: DONE"

# Clean up after yourself
rm Sailfish_OS-$TARGET_VERSION-Sailfish_SDK_Tooling-i486.tar.bz2 Sailfish_OS-$TARGET_VERSION-Platform_SDK_Chroot-i486.tar

