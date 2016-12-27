FROM ubuntu
MAINTAINER Matthew Fleeger

RUN apt-get update && apt-get install -y bash curl libnss3 gconf2 ruby ruby-dev bundler wget unzip xvfb xterm

RUN mkdir -p /root/util
RUN mkdir -p /root/test

ADD ./util/ /root/util
ADD ./test/ /root/test

RUN bash /root/util/install_chrome.sh
RUN bash /root/util/install_webdriver.sh
RUN cd /root/test && bundle install
CMD cd /root/test && xvfb-run -s "-screen 0 1024x768x16" rspec gimage_rtest.rb
