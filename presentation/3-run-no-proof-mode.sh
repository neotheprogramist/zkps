#!/bin/bash

# https://github.com/starkware-libs/stone-prover/blob/main/src/starkware/fri/fri_parameters.h#L29-L43
cairo1-run \
    --layout recursive \
    --print_output \
    --args "[10]" \
    example/target/dev/example.sierra.json
