#!/bin/bash
set -ex
/usr/local/bin/python /app/create_tables.py
/usr/local/bin/python /app/app.py
