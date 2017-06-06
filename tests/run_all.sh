#!/bin/bash

export TEST_DIR="$PWD/tests"

./main.sh -r . -c tests/mvp_test.in | diff tests/mvp_test.out -
