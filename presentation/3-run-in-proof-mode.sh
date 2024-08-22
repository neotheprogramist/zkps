#!/bin/bash

# https://github.com/starkware-libs/stone-prover/blob/main/src/starkware/fri/fri_parameters.h#L29-L43
# https://github.com/lambdaclass/cairo-vm/blob/main/cairo1-run/README.md#L64
# https://lambdaclass.github.io/lambdaworks/starks/cairo_trace_descriptive.html#raw-materials
cairo1-run \
    --trace_file target/main_trace.bin \
    --memory_file target/main_memory.bin \
    --air_public_input target/main_air_public_input.json \
    --air_private_input target/main_air_private_input.json \
    --print_output \
    --proof_mode \
    --layout recursive \
    --args "[10]" \
    example/target/dev/example.sierra.json
