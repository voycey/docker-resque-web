FROM phusion/baseimage:0.9.16
MAINTAINER Dan Voyce <hello@danielvoyce.com>

ENV HOME /root

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

CMD ["/sbin/my_init"]

# Try and speed things up from Aus
RUN sed -i 's/archive.ubuntu.com/au.archive.ubuntu.com/' /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y ruby ruby-dev zlib1g-dev build-essential && \
    gem install resque-web && \
    gem install resque-cleaner && \
    gem install resque-sliders && \
    apt-get autoremove -y ruby-dev zlib1g-dev build-essential

ADD resque-web.rb   resque-web.rb

ENTRYPOINT ["resque-web", "-FL"]

EXPOSE 5678

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["-h"]

WORKDIR /data
