#! /bin/bash
set -xe
set pipefail

for d in $(\ls -1d */ | grep -v docs/); do
  helm package $d
  mv ${d////}-*.tgz docs/
done

helm repo index docs --url https://yakiyoshi.github.io/spring-petclinic-helm/

