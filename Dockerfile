FROM ruby:2.6.2
MAINTAINER genius85862@gmail.com

ENV LANG=C.UTF-
ENV LC_ALL=C.UTF-8

RUN gem install bundler
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs bc && \
    rm -rf /var/lib/apt/lists/*
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
     echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
     apt-get update && apt-get install yarn && \
     rm -rf /var/lib/apt/lists/*

RUN mkdir /dreamjobs
WORKDIR /dreamjobs
ENTRYPOINT ["./docker_entrypoint"]
