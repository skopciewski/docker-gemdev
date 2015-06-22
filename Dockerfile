FROM skopciewski/alpine-ruby

RUN apk-install \
  build-base \
  git \
  ruby-dev

