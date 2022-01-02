
# Get ElasticSearch
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.16.2-linux-x86_64.tar.gz
tar -xvf elasticsearch-7.16.2-linux-x86_64.tar.gz
cd elasticsearch-7.16.2
bin/elasticsearch
curl localhost:9200


# Get Kibana
wget https://artifacts.elastic.co/downloads/kibana/kibana-7.16.2-linux-x86_64.tar.gz
tar -xvf kibana-7.16.2-linux-x86_64.tar.gz
cd kibana-7.16.2-linux-x86_64

#### Add the following to config/kibana.yml
elasticsearch.hosts: ["http://localhost:9200"]
server.port: 5601
server.host: "0.0.0.0"

bin/kibana


# Dev Tools - Using the Rest API
http://192.168.0.50:5601/app/dev_tools



# Indexing:



# File beat

filebeat.exe -configtest /etc/filebeat.yml