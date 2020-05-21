openssl genrsa -des3 -out localRootCA.key 2048

openssl req -x509 -new -nodes -key localRootCA.key -sha256 -days 1024 -out localRootCA.pem

openssl req -new -nodes -out developer.csr -newkey rsa:2048 -keyout developer.key

openssl x509 -req -in developer.csr -CA localRootCA.pem -CAkey localRootCA.key -CAcreateserial -out developer.crt -days 500 -sha256 -extfile x509v3.ext