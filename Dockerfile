FROM node:4.4.3

RUN apt-get update \
    && apt-get install -y -q \
      build-essential \
      redis-server \
      libpng-dev \
      git \
      python-minimal \
    && rm -rf /var/lib/apt/lists/* \
    && npm -g install npm --loglevel warn --depth=-1 \
    && npm -g update --loglevel warn \
    && git clone -b stable http://github.com/vatesfr/xo-server /xo-server \
    && git clone -b stable http://github.com/vatesfr/xo-web /xo-web \
    && cd /xo-server \
    && npm install --loglevel warn --depth=-1 \
    && npm run build --loglevel warn \
    && cd /xo-web \
    && npm install --loglevel warn --depth=-1 \
    && npm run build --loglevel warn
