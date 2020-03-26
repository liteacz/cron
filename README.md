# Cron

## Table of contents
- [Usage](#usage)
- [Logrotate](#logrotate)
- [Crontab path](#crontab-path)

## Usage

Running from terminal:

```bash
docker run -d -v /path/to/crontab:/etc/crontab liteacz/cron
```

Using docker-compose:
```yaml
version: '3'
services:
  cron:
    image: liteacz/cron
    volumes:
    - /path/to/crontab:/etc/crontab
```

## Logrotate

By default logrotate utility is provided with following configuration:

```
/var/log/cron.log {
    rotate 10
    size 10M
}
```

the file can be found in `/etc/logrotate.conf`.

Feel free to override it using your custom version, but make sure the file has `0644` (is not writable by group or others)
otherwise logrotate will refuse to use it.

For more information see [manual](https://linux.die.net/man/8/logrotate).

## Crontab path

When container is started, it first looks for crontab file in `/etc/crontab`.
This path can be changed via environment variable `CRONTAB_PATH`. E.g:

```bash
docker run -d \
  -e CRONTAB_PATH=/my/custom/crontab \
  -v /path/to/crontab:/my/custom/crontab \
liteacz/cron
```
