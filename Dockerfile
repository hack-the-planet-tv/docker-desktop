FROM ubuntu:18.04

RUN echo "Europe/Rome" > /etc/timezone
# RUN sudo ln -fs /usr/share/zoneinfo/Europe/Rome /etc/localtime

RUN apt-get update -q && \
	export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y --no-install-recommends tzdata

RUN dpkg-reconfigure -f noninteractive tzdata

# Install packages
RUN apt-get update -q && \
	export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y --no-install-recommends wget curl rsync netcat mg vim bzip2 zip unzip && \
    apt-get install -y --no-install-recommends libx11-6 libxcb1 libxau6 && \
    apt-get install -yqq ubuntu-mate-desktop ubuntu-mate-icon-themes ubuntu-mate-themes pulseaudio dbus dbus-x11 dconf-cli dconf-editor apt-utils mc moreutils tightvncserver xvfb dbus-x11 x11-utils && \
    apt-get install -y --no-install-recommends xfonts-base xfonts-75dpi xfonts-100dpi chromium-browser && \
    apt-get install -y --no-install-recommends python-pip python-dev python-qt4 && \
    apt-get install -y --no-install-recommends libssl-dev && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /

ADD root-home.tar.gz /

RUN echo "mycontainer" > /etc/hostname
RUN echo "127.0.0.1	localhost" > /etc/hosts
RUN echo "127.0.0.1	mycontainer" >> /etc/hosts

EXPOSE 5901
ENV USER root
CMD [ "/root/start-vncserver.sh" ]
