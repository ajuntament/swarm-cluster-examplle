
Some Stacks usually deployed altogether to provide an OpenSource DevOps CD/CI environment.

  - Cluster management: Portainer
  - Automatic Metrics Collection on every new Container, Service or Node: Telegraf + InfluxDB + Grafana
  - Automatic Logs Collection on every new Container, Service or Node: Logspout + Logstash + ElasticSearch + Kibana
  - Gitlab-ce + Gitlab-runners for CD/CI + Docker registry server.
  - Traefik in clustered HA-mode, with Letsencrypt enabled


Pending Stacks:

  - Redis cluster
  - Mariadb/Mysql Service
  - PostgreSQL Service
  - Mariadb Galera Cluster
  - Kafka Cluster
  - Portus?
  - ...

Please, feel free to send your merge requests and contributions :-)

