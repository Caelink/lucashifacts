#!/bin/bash

export TEST_DIR="$PWD/tests"
tests_to_run=(img_test img_test_png base_test)

for test in "${tests_to_run[@]}"; do
  echo "$test"
  ./main.sh -r . -c "tests/${test}.in" | diff "tests/${test}.out" - && echo "Pass"
done
