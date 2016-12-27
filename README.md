# selenium-test

This Docker image will test Google's image search for pictures of robots and ensure that at least one exist(s).  It uses Google Chrome via a headless Ubuntu X session and reports the results via unittest.

Usage:

    git clone https://github.com/camateg/selenium-test.git
    cd selenium-test
    docker build .
    docker run -t -e S3_ACCESS=<S3 Access Key> -e S3_SECRET=<S3 Secret Key> -i <docker id>
