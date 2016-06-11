#!/usr/bin/env bash
set -e

TEST_NAME=$1

if [ -z ${TEST_NAME} ]; then
  echo "Usage: ${0} <test_name>"
  echo "<test_name>   A test name that lein can run"
  echo "Known choices are: samples.minimal, samples.with-compojure, samples.with-hiccup, samples.with-middleware, samples.without-compojure"
  exit 1
fi

BASE_PATH="http://localhost:3000"

MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${MY_DIR}

mkdir -p ${MY_DIR}/tmp
${MY_DIR}/setup.sh
OUTPUT_PATH="${MY_DIR}/tmp/${TEST_NAME}.out"

rm -f ${OUTPUT_PATH}
touch ${OUTPUT_PATH}

echo "> PORT=3000 lein run -m ${TEST_NAME}"
PORT=3000 ${MY_DIR}/bin/lein run -m ${TEST_NAME} &

sleep 10

echo "> curl '${BASE_PATH}/' -I -s" | tee -a ${OUTPUT_PATH}
curl "${BASE_PATH}/" -I -s | tee -a ${OUTPUT_PATH}
echo "" | tee -a ${OUTPUT_PATH}
echo "> curl '${BASE_PATH}/' -s" | tee -a ${OUTPUT_PATH}
curl "${BASE_PATH}/" -s | tee -a ${OUTPUT_PATH}
echo "" | tee -a ${OUTPUT_PATH}
echo "" | tee -a ${OUTPUT_PATH}
echo "> curl '${BASE_PATH}/testing' -I -s" | tee -a ${OUTPUT_PATH}
curl "${BASE_PATH}/testing" -I -s | tee -a ${OUTPUT_PATH}
echo "" | tee -a ${OUTPUT_PATH}
echo "> curl '${BASE_PATH}/testing' -s" | tee -a ${OUTPUT_PATH}
curl "${BASE_PATH}/testing" -s | tee -a ${OUTPUT_PATH}
echo "" | tee -a ${OUTPUT_PATH}
echo "" | tee -a ${OUTPUT_PATH}
echo "> curl '${BASE_PATH}/js/template.js' -I -s" | tee -a ${OUTPUT_PATH}
curl "${BASE_PATH}/js/template.js" -I -s | tee -a ${OUTPUT_PATH}
echo "" | tee -a ${OUTPUT_PATH}
echo "> curl '${BASE_PATH}/js/template.js' -s" | tee -a ${OUTPUT_PATH}
curl "${BASE_PATH}/js/template.js" -s | tee -a ${OUTPUT_PATH}
echo "" | tee -a ${OUTPUT_PATH}
echo "" | tee -a ${OUTPUT_PATH}
echo "> curl '${BASE_PATH}/css/template.css' -I -s" | tee -a ${OUTPUT_PATH}
curl "${BASE_PATH}/css/template.css" -I -s | tee -a ${OUTPUT_PATH}
echo "" | tee -a ${OUTPUT_PATH}
echo "> curl '${BASE_PATH}/css/template.css' -s" | tee -a ${OUTPUT_PATH}
curl "${BASE_PATH}/css/template.css" -s | tee -a ${OUTPUT_PATH}
echo "" | tee -a ${OUTPUT_PATH}
echo "" | tee -a ${OUTPUT_PATH}

ps xau | grep ${TEST_NAME} | grep -v grep | grep -v ${0} | awk {'print $2'} | xargs kill
