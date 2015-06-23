FROM skopciewski/alpine-ruby

ENV BUNDLE_WITHOUT=""

# install projects gems
ONBUILD WORKDIR /opt/tmp
ONBUILD COPY *.gemspec /opt/tmp/
ONBUILD COPY Gemfile* /opt/tmp/
ONBUILD RUN run-ext bundle install

ONBUILD WORKDIR /opt/project/code

