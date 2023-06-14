#!/bin/bash

if [ $(ls $PROJECT_PATH | wc -l) -lt 2 ];
then
    shopt -s dotglob
    mv /opt/new_app/* $PROJECT_PATH
fi

rm -f $PROJECT_PATH/tmp/pids/server.pid

bundle install
rails db:migrate && rails db:seed && rails assets:precompile
bundle exec rails s -p ${PROJECT_PORT} -b '0.0.0.0'