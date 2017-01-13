FROM ubuntu
MAINTAINER Matthew Fleeger

RUN apt-get update && apt-get install -y bash ruby wget ruby-dev zlib1g-dev libfontconfig bundler bzip2

RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2

RUN bzip2 -cd phantomjs-2.1.1-linux-x86_64.tar.bz2 |tar -xvf -

RUN mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin
 
RUN mkdir -p /root/spec

ADD ./Gemfile /root/Gemfile
ADD ./spec /root/spec

RUN cd /root && bundle install

CMD cd /root && rspec
