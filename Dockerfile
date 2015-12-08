FROM ubuntu:14.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    python-dev \
    python-pip \
    libsasl2-dev \
    libssl-dev \
    libffi-dev \
    xmlsec1

RUN pip install --src /tmp/src -e git+https://github.com/rebeckag/pysaml2@conditional_ldap#egg=pysaml2
RUN pip install cherrypy==3.8.1 mako==1.0.3

COPY start.sh /tmp/
WORKDIR /tmp/src/pysaml2/example/idp2/
ENTRYPOINT ["/tmp/start.sh"]
