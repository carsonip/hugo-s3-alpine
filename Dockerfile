FROM alpine:latest
RUN apk add --no-cache aws-cli
ADD https://github.com/gohugoio/hugo/releases/download/v0.52/hugo_0.52_Linux-64bit.tar.gz /tmp/hugo.tar.gz
RUN tar xzvf /tmp/hugo.tar.gz hugo && mv hugo /bin/ && chmod +x /bin/hugo
WORKDIR /app
