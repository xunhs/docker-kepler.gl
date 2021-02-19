FROM node:13.10.1-alpine3.11

LABEL maintainer="Stefan Kuethe <crazycapivara@gmail.com>"

RUN apk update \
	&& apk upgrade \
	&& apk add git

RUN git clone https://github.com/uber/kepler.gl.git

WORKDIR /kepler.gl/examples/demo-app

RUN npm install

ENV PATH "$PATH:/kepler.gl/examples/demo-app/node_modules/.bin"

# add mapbox env
ENV MapboxAccessToken "pk.eyJ1IjoidHJvcGljYWxocyIsImEiOiJjazZrZDJlMHgwMnZhM21wYW9oNWl4eGxoIn0.w_nfPS4RC5ERPpMMutwgLg"

EXPOSE 80

CMD ["webpack-dev-server", "--progress", "--port", "80", "--host", "0.0.0.0"]

