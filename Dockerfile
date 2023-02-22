FROM node:13.10.1-alpine3.11
LABEL maintainer="Sheng <gishusheng@gmail.com>"

# using bfsu mirror in China
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.bfsu.edu.cn/g' /etc/apk/repositories
RUN apk update \
        && apk upgrade \
        && apk add git

# using gitee mirror in China
# RUN git clone https://gitee.com/xunhs/kepler.gl.git
RUN git clone https://github.moeyy.xyz/https://github.com/keplergl/kepler.gl.git
WORKDIR /kepler.gl/examples/demo-app

# using taobao npm source
RUN echo '\n#alias for cnpm\nalias cnpm="npm --registry=https://registry.npmmirror.com \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npmmirror.com/mirrors/node \
  --userconfig=$HOME/.cnpmrc"' >> ~/.zshrc && source ~/.zshrc
RUN cnpm install

ENV PATH "$PATH:/kepler.gl/examples/demo-app/node_modules/.bin"
# add mapbox env
ENV MapboxAccessToken "pk.eyJ1IjoidHJvcGljYWxocyIsImEiOiJjazZrZDJlMHgwMnZhM21wYW9oNWl4eGxoIn0.w_nfPS4RC5ERPpMMutwgLg"
EXPOSE 80

CMD ["webpack-dev-server", "--progress", "--port", "80", "--host", "0.0.0.0"]
