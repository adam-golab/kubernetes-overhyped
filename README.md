# kubernetes-overhyped

### Usefull tools

- [k3d](https://github.com/rancher/k3d) - Little helper to run Rancher Lab's k3s in Docker
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) - The Kubernetes command-line tool
- [Helm v3](https://helm.sh/docs/intro/install/) - Helm charts


### 00 Setup

Connect to kubernetes cluster (may be created locally by k3d).

You can check the k8s nodes running `kubectl get nodes`.

Install infrastruccture applications

```sh
./infrastructure/install.sh
kubectl apply -f infrastructure
```

### 01 Simple deployment

Simple Hello World app with support for TLS/SSL out of the box.

```
kubectl apply -f 01-deployment.yaml
```

Get information about deployed pods

```
kubectl get pods -o wide
```

When it is ready get response from deployed application

```
curl -i devjs.ml
```

### 02 Helm Chart

Simple Hello World deployed from a Helm Chart, so that we can write less code to deploy the app. 

```
kubectl apply -f 02-helm-chart.yaml
```

Get information about deployed pods

```
kubectl get pods -o wide
```

When it is ready get response from deployed application

```
curl -i devjs.ml
```

### 03 Horizontal Scaling

Simple Hello World deployed from a Helm Chart with support for a custom metric and scaling rules. 

```
kubectl apply -f 03-autoscaling.yaml
```

Get information about deployed pods

```
kubectl get pods -o wide
```

When it is ready get response from deployed application

```
curl -i devjs.ml
```

Generate some trafic to trigger scaling mechanism

```
hey -z=60s -q 50 -c 50 https://devjs.ml
```

Watch how kubernetes is creating a new pods with our application
```
watch kubectls get pods -n hello-world
```
