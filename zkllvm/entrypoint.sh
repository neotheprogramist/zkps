#!/bin/bash

cargo +zkllvm build --release --target assigner-unknown-unknown --features=zkllvm

assigner -b target/assigner-unknown-unknown/release/zkllvm-rust-template.ll -i inputs/example.inp -t assignment.tbl -c circuit.crct -e pallas

proof-generator-multi-threaded --circuit circuit.crct --assignment assignment.tbl --proof proof.bin

cat proof.bin