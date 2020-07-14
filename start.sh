#!/bin/sh

# copy volume mounted config
cp -r ${DATA_DIR:?"Need to set DATA_DIR non-empty"}/* .

# generate SAML metadata
make_metadata.py idp_conf.py > idp.xml
cp idp.xml ${DATA_DIR}/.

# start the IdP
echo "Starting pysaml2 IdP..."
exec start-stop-daemon --start --exec \
    /usr/bin/python3 \
    --chdir /tmp/src/pysaml2/example/idp2/ -- \
    idp.py idp_conf
