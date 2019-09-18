# kubernetes-overhyped

### Requirements

- [k3d](https://github.com/rancher/k3d) - Little helper to run Rancher Lab's k3s in Docker
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) - The Kubernetes command-line tool

### 01 NodePort

Create kubernetes cluster with one master node and two workers.

```
k3d create -x --disable-agent --publish 8080:30080@k3d-k3s-default-worker-0 --workers 2
```

- `-x --disable-agent` - do not run agent on the master node
- `--publish 8080:30080@k3d-k3s-default-worker-0` - expose port 30080 on host machine port 8080
- `--workers 2` - run two workers

Get information about working nodes

```
kubectl get nodes
```

Get details about selected node

```
kubectl describe node k3d-k3s-default-worker-0
```

Deploy first example of exposing applications via NodePort

```
kubectl apply -f nodePort.yaml
```

Get information about deployed pods

```
kubectl get pods -o wide
```

When it is ready get response from deployed application

```
curl -i localhost:8080
```

### 02 Ingress

**RECOMMENDED WAY TO EXPOSE APPS**

Create kubernetes cluster with one master node and two workers.

```
 k3d create -x --disable-agent --publish 8080:80@k3d-k3s-default-worker-0 --workers 2
```

- `-x --disable-agent` - do not run agent on the master node
- `--publish 8080:80@k3d-k3s-default-worker-0` - expose port 80 on host machine port 8080
- `--workers 2` - run two workers

Get information about working nodes

```
kubectl get nodes
```

Get details about selected node

```
kubectl describe node k3d-k3s-default-worker-0
```

Deploy first example of exposing applications with usage of Ingress

```
kubectl apply -f ingress.yaml
```

Get information about deployed pods

```
kubectl get pods -o wide
```

When it is ready get response from deployed application

```
curl -i localhost:8080
```

Get info about Ingress Routes

```
kubectl get ingresses
```

### 03 BONUS Load Balancing

Create kubernetes cluster with one master node and two workers.

```
 k3d create -x --disable-agent --publish 8080:80@k3d-k3s-default-worker-0 --workers 2
```

- `-x --disable-agent` - do not run agent on the master node
- `--publish 8080:80@k3d-k3s-default-worker-0` - expose port 80 on host machine port 8080
- `--workers 2` - run two workers

Get information about working nodes

```
kubectl get nodes
```

Get details about selected node

```
kubectl describe node k3d-k3s-default-worker-0
```

Deploy first example of exposing applications with usage of Ingress

```
kubectl apply -f ingress.yaml
```

Get information about deployed pods

```
kubectl get pods -o wide
```

When it is ready get response from deployed application

```
curl -i localhost:8080
```

Each time you send a request you should get a response from different pod. It shows how selectors in services are working.
