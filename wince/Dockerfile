FROM i386/debian:stable

RUN apt-get update \
    && apt-get install -y --no-install-recommends wget libmpfr-dev gettext lcab \
	ca-certificates zip ssh git-core xsltproc \
    cmake build-essential librsvg2-bin gcc binutils \
	 && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY pocketpc-cab_1.0.1-2_all.deb /
RUN dpkg -i /pocketpc-cab_1.0.1-2_all.deb \
    && rm -f /pocketpc-cab_1.0.1-2_all.deb

RUN wget -c http://cfhcable.dl.sourceforge.net/project/cegcc/cegcc/0.59.1/mingw32ce-0.59.1.tar.bz2 \
	-O mingw32ce-0.59.1.tar.bz2 --no-check-certificate && tar xvjpf mingw32ce-0.59.1.tar.bz2 \
	&& rm mingw32ce-0.59.1.tar.bz2

RUN ln -s /usr/lib/i386-linux-gnu/libmpfr.so /usr/lib/i386-linux-gnu/libmpfr.so.1 && ln -s /usr/lib/i386-linux-gnu/libgmp.so /usr/lib/i386-linux-gnu/libgmp.so.3

RUN mkdir /var/lib/apt/lists/partial
ENV MINGW32CE_PATH="/opt/mingw32ce"
ENV PATH=$PATH:$MINGW32CE_PATH/bin

