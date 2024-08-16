#!/bin/bash

podman build -t zkllvm . > build.log && \
podman run zkllvm:latest