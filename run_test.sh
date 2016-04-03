#!/usr/bin/env bash
set -e

TEST_NAME=$1

if [ -z ${TEST_NAME} ]; then
  echo "Usage: ${0} <test_name>"
  echo "<test_name>   A test name that lein can run"
  exit 1
fi

OUTPUT_PATH="tmp/${TEST_NAME}.out"
BASE_PATH="http://localhost:3000"

rm -f ${OUTPUT_PATH}
touch ${OUTPUT_PATH}

echo "> PORT=3000 lein run -m ${TEST_NAME}"
PORT=3000 lein run -m ${TEST_NAME} &

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

(ps xau | grep ${TEST_NAME} | grep -v grep | awk {'print $2'} | xargs kill) &> /dev/null

clear
