#!/bin/bash

export TEST_DIR="$PWD/tests"

./main.sh -r . -c tests/img_test.in | diff tests/img_test.out -
./main.sh -r . -c tests/base_test.in | diff tests/base_test.out -
