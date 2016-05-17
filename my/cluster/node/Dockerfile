FROM my/cluster/base
COPY init-tinc /opt/cluster/init/
RUN clusterinit commit
ENTRYPOINT ["/lib/systemd/systemd"]
