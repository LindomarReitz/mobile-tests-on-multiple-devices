FROM ruby:2.2.2

LABEL maintainer="lindomar.reitz@gmail.com"

RUN cd /home && mkdir mobile-tests-on-multiple-devices

COPY . /home/mobile-tests-on-multiple-devices

RUN cd /home/mobile-tests-on-multiple-devices && bundle install
