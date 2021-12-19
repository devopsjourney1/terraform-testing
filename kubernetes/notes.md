
k get all


# Clusters
- Cluster, has nodes.
- Nodes are Machines in the cluster
- Master Nodes and Worker Nodes
- Workernodes run your containers managed by the kubernetes control plane
- Master nodes run the contorl plane
- Controlplane is an API that you can interact with (using kubectl etc)
- Control Plane schedules containers onto nodes
- Scheduling descisions consider required cpu and other factors

# Pods:
- Containers are grouped into Pods
- Pods are groups of one or more containers
- Pods are the smallest building block of kubernetes



# Services
- define networking rules for expoisng pods to other pods and the internet.
- can use labels to select group of pods
- service has a fixed IP.. where pods IPs can change.
- Can distribute requests across pods in the group



# Deployments
- Manage deploying or rolling back configuration changes to running pods. Also used for horizontal scaling.



# Cluster management:
- Communicate with the cluster using the API
-- Rest API
-- Client libraries (Python, Go, Java etc)
-- kubectl CLI Tool. (Translates high level command into REST API calls) Can manage remote/local clusters.
-- Web dashboard (need to install seperately)

# Kubectl
kubectl create // create resource
kubectl delete // delete resource
kubectl get   // gets a list of the resource specified
kubectl describe // describe a specific resource
kubectl logs //print container logs
https://kubernetes.io/docs/reference/kubectl/cheatsheet/


# Manafest files (YAML)


# Namespaces


# kubectl create run through:
- kubectl sends manafest to Kubernetes API (master nodes)
- API server selects a node with sufficient resources and schedules the POD onto that node.
- Node pulls Pods container images and starts the pods containers

-- During lab - kubernetes can't update a pods port while it's running, so need to delete it.

# Pods - detailed:

- Pod containers all share a container network
- One IP Address per pod
- resource requests/best effort
- What you will specifiy in pod configuration:
-- image, ports, restart policy, resource limits

# Resources (Requests/Limits):
- Managed via a manafest file (YAML)
- not required but almost always used. allows for source control, sharing and easier to work with.
Requests are what the container is guaranteed to get. If a container requests a resource, Kubernetes will only schedule it on a node that can give it that resource. Limits, on the other hand, make sure a container never goes above a certain value
-- Pods become best effort if no resources specified

# Services Detailed:
ClusterIP: Exposes the service on a cluster-internal IP. Choosing this value makes the service only reachable from within the cluster. This is the default ServiceType

NodePort: Exposes the service on each Node’s IP at a static port (the NodePort). A ClusterIP service, to which the NodePort service will route, is automatically created. You’ll be able to contact the NodePort service, from outside the cluster, by requesting <NodeIP>:<NodePort>.

LoadBalancer: Exposes the service externally using a cloud provider’s load balancer. NodePort and ClusterIP services, to which the external load balancer will route, are automatically created.



# Labels:
-- Labels are key/value pairs that are attached to objects, such as pods. Labels are intended to be used to specify identifying attributes of objects that are meaningful and relevant to users.
-- Your resources like pods will have labels, and your nodes will have labels as well.
-- Some example labels: prod/dev/staging/qa, uswest, uswest etc

# Scaling

k scale --replicas=2 deployment/mypod

# Logs
k logs mypod-55485df7f7-gzlcw
k logs -l app=mywebapp