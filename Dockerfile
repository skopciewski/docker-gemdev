FROM skopciewski/ruby

ENV BUNDLE_WITHOUT=""

RUN apk add --no-cache git
RUN gem-install pry

# install projects gems
ONBUILD WORKDIR /opt/project/code
ONBUILD COPY *.gemspec /opt/project/code/
ONBUILD COPY Gemfile* /opt/project/code/
ONBUILD RUN run-ext bundle install
