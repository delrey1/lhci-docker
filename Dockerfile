FROM node:12-buster-slim

RUN apt update && apt install -y fonts-liberation wget libappindicator3-1 && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    (dpkg -i google-chrome*.deb || echo 'Had an issue whiles trying to install chrome, continuing') && \
    apt --fix-broken -y install && \
    apt clean

WORKDIR /usr/src/lhci

RUN chown node /usr/src/lhci

USER node

RUN whoami && npm install @lhci/cli @lhci/server sqlite3 puppeteer

USER root
