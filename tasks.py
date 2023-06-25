from invoke import task

LIBS = set(["crystie", "rustie", "gotie", "cittie", "cpptie", "julitie", "ziggie", "dittie", "swiftie", "haskie", "lltie"]) - set(["julitie"])

@task(default=True)
def build(c):
    c.run("bundle install", pty=True, echo=True)
    c.run("pipenv install", pty=True, echo=True)
    for lib in LIBS:
        with c.cd(lib):
            c.run("./build.sh", pty=True, echo=True)
