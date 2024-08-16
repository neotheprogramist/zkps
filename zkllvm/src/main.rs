#![no_main]
#![feature(const_trait_impl)]
#![feature(effects)]

use ark_ff::MontFp;
use ark_pallas::Fq;

const ZERO: Fq = MontFp!("0x0");
const ONE: Fq = MontFp!("0x1");
// const TWO: Fq = MontFp!("0x2");

#[circuit]
pub fn field_arithmetic_example(n: Fq) -> Fq {
    fib(n)
}

fn fib(n: Fq) -> Fq {
    if n == ZERO {
        return ZERO;
    } else if n == ONE {
        return ONE;
    }

    // fib(n - ONE) + fib(n - TWO) + ZERO

    n
}
