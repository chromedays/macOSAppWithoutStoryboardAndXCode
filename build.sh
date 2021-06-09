#!/bin/bash

mkdir foo.app
pushd foo.app
mkdir Contents
pushd Contents
touch Info.plist
mkdir MacOS
popd
popd

/usr/bin/clang -x objective-c -g -O0 main.m -o foo.app/Contents/MacOS/foo -framework Cocoa -framework Foundation