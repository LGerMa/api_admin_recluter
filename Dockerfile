FROM ruby:alpine

RUN apk update && apk add bash build-base nodejs postgresql-dev tzdata


RUN addgroup --gid montoya user
RUN adduser --disabled-password --gecos '' --uid montoya --gid montoya user
USER user

RUN mkdir /project
WORKDIR /project

COPY Gemfile Gemfile.lock ./
RUN gem install bundler --no-document
RUN bundle install --no-binstubs --jobs $(nproc) --retry 3

COPY . .

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]