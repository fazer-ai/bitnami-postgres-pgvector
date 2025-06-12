#!/usr/bin/env bash
set -e

# create the extension in the default DB (usually $POSTGRES_DB or 'postgres')
psql --username "$POSTGRES_USER" <<-EOSQL
  CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA public;
EOSQL

# also install into template1 so any newly created database inherits it
psql --username "$POSTGRES_USER" --dbname=template1 <<-EOSQL
  CREATE EXTENSION IF NOT EXISTS vector;
EOSQL
