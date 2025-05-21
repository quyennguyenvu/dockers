# My docker playground

---

```bash
docker-compose -f docker-compose.db.yml down <service>
docker-compose -f <docker-compose-file> up -d --build
```

---

## PostgreSQL

- [Logging with postgresql](https://betterstack.com/community/guides/logging/how-to-start-logging-with-postgresql/)

## Kafka

- [kafka config](https://github.com/confluentinc/cp-all-in-one/blob/7.9.0-post/cp-all-in-one-kraft/docker-compose.yml)
- [kafka ui config](https://github.com/provectus/kafka-ui/blob/master/documentation/compose/kafka-ui.yaml)

## PMM

- [postgresql tags](https://hub.docker.com/r/percona/percona-distribution-postgresql/tags)

## bgbadger

Generate a report from the PostgreSQL logs using [pgbadger](https://github.com/darold/pgbadger).

```bash
pgbadger ./logs/postgresql*.log -o ~/Downloads/pgbadger-report.html
```
