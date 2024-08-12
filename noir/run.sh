#!/bin/bash

nargo execute noir.gz && \
time bb prove -b ./target/noir.json  -w ./target/noir.gz -o ./target/proof