# syntax=docker/dockerfile:1

ARG LINGUIST_VERSION=9.2.0
ARG ALPINE_VERSION=3.22

FROM alpine:${ALPINE_VERSION}
ARG LINGUIST_VERSION
RUN apk --update --no-cache add \
    git \
    ruby \
    ruby-charlock_holmes \
  && apk --update --no-cache add -t build-dependencies \
    build-base \
    cmake \
    icu-dev \
    py3-python-gssapi \
    openssl-dev \
    ruby-dev \
  && gem install --no-document github-linguist -v ${LINGUIST_VERSION} \
  && git config --global --add safe.directory /repo \
  && apk del build-dependencies

VOLUME [ "/repo" ]

WORKDIR /repo
ENTRYPOINT [ "github-linguist" ]
