#!/bin/bash

export TEST_DIR="$PWD/tests"
tests_to_run=(
    bad_map_test
    base_test
    base64_filename_too_long_like_actually_way_too_long_beyond_reasonable_length_that_files_should_naturally_be_test
    fake_image_test
    img_test
    img_test_png
    img_map_test
    url_test
)

FAILED=0

for test in "${tests_to_run[@]}"; do
    echo "$test"
    ./main.sh -r . -c "tests/${test}.in" -s "tests/${test}" | diff "tests/${test}.out" - && echo "Pass" || FAILED=1
done

exit $FAILED
