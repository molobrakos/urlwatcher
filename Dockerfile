FROM python:3.6-slim-stretch

WORKDIR /app

VOLUME /cache

RUN set -x \
  && apt-get update \
  && apt-cache search dumb-init \
  && apt-get install -y \
  git gcc libxml2-dev dumb-init \
  \
  # install lib deps for chrome
  # see https://github.com/GoogleChrome/puppeteer/blob/master/docs/troubleshooting.md#running-puppeteer-in-docker
  # https://github.com/miyakogi/pyppeteer/issues/60#issuecomment-385858294
  gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget \
  \
  && apt-get -y autoremove \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* \
  && rm -rf /var/tmp/*
  && rm -rf /var/tmp/* \
  && useradd -M --home-dir /app urlwatcher \
  ;

COPY requirements.txt /app

RUN pip --no-cache-dir --trusted-host pypi.org install -r requirements.txt \
  && rm requirements.txt \
  ;

USER urlwatcher

COPY urlwatcher .

ENTRYPOINT [ "dumb-init", "--", "./urlwatcher" ]
