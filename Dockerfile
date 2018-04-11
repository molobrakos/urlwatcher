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
  ;

COPY requirements.txt /app

RUN pip install -r requirements.txt \
  && rm requirements.txt \
  ;

COPY urlwatcher .

ENTRYPOINT ./urlwatcher
