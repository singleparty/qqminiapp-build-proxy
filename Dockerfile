FROM qqminiapp/build:latest
COPY ./global-proxy /global-proxy
WORKDIR /global-proxy
RUN npm install --registry=https://registry.npm.taobao.org
ENTRYPOINT ["node", "/global-proxy/index.js"]
