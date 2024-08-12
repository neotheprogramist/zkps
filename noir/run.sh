#!/bin/bash

# bbup -v v0.42.0 && noirup -v 0.32.0

nargo execute noir.gz && \
time bb prove -b ./target/noir.json  -w ./target/noir.gz -o ./target/proof