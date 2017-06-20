# -*- coding: utf-8 -*-

import psycopg2
from os import getenv


print("Creating tables")
db = psycopg2.connect(getenv("DATABASE_URL"))
with db.cursor() as cur:
    cur.execute("CREATE TABLE IF NOT EXISTS colours(id serial, colour text);");
