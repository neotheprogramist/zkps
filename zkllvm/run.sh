#!/bin/bash

podman build -t zkllvm . > build.log && \
time podman run zkllvm:latest > out.tgz