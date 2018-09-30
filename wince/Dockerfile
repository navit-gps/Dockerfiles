FROM navit/ubuntu:8.04

RUN apt-get update && apt-get install -y --no-install-recommends wget build-essential libmpfr-dev gettext pocketpc-cab \
	ca-certificates zip ssh librsvg2-bin xsltproc \
	 && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -c http://cfhcable.dl.sourceforge.net/project/cegcc/cegcc/0.59.1/mingw32ce-0.59.1.tar.bz2 \
	-O mingw32ce-0.59.1.tar.bz2 --no-check-certificate && tar xvjpf mingw32ce-0.59.1.tar.bz2 \
	&& rm mingw32ce-0.59.1.tar.bz2

# RUN wget http://www.cmake.org/files/v3.2/cmake-3.2.0-Linux-i386.sh --no-check-certificate && \
COPY cmake-3.2.0-Linux-i386.sh /
RUN yes | bash /cmake-3.2.0-Linux-i386.sh --prefix /usr/local && rm /cmake-3.2.0-Linux-i386.sh

RUN mkdir /var/lib/apt/lists/partial
ENV MINGW32CE_PATH="/opt/mingw32ce"
ENV PATH=$PATH:$MINGW32CE_PATH/bin:/cmake-3.2.0-Linux-i386/bin/
