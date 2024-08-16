#!/bin/bash

cd script && \
cargo build --bin prove --release 2>1 && \
{ time cargo run --bin prove --release 2>1; }