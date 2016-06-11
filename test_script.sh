#!/usr/bin/env bash

MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${MY_DIR}

${MY_DIR}/setup.sh

${MY_DIR}/bin/lein deps

${MY_DIR}/run_test.sh "samples.minimal"
${MY_DIR}/run_test.sh "samples.with-middleware"
${MY_DIR}/run_test.sh "samples.with-compojure"
${MY_DIR}/run_test.sh "samples.without-compojure"
${MY_DIR}/run_test.sh "samples.with-hiccup"
