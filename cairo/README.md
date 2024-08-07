# Building circuit

First build the the compiler compatible with `stone-prover`

```bash
cargo install cairo1-compile --git https://github.com/cartridge-gg/stone-prover --rev 61fe80f79c6b55415e84763da7ec0cae822d437e
```

Now you can compile program

```bash
cairo1-compile compile src/lib.cairo > compiled.json
```

And pass arguments

# Proving

Pass the arguments to the program

```bash
cairo1-compile merge compiled.json input.json > program_input.json
```

And prove it using a prepared `podman` image

```bash
podman run -i --rm docker.io/neotheprogramist/stone-cairo:latest < checker_input.json
```
