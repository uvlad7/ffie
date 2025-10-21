from invoke import task
import os
import sys

LIBS = set(["crystie", "rustie", "gotie", "cittie", "cpptie", "julitie", "ziggie", "dittie", "swiftie", "haskie", "lltie", "nimmie", "sharpie", "javie", "vallie", "oddie"])

# https://github.com/ruby/rake/blob/c6829ffcdfab370d1b5fe788f9ce928f81a8ac56/lib/rake/application.rb#L720
original_dir = os.getcwd()
location = os.path.dirname(os.path.abspath(__file__))
os.chdir(location)
if original_dir != location:
    print("(in {})".format(os.getcwd()), file=sys.stderr)

@task(default=True)
def build(c):
    # c.run("bundle install", pty=True, echo=True)
    # c.run("pipenv install", pty=True, echo=True)
    for lib in LIBS:
        with c.cd(lib):
            c.run("./build.sh", pty=True, echo=True)
