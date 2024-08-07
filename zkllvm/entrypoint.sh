#!/bin/bash

# Compile and generate vrifier
cargo +zkllvm build --release --target assigner-unknown-unknown --features=zkllvm
transpiler -m gen-evm-verifier -c circuit.crct -t assignment.tbl -o verifier -e pallas

# Assign inputs
assigner -b target/assigner-unknown-unknown/release/zkllvm-rust-template.ll -i inputs/example.inp -t assignment.tbl -c circuit.crct -e pallas

# Generate proof
proof-generator-multi-threaded --circuit circuit.crct --assignment assignment.tbl --proof proof.bin

cat proof.bin