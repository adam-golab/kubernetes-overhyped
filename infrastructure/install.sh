#!/bin/sh

DIR=$(dirname -- "$0")

kubectl apply -f $DIR/helm-operator/namespace.yaml
helm upgrade -i helm-operator fluxcd/helm-operator \
    --namespace flux \
    --set helm.versions=v3
kubectl apply -f $DIR/helm-operator/crds.yaml
