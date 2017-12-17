FROM illallangi/ansible:latest as image

COPY image/* /etc/ansible.d/image/
RUN /usr/local/bin/ansible-runner.sh image

COPY container/* /etc/ansible.d/container/

ENV AUTOTORRENT_COMPLETE_PATH=/complete
ENV AUTOTORRENT_CONFIG_PATH=/var/lib/autotorrent/.config/autotorrent
ENV AUTOTORRENT_DISK_PATH=/disk
ENV AUTOTORRENT_MATCH_PATH=/match
ENV USER=autotorrent
ENV UID=1024

CMD ["/usr/local/bin/autotorrent-entrypoint.sh"]
