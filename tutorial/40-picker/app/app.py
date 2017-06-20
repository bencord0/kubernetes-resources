# -*- coding: utf-8 -*-

import psycopg2
from os import getenv
from flask import Flask, redirect, render_template, request
from time import sleep

app = Flask("app")


@app.route("/")
def index():

    db = psycopg2.connect(getenv("DATABASE_URL"))
    with db.cursor() as cur:
        try:
            cur.execute("SELECT colour from colours LIMIT 1;");
            db.commit()
        except psycopg2.ProgrammingError:
            db.rollback()
            cur.execute("CREATE TABLE colours(id serial PRIMARY KEY, colour text);")
            cur.execute("SELECT colour from colours LIMIT 1;");
            db.commit()

        try:
            COLOUR, = cur.fetchone()
        except TypeError:
            COLOUR = "#268cf2"

    return render_template('index.html', colour=COLOUR)


@app.route("/setcolour", methods=['POST'])
def setcolour():
    raw_colour = request.form['colour']
    new_colour = f'#{int(raw_colour, 16):06x}'

    db = psycopg2.connect(getenv("DATABASE_URL"))
    with db.cursor() as cur:
        cur.execute("""
INSERT INTO
    colours (id, colour)
VALUES (%s, %s)
ON CONFLICT (id) DO UPDATE
    SET colour = %s;
""", (1, new_colour, new_colour));
        print(f"SET COLOUR: {cur.statusmessage}")
        db.commit()

    return redirect('/')


print("Starting flask")
app.run(host="0.0.0.0", port=80, debug=True)
