# docker-watir

This Docker image will test Google's image search for pictures of robots and ensure that at least one exist(s).  It uses PhantomJS and reports the results via rpsec.

Usage:

    git clone https://github.com/camateg/docker-watir.git
    cd docker-watir
    docker build .
    docker run -it <id>
