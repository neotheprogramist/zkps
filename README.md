# ZK Benchmark

Simply run `./run.sh` to execute a benchmark for each of the proving systems

## Currently supported

- Cairo with `Stone` prover
- Noir with `Barretenberg` prover
- Rust with `sp1`
- Rust with `zkllvm`

## Limitations

The current benchmarking program is exponential fibonacci, with a default of 20 iterations, giving about 2^20 number of function calls.

Because the shape of the circuit is dependent on input, this is not optimal for building programs.
For this reason workarounds have to be used, as in the `generics.nr`
