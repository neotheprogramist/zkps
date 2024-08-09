# Proven using platinum prover

## Installation

First install cairo-compile according to readme in this repository https://github.com/lambdaclass/lambdaworks

To install platinum prover use

```bash
CARGO_NET_GIT_FETCH_WITH_CLI=true cargo install cairo-platinum-prover --features=cli,instruments,parallel --git https://github.com/lambdaclass/lambdaworks
```

## Proving

To prove run the command below

```bash
platinum-prover compile-and-prove fib.cairo proof.json
```
