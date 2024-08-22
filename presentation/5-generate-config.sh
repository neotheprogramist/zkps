#!/bin/bash

# https://github.com/starkware-libs/stone-prover/blob/main/src/starkware/fri/fri_parameters.h#L29-L43

# cargo install --git https://github.com/neotheprogramist/genereate-config --branch bin
config-generator --input target/main_air_public_input.json --output config/cpu_air_params.json
