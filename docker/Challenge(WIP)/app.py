from flask import Flask
import redis
r = redis.Redis(host='redis', port=6379, decode_responses=True)

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Welcome to my Application'

@app.route('/count')
def count():
    visits = r.incr('request_count')
    return f'Count of requests: {visits}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)