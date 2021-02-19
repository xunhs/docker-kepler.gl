FROM node:13.10.1-alpine3.11

LABEL maintainer="Sheng <gishusheng@gmail.com>"

# using ustc mirror
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update \
	&& apk upgrade \
	&& apk add git

RUN git clone https://github.com/uber/kepler.gl.git

WORKDIR /kepler.gl/examples/demo-app

# using taobao npm source
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org
RUN cnpm install

ENV PATH "$PATH:/kepler.gl/examples/demo-app/node_modules/.bin"

# add mapbox env
ENV MapboxAccessToken "pk.eyJ1IjoidHJvcGljYWxocyIsImEiOiJjazZrZDJlMHgwMnZhM21wYW9oNWl4eGxoIn0.w_nfPS4RC5ERPpMMutwgLg"

EXPOSE 80

CMD ["webpack-dev-server", "--progress", "--port", "80", "--host", "0.0.0.0"]

