from flask import Flask, request
app = Flask(__name__)

def fib_recur(n):
    if n <= 1:
        return n
    else:
        return (fib_recur(n - 1) + fib_recur(n - 2))

@app.route('/nic/flask/hello')
def hello():
	return "Hello World!"

@app.route('/nic/flask/fib', methods=['GET'])
def fib():
    args = request.args
    n = args.get('n', 0, int)
    if n <= 0:
        return "Please enter a positive integer!"
    else:
        fn = fib_recur(n)
        return f"The Fibonacci number in position {n} is: {fn}"

if __name__ == '__main__':
	app.run(host='0.0.0.0', port=8000)
