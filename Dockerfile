FROM skopciewski/alpine-ruby

ENV BUNDLE_WITHOUT=""

RUN gem-install pry
RUN apk-install git

# install projects gems
ONBUILD WORKDIR /opt/project/code
ONBUILD COPY *.gemspec /opt/project/code/
ONBUILD COPY Gemfile* /opt/project/code/
ONBUILD RUN run-ext bundle install

