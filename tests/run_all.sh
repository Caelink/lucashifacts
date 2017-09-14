#!/bin/bash

export TEST_DIR="$PWD/tests"
tests_to_run=(
    img_test
    img_test_png
    fake_image_test
    base_test
    url_test
    base64_filename_too_long_like_actually_way_too_long_beyond_reasonable_length_that_files_should_naturally_be_test
)

for test in "${tests_to_run[@]}"; do
    echo "$test"
    ./main.sh -r . -c "tests/${test}.in" | diff "tests/${test}.out" - && echo "Pass"
done
