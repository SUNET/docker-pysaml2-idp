from saml2 import BINDING_HTTP_POST
from saml2 import BINDING_HTTP_REDIRECT
from saml2 import BINDING_SOAP
from saml2.saml import NAMEID_FORMAT_PERSISTENT
from saml2.saml import NAMEID_FORMAT_TRANSIENT

HOST = "0.0.0.0"
PORT = 9000
HTTPS = False
BASE = "http://localhost:9000"

CONFIG = {
    "entityid": "%s/idp.xml" % BASE,
    "service": {
        "idp": {
            "endpoints": {
                "single_sign_on_service": [
                    ("%s/sso/redirect" % BASE, BINDING_HTTP_REDIRECT),
                ],
            },
            "subject_data": "./idp.subject",
            "name_id_format": [NAMEID_FORMAT_PERSISTENT]
        },
    },
    "metadata": {
        "local": ["sp.xml"]
    },
    "organization": {
        "display_name": "Test IdP",
        "name": "Test IdP Inc.",
        "url": "http://example.com",
    },
    "contact_person": [
        {
            "contact_type": "technical",
            "given_name": "Tech",
            "sur_name": "Support",
            "email_address": "technical@example.com"
        }
    ],
    "xmlsec_binary": "/usr/bin/xmlsec1",
    "logger": {
        "rotating": {
            "filename": "idp.log",
            "maxBytes": 500000,
            "backupCount": 5,
        },
        "loglevel": "debug",
    }
}
