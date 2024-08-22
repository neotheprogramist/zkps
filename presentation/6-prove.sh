#!/bin/bash

./cpu_air_prover \
    --private_input_file target/main_air_private_input.json \
    --public_input_file target/main_air_public_input.json \
    --prover_config_file config/cpu_air_prover_config.json \
    --parameter_file config/cpu_air_params.json \
    --generate_annotations \
    --out_file target/main_proof.json
