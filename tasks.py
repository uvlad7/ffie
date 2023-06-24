from invoke import task

@task(default=True)
def build(c):
    c.run("pipenv install")
