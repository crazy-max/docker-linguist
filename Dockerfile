FROM --platform=${TARGETPLATFORM:-linux/amd64} alpine:3.12

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN printf "I am running on ${BUILDPLATFORM:-linux/amd64}, building for ${TARGETPLATFORM:-linux/amd64}\n$(uname -a)\n"

LABEL maintainer="CrazyMax"

ENV VERSION="7.11.1"

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
