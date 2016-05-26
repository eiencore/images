FROM my/cluster/base
COPY init-tinc /opt/cluster/init/
COPY init-etcd /opt/cluster/init/
RUN clusterinit commit
ENTRYPOINT ["/lib/systemd/systemd"]
