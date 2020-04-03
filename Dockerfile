FROM alpine:3.11

RUN apk add --no-cache dcron logrotate wget curl

RUN mkdir -m 0644 -p /var/log \
    && touch /var/log/cron.log

COPY logrotate.conf /etc
RUN chmod 644 /etc/logrotate.conf

COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["entrypoint.sh"]
