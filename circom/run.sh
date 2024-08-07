#!/bin/bash

# Based on https://docs.circom.io/getting-started/compiling-circuits/

name="fib"
SHIP_CEREMONY=1

# compile

`circom $name.circom --r1cs --wasm --sym --c || exit 1
`
# witness


if [[ -z "${SHIP_CEREMONY}" ]]; then
    snarkjs powersoftau new bn128 12 pot12_0000.ptau -v
    snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" < entropy.txt

    snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v
    snarkjs groth16 setup $name.r1cs pot12_final.ptau "$name"_0000.zkey
    snarkjs zkey contribute "$name"_0000.zkey "$name"_0001.zkey --name="1st Contributor Name" -v  < entropy.txt
    snarkjs zkey export verificationkey "$name"_0001.zkey verification_key.json
fi


echo "PROVING"

node "$name"_js/generate_witness.js "$name"_js/$name.wasm input.json witness.wtns
snarkjs groth16 prove "$name"_0001.zkey witness.wtns proof.json public.json

# echo "VERIFYING"

# snarkjs groth16 verify verification_key.json public.json proof.json

# cat public.json
