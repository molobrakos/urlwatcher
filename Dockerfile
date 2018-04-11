FROM python:3.6-slim

WORKDIR /app

VOLUME /cache

RUN set -x \
  && apt-get update \
  && apt-get install -y \
  git gcc libxml2-dev \
  && apt-get -y autoremove \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* \
  && rm -rf /var/tmp/* \
  && git clone https://github.com/molobrakos/urlwatcher.git \
  && pip install -r urlwatcher/requirements.txt \
  ;

ENTRYPOINT urlwatcher/urlwatcher
