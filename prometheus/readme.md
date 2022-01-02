# Getting Prometheus Server up and running
wget https://github.com/prometheus/prometheus/releases/download/v2.32.1/prometheus-2.32.1.linux-amd64.tar.gz
tar -xzf prometheus-2.32.1.linux-amd64.tar.gz
cd prometheus-2.32.1.linux-amd64
./prometheus
http://localhost:9090

# Node Exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
tar -xzf
cd node_exporter-1.3.1.linux-amd64
./node_exporter
http://localhost:9100/metrics

# Exploring Targets
status -> Targets
up == 0

# Alert Manager
wget https://github.com/prometheus/alertmanager/releases/download/v0.23.0/alertmanager-0.23.0.linux-amd64.tar.gz
tar -xzf alertmanager-0.23.0.linux-amd64.tar.gz
cd alertmanager-0.23.0.linux-amd64
./alertmanager

# Intramentation
from prometheus_client import start_http_server
if __name__ == '__main__':
    start_http_server(8000)

REQUESTS = Counter('hello_worlds_total',
'Hello Worlds requested.')


from prometheus_client import Gauge
LATENCY = Histogram('hello_world_latency_seconds',
'Time for a request Hello World.')

@LATENCY.time()
REQUESTS.inc()

REQUESTS = Counter('hello_worlds_total',
'Hello Worlds requested.',
labelnames=['path'])

REQUESTS.labels(self.path).inc()

# Service Discovery
Instead of using static like we are doing, we can dynamically discover things that require monitoring


# Grafana
docker run -d --name=grafana --net=host grafana/grafana:8.3.3
http://localhost:3000/
admin/admin

prometheus source, http://localhost:9090

https://grafana.com/grafana/dashboards/1860


+ Dashboard -> Edit ->
process_resident_memory_bytes



# Getting Container stats Docker/Kubernetes
https://github.com/google/cadvisor

Mapped 8040 as we are already using 8080 for Jenkins
```
sudo docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8040:8080 \
  --detach=true \
  --name=cadvisor \
  --privileged \
  --device=/dev/kmsg \
  gcr.io/cadvisor/cadvisor:v0.36.0
```

localhost:8040/metrics

not many on dashboards on grafana, so you would have to create your own