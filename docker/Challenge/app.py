from flask import Flask
import os
import redis

redis_host = os.getenv('REDIS_HOST', 'localhost')
redis_port = int(os.getenv('REDIS_PORT', '6379'))

r = redis.Redis(host=redis_host, port=redis_port, decode_responses=True)

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Welcome to my Application'

@app.route('/count')
def count():
    visits = r.incr('request_count')
    return f'Count of requests: {visits}'

@app.route('/health')
def health():
    try:
        r.ping()
        return 'ok', 200
    except redis.exceptions.ConnectionError:
        return 'redis unavailable', 503

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)