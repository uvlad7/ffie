from invoke import task

LIBS = ["crystie", "rustie", "gotie", "cittie", "cpptie", "ziggie", "dittie", "swiftie", "haskie", "lltie"]

@task(default=True)
def build(c):
    c.run("bundle install", pty=True)
    c.run("pipenv install", pty=True)
    for lib in LIBS:
        with c.cd(lib):
            c.run("./build.sh", pty=True)
