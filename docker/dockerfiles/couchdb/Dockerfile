FROM klaemo/couchdb

RUN mkdir -p /data/couchdb/igmcouch
RUN ln -s /data/couchdb/igmcouch /usr/local/var/lib/couchdb 

ADD local.ini /usr/local/etc/couchdb/