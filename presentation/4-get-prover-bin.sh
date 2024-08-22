#!/bin/bash

# https://lambdaclass.github.io/lambdaworks/starks/cairo_trace_descriptive.html#raw-materials
# https://github.com/starkware-libs/stone-prover?tab=readme-ov-file#building-using-the-dockerfile
container_id=$(podman create ghcr.io/cartridge-gg/stone-prover:main)
podman cp ${container_id}:/usr/bin/cpu_air_prover .
podman cp ${container_id}:/usr/bin/cpu_air_verifier .
