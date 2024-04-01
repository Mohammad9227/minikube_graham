#!/bin/bash
open /Applications/Docker.app
sleep 10
minikube start --driver=docker --nodes 2
