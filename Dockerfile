FROM skopciewski/ruby

RUN apk add --no-cache git
RUN gem-install pry

ENV BUNDLE_WITHOUT=""
ENV PROJECT_DIR=/opt/project/code
ENV user=project
ARG uid=1000
ARG gid=1000

RUN mkdir -p ${PROJECT_DIR} \
  && addgroup -g ${gid} ${user} \
  && adduser -h /home/${user} -D -u ${uid} -G ${user} -s /bin/sh ${user} \
  && chown ${user}:${user} ${PROJECT_DIR} \
  && chown -R ${user}:${user} ${GEM_HOME} \
  && cp /root/.gemrc /home/${user}/.gemrc \
  && chmod 666 ${BUNDLE_APP_CONFIG}/config

USER ${user}

WORKDIR ${PROJECT_DIR}

# install projects gems
ONBUILD COPY *.gemspec ${PROJECT_DIR}
ONBUILD COPY Gemfile* ${PROJECT_DIR}
ONBUILD RUN run-ext bundle install --standalone
