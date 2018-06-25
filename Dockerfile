FROM python:3.6-slim-stretch

WORKDIR /app

VOLUME /cache

RUN set -x \
  && apt-get update \
  && apt-cache search dumb-init \
  && apt-get install -y \
  git gcc libxml2-dev dumb-init \
  && apt-get -y autoremove \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* \
  && rm -rf /var/tmp/* \
  ;

RUN useradd -M --home-dir /app urlwatcher \
  ;

COPY requirements.txt /app

RUN pip --no-cache-dir --trusted-host pypi.org install -r requirements.txt \
  && rm requirements.txt \
  ;

USER urlwatcher

COPY urlwatcher .

ENTRYPOINT [ "dumb-init", "--", "./urlwatcher" ]
