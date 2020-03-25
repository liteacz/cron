FROM alpine:3.11

RUN apk add --no-cache dcron logrotate wget

RUN mkdir -m 0644 -p /var/log \
    && touch /var/log/cron.log

COPY logrotate.conf /etc

COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["entrypoint.sh"]
