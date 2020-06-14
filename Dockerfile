FROM --platform=${TARGETPLATFORM:-linux/amd64} alpine:3.11

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN printf "I am running on ${BUILDPLATFORM:-linux/amd64}, building for ${TARGETPLATFORM:-linux/amd64}\n$(uname -a)\n"

LABEL maintainer="CrazyMax" \
  org.opencontainers.image.created=$BUILD_DATE \
  org.opencontainers.image.url="https://github.com/crazy-max/docker-linguist" \
  org.opencontainers.image.source="https://github.com/crazy-max/docker-linguist" \
  org.opencontainers.image.version=$VERSION \
  org.opencontainers.image.revision=$VCS_REF \
  org.opencontainers.image.vendor="CrazyMax" \
  org.opencontainers.image.title="linguist" \
  org.opencontainers.image.description="GitHub Language Savant to detect blob languages" \
  org.opencontainers.image.licenses="MIT"

ENV VERSION="7.9.0"

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
  && gem install --no-document github-linguist -v ${VERSION} \
  && apk del build-dependencies \
  && rm -rf /var/cache/apk/*

VOLUME [ "/repo" ]

WORKDIR /repo
ENTRYPOINT [ "github-linguist" ]
