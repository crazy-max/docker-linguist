ARG LINGUIST_VERSION="7.18.0"

FROM alpine:3.15

ARG LINGUIST_VERSION
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
  && gem install --no-document github-linguist -v ${LINGUIST_VERSION} \
  && apk del build-dependencies

VOLUME [ "/repo" ]

WORKDIR /repo
ENTRYPOINT [ "github-linguist" ]
