FROM ubuntu:8.04

RUN apt-get update && apt-get install -y wget build-essential libmpfr-dev gettext git-core pocketpc-cab ca-certificates \
	 && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -c https://sourceforge.net/projects/cegcc/files/cegcc/0.59.1/mingw32ce-0.59.1.tar.bz2/download \
	-O mingw32ce-0.59.1.tar.bz2 --no-check-certificate && tar xvjpf mingw32ce-0.59.1.tar.bz2 \
	&& rm mingw32ce-0.59.1.tar.bz2

RUN wget http://www.cmake.org/files/v3.2/cmake-3.2.0-Linux-i386.sh --no-check-certificate && \
	yes | bash /cmake-3.2.0-Linux-i386.sh --prefix /usr/local && rm /cmake-3.2.0-Linux-i386.sh

ENV MINGW32CE_PATH="/opt/mingw32ce"
ENV PATH=$PATH:$MINGW32CE_PATH/bin:/cmake-3.2.0-Linux-i386/bin/

