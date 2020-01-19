rm -rf ./nginx/certs/ && mkdir -p ./nginx/certs/ && cd ./nginx/certs/

openssl genrsa -des3 -passout pass:x -out mysite.key 2048
openssl rsa -passin pass:x -in mysite.key -out mysite.local.key
rm mysite.key

openssl req -new -key mysite.local.key -out mysite.local.csr

touch v3.ext

read -p 'Provide website domain: ' DNS1

echo "
authorityKeyIdentifier=keyid,issuer 
basicConstraints=CA:FALSE 
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment 
subjectAltName = @alt_names 

[alt_names] 
DNS.1 = ${DNS1}
" > v3.ext

openssl x509 -req -sha256 -extfile v3.ext -days 3650 -in mysite.local.csr -signkey mysite.local.key -out mysite.local.crt

sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain mysite.local.crt
