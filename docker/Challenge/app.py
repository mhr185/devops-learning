from flask import Flask, render_template
import os
import socket
import redis

redis_host = os.getenv('REDIS_HOST', 'localhost')
redis_port = int(os.getenv('REDIS_PORT', '6379'))

r = redis.Redis(host=redis_host, port=redis_port, decode_responses=True)

app = Flask(__name__)

# Maps each Western digit to its Eastern Arabic equivalent, e.g. 42 -> ٤٢
ARABIC_DIGITS = str.maketrans('0123456789', '٠١٢٣٤٥٦٧٨٩')


def to_arabic(number):
    return str(number).translate(ARABIC_DIGITS)


@app.route('/')
def home():
    return render_template('index.html', container=socket.gethostname())


@app.route('/count')
def count():
    visits = r.incr('request_count')
    return render_template(
        'count.html',
        visits=visits,
        visits_arabic=to_arabic(visits),
        container=socket.gethostname(),
    )


@app.route('/health')
def health():
    try:
        r.ping()
        return 'ok', 200
    except redis.exceptions.ConnectionError:
        return 'redis unavailable', 503


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
