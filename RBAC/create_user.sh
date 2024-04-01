#!/bin/bash
USER=graham
openssl genrsa -out $USER.key 2048 #Generate a Private Key for the User
openssl req -new -key $USER.key -out $USER.csr -subj "/CN=$USER/O=group1" #Create a Certificate Signing Request (CSR)
MINIKUBE_CA_CERT=~/.minikube/ca.crt
MINIKUBE_CA_KEY=~/.minikube/ca.key
openssl x509 -req -in $USER.csr -CA $MINIKUBE_CA_CERT -CAkey $MINIKUBE_CA_KEY -CAcreateserial -out $USER.crt -days 365
kubectl config set-credentials $USER --client-certificate=$USER.crt --client-key=$USER.key
kubectl config set-context $USER@minikube --cluster=minikube --user=$USER
kubectl config use-context $USER@minikube
kubectl config current-context