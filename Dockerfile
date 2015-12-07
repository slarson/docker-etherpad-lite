FROM node:0.11
MAINTAINER Johannes Bornhold <johannes@bornhold.name> + Jon Richter <post@jonrichter.de>
RUN mkdir /src
WORKDIR /src
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install \
    gzip git-core curl python libssl-dev libpq-dev pkg-config build-essential unzip
RUN wget https://github.com/ether/etherpad-lite/archive/master.zip &&\
    unzip master &&\
    rm -f master.zip &&\
    mv etherpad-lite-master etherpad
WORKDIR /src/etherpad
RUN bin/installDeps.sh &&\
    npm install sqlite3 &&\
    npm install -g pm2
RUN npm install \
    ep_ether-o-meter \
    ep_timesliderdiff \
    ep_page_view \
    ep_print \
    ep_set_title_on_pad \
    ep_mypads
EXPOSE 10001
VOLUME /data
COPY bin/ /src/bin/
WORKDIR /src/bin
ENTRYPOINT ["/src/bin/go.sh"]
