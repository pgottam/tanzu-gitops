#! /usr/bin/env bash

set -euo pipefail

kubectl create ns concourse

mkcert \
-cert-file tls.crt \
-key-file tls.key \
concourse.lab.home

kubectl create secret tls concourse-web-tls \
--namespace concourse \
--cert=./tls.crt \
--key=./tls.key