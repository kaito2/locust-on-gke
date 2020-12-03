#!/bin/bash -e

kustomize build argocd/ | kubectl apply -f -

# https://github.com/argoproj/argo-cd/blob/master/docs/faq.md#i-forgot-the-admin-password-how-do-i-reset-it
# XXX: Change admin.password
kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2a$10$.Aepbx3gXPZ0h14NOL/X4.nGauT85M7rl1KstHBbQA0vJspMf9MHW",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'

kubectl rollout restart deploy argocd-server -n argocd
