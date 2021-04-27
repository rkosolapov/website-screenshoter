FROM node

# variables can be overwritten with -e (or with WSP AWS UI)
ENV PORT="80"
ENV DEBUG_LEVEL="debug"
ENV ENGINE="slimerjs"
ENV USER=""
ENV PASSWORD=""

# w/a for "module phantomjs not found"
ENV TMPDIR="/tmp"

ENV DEBIAN_FRONTEND noninteractive

# we have to install firefox 58 because it's the last version that slimerjs supports
RUN apt update && \
    apt -y install \
    	    build-essential xvfb libfontconfig libfreetype6 \
            packagekit-gtk3-module \
            libc6 libstdc++6 libgcc1 libgtk2.0-0 libasound2 libxrender1 libdbus-glib-1-2 && \
    wget -O /tmp/firefox64.deb https://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt/pool/main/f/firefox-mozilla-build/firefox-mozilla-build_58.0.2-0ubuntu1_amd64.deb && \
    apt install /tmp/firefox64.deb && \
    npm install -g slimerjs && \
    npm install -g phantomjs && \
    npm install -g manet && \
    apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY start.sh /usr/local/bin/start.sh

# w/a for "could not load the shared library:dso_lib.c"
ENV OPENSSL_CONF="/etc/ssl/"

# slimerjs requires this
ENV SLIMERJSLAUNCHER="/usr/bin/firefox"

EXPOSE ${PORT}
CMD "start.sh"