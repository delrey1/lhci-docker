FROM node:12-buster-slim

RUN apt update && apt install -y fonts-liberation wget libappindicator3-1 git  && \
    cd /tmp && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    (dpkg -i google-chrome*.deb || echo 'Had an issue whiles trying to install chrome, continuing') && \
    apt --fix-broken -y install && \
    apt clean && \
    rm -fr /tmp/google-chown* && \
    npm -g install @lhci/cli
