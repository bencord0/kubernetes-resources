# -*- coding: utf-8 -*-

from os import getenv
from flask import Flask

app = Flask("app")


@app.route("/")
def index():
    COLOUR = getenv("COLOUR")
    return '<body bgcolor="{}">'.format(COLOUR)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
