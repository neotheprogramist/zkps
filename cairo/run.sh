#!/bin/bash

cairo1-compile compile src/lib.cairo > compiled.json && \
cairo1-compile merge compiled.json input.json > program_input.json && \

# Based on: https://stackoverflow.com/questions/13356628/how-to-redirect-the-output-of-the-time-command-to-a-file-in-linux
{ time podman run -i --rm docker.io/neotheprogramist/stone-cairo:latest < program_input.json > proof.json ; }