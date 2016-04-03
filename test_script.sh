#!/usr/bin/env bash

mkdir -p tmp/
./run_test.sh "samples.minimal"
./run_test.sh "samples.with-middleware"
./run_test.sh "samples.with-compojure"
./run_test.sh "samples.without-compojure"
./run_test.sh "samples.with-hiccup"
