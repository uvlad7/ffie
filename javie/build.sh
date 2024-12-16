#!/usr/bin/env bash
# javac -d ./build Javie.java && cd build && jar cvf ../javie.jar ./* > /dev/null && cd ..
# javac -d ./build Javie.java && jar cvf javie.jar ./build/* > /dev/null
javac -d . Javie.java && jar cvf javie.jar ./*.class > /dev/null
