FROM ruby:3.0.2-alpine

RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev \
    libressl-dev libffi-dev
RUN apk add exiftool

WORKDIR /usr/src/app

RUN gem install mini_exiftool
COPY ./ ./

CMD ["ruby", "code.rb"]