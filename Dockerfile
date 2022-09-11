# syntax=docker/dockerfile:1

ARG LINGUIST_VERSION="7.22.1"
ARG ALPINE_VERSION="3.16"

FROM alpine:${ALPINE_VERSION}
ARG LINGUIST_VERSION
RUN apk --update --no-cache add \
    git \
    ruby \
    ruby-rugged \
    ruby-charlock_holmes \
    ruby-json \
  && apk --update --no-cache add -t build-dependencies \
    build-base \
    cmake \
    icu-dev \
    ruby-dev \
  && gem install --no-document github-linguist -v ${LINGUIST_VERSION} \
  && git config --global --add safe.directory /repo \
  && apk del build-dependencies

VOLUME [ "/repo" ]

WORKDIR /repo
ENTRYPOINT [ "github-linguist" ]
