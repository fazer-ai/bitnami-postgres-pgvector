FROM pgvector/pgvector:pg16 AS builder

FROM postgres:16-alpine

COPY --from=builder /usr/lib/postgresql/16/lib/vector.so /usr/lib/postgresql/16/lib/vector.so
COPY --from=builder /usr/share/postgresql/16/extension/vector* /usr/lib/postgresql/16/share/extension/
