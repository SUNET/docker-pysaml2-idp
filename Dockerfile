FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    python3-dev \
    python3-pip \
    libsasl2-dev \
    libssl-dev \
    libffi-dev \
    xmlsec1

RUN pip3 install --upgrade setuptools pip wheel
RUN pip3 install --src /tmp/src -e git+https://github.com/identitypython/pysaml2#egg=pysaml2
RUN pip3 install cherrypy==3.8.1 mako==1.0.3 pycryptodomex

COPY start.sh /tmp/
WORKDIR /tmp/src/pysaml2/example/idp2/
ENTRYPOINT ["/tmp/start.sh"]
