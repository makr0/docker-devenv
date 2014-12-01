openssl genrsa -out staging.igm040.wegewerk.org.key 4096
openssl genrsa -out api.konferenz-app.igm040.wegewerk.org.key 4096
openssl genrsa -out couchdb.konferenz-app.igm040.wegewerk.org.key 4096


openssl req -new -key staging.igm040.wegewerk.org.key -sha256 -out staging.igm040.wegewerk.org.csr -subj "/C=DE/ST=Berlin/L=Berlin/O=wegewerk/OU=konferenz-app/CN=staging.igm040.wegewerk.org"
openssl req -new -key api.konferenz-app.igm040.wegewerk.org.key -sha256 -out api.konferenz-app.igm040.wegewerk.org.csr -subj "/C=DE/ST=Berlin/L=Berlin/O=wegewerk/OU=konferenz-app/CN=api.konferenz-app.igm040.wegewerk.org"
openssl req -new -key couchdb.konferenz-app.igm040.wegewerk.org.key -sha256 -out couchdb.konferenz-app.igm040.wegewerk.org.csr -subj "/C=DE/ST=Berlin/L=Berlin/O=wegewerk/OU=konferenz-app/CN=couchdb.konferenz-app.igm040.wegewerk.org"
