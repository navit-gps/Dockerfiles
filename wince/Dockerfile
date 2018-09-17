FROM i386/debian:stable

RUN apt-get update \
# RUN dpkg --add-architecture i386 \
#     && apt-get update \
    && apt-get install -y --no-install-recommends wget libmpfr-dev gettext lcab \
	ca-certificates zip ssh git-core xsltproc \
    # cmake:i386 build-essential:i386 librsvg2-bin:i386 gcc:i386 binutils:i386 \
    cmake build-essential librsvg2-bin gcc binutils \
	 && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget http://snapshot.debian.org/archive/debian-archive/20110127T084257Z/debian/pool/main/p/pocketpc-cab/pocketpc-cab_1.0.1-2_all.deb \
    && dpkg -i pocketpc-cab_1.0.1-2_all.deb \
    && rm -f pocketpc-cab_1.0.1-2_all.deb

RUN wget -c http://cfhcable.dl.sourceforge.net/project/cegcc/cegcc/0.59.1/mingw32ce-0.59.1.tar.bz2 \
	-O mingw32ce-0.59.1.tar.bz2 --no-check-certificate && tar xvjpf mingw32ce-0.59.1.tar.bz2 \
	&& rm mingw32ce-0.59.1.tar.bz2

RUN mkdir /var/lib/apt/lists/partial
ENV MINGW32CE_PATH="/opt/mingw32ce"
ENV PATH=$PATH:$MINGW32CE_PATH/bin

