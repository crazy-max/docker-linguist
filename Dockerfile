FROM alpine:3.9

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL maintainer="CrazyMax" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="linguist" \
  org.label-schema.description="GitHub Language Savant to detect blob languages." \
  org.label-schema.version=$VERSION \
  org.label-schema.url="https://github.com/crazy-max/docker-linguist" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vcs-url="https://github.com/crazy-max/docker-linguist" \
  org.label-schema.vendor="CrazyMax" \
  org.label-schema.schema-version="1.0"

ENV VERSION="7.3.1"

RUN apk --update --no-cache add \
    ruby \
    ruby-rugged \
    ruby-charlock_holmes \
    ruby-json \
  && apk --update --no-cache add -t build-dependencies \
    build-base \
    cmake \
    icu-dev \
    ruby-dev \
  && gem install --no-ri --no-rdoc github-linguist -v ${VERSION} \
  && apk del build-dependencies \
  && rm -rf /var/cache/apk/*

VOLUME [ "/repo" ]

WORKDIR /repo
ENTRYPOINT [ "github-linguist" ]
