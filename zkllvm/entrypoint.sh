#!/bin/bash

LOG_FILE=proving.log

# Compile and generate vrifier
cargo +zkllvm build --release --target assigner-unknown-unknown --features=zkllvm > $LOG_FILE 2> $LOG_FILE
transpiler -m gen-evm-verifier -c circuit.crct -t assignment.tbl -o verifier -e pallas > $LOG_FILE

# Assign inputs
assigner -b target/assigner-unknown-unknown/release/zkllvm-rust-template.ll -i inputs/example.inp -t assignment.tbl -c circuit.crct -e pallas > $LOG_FILE

# Generate proof
proof-generator-multi-threaded --circuit circuit.crct --assignment assignment.tbl --proof proof.bin > $LOG_FILE

tar -czf proof.tgz verifier circuit.crct proof.bin $LOG_FILE

cat proof.tgz