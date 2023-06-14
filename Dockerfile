FROM ruby:slim-bullseye

ARG LOCAL_USER=project
ARG PROJECT_NAME=project
ARG PROJECT_PORT=3000
ARG BUILD_APP_OPTIONS="--skip-bundle"

ENV PROJECT_NAME=$PROJECT_NAME
ENV PROJECT_PORT=$PROJECT_PORT
ENV LOCAL_USER=$LOCAL_USER
ENV PROJECT_PATH=/opt/$PROJECT_NAME
ENV BUILD_APP_OPTIONS=$BUILD_APP_OPTIONS

RUN useradd --create-home --home-dir $PROJECT_PATH $LOCAL_USER && \
    mkdir -p $HOME && \
    chown -R $LOCAL_USER:$LOCAL_USER $PROJECT_PATH && \
    apt -yqq update && \
    apt -yqq install bash curl cmake git unzip

# CLEAN
RUN apt clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# INIT PROJECT
RUN mkdir /opt/new_app && \
  cd /opt/new_app && \
  chown -hR $LOCAL_USER:$LOCAL_USER . .* && \
  gem update --system && \
  gem install bundler && \
  gem install rails && \
  rails new . ${BUILD_APP_OPTIONS} && \
  bundle install

SHELL ["/bin/bash", "-c"]

COPY ./app/entrypoint.sh $PROJECT_PATH
RUN shopt -s dotglob && chown -hR $LOCAL_USER:$LOCAL_USER $PROJECT_PATH

WORKDIR $PROJECT_PATH


ENTRYPOINT [ "./entrypoint.sh" ]
