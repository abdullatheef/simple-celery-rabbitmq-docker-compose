from celery import Celery

app = Celery('tasks', broker='pyamqp://guest@rabbitmq_server//')

@app.task
def add(x, y):
    return x + y