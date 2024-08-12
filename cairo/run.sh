#!/bin/bash

cairo1-compile compile src/lib.cairo > compiled.json && \
cairo1-compile merge compiled.json input.json > program_input.json && \
time podman run -i --rm docker.io/neotheprogramist/stone-cairo:latest < program_input.json