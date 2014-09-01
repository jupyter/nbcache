# Using the Ubuntu image
FROM ubuntu:14.04

MAINTAINER IPython Project <ipython-dev@scipy.org>

# Make sure apt is up to date
RUN apt-get update
RUN apt-get upgrade -y


# Not essential, but wise to set the lang
RUN apt-get install -y language-pack-en
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

# Python binary dependencies, developer tools
RUN apt-get install -y -q memcached libmemcached-dev libmemcache-dev zlib1g-dev

# Expose the default port
EXPOSE 11211

CMD ["-u", "memcache", "-m", "128", "-L"]

USER memcache

ENTRYPOINT memcached
