from invoke import task

@task
def build(c):
    c.run("pipenv install")
