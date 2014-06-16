#
# Etherpad lite Dockerfile
#
# Based on instructions from https://github.com/ether/etherpad-lite
#

FROM dockerfile/nodejs

MAINTAINER Johannes Bornhold <johannes@bornhold.name>


# Prepare etherpad
RUN mkdir /src
WORKDIR /src

# Dependencies based on docs
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install \
    gzip git-core curl python libssl-dev libpq-dev pkg-config build-essential

RUN wget https://github.com/ether/etherpad-lite/archive/master.zip &&\
    unzip master &&\
    rm -f master.zip &&\
    mv etherpad-lite-master etherpad &&\
    sed '/installDeps.sh/d' etherpad/bin/run.sh -i

WORKDIR /src/etherpad

# Install dependencies
RUN bin/installDeps.sh
RUN npm install sqlite3

# Add the settings
ADD config/ /src/etherpad/

# Install plugins
RUN npm install \
	ep_adminpads \
	ep_author_neat \
	ep_ether-o-meter \
	ep_timesliderdiff \
	ep_page_view \
	ep_markdown \
	ep_offline_edit \
	ep_prompt_for_name \
    ep_print \
    ep_set_title_on_pad > /dev/null 2>&1

# The pipe is a workaround for fig : https://github.com/orchardup/fig/issues/239

EXPOSE 9001
VOLUME ["/data"]

CMD ["bin/configure_and_run.sh"]
