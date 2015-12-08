# Docker image for pysaml2 IdP

To run the Identity Provider (IdP) run:

    docker run -p 9000:<port in idp_conf.py> -v <host dir>:<data_dir> -e DATA_DIR=<data_dir> pysaml2-idp

The volume bound must contain the necessary configuration files:

    <host dir>/
    ├── sp.xml
    └── idp_conf.py

where `sp.xml` is the Service Providers (SPs) metadata and `idp_conf.py` is the configuration file
for the pysaml2 IdP, see the [example configurations](https://github.com/rohe/pysaml2/blob/f8cea469d70255adae71e81c19b71efc928d1445/example/idp2/idp_conf.py.example) in the pysaml2 project.

**Metadata for the IdP will be written to the mounted host directory as specified by the environment variable: `DATA_DIR`.**

## Even simpler

Only add the SPs metadata in [env/sp.xml](env/sp.xml), then:

    cd vagrant && vagrant up

The IdP should be reachable at [http://localhost:9000](http://localhost:9000).
