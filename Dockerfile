FROM ubuntu
MAINTAINER Matthew Fleeger

RUN apt-get update && apt-get install -y bash ruby wget ruby-dev libfontconfig bundler bzip2

RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2

RUN bzip2 -cd phantomjs-2.1.1-linux-x86_64.tar.bz2 |tar -xvf -

RUN mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin
 
RUN mkdir -p /root/util
RUN mkdir -p /root/test

ADD ./util/ /root/util
ADD ./test/ /root/test

RUN cd /root/test && bundle install

CMD cd /root/test && rspec gimage_rtest.rb
