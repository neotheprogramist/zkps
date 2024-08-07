#![no_main]
#![feature(const_trait_impl)]
#![feature(effects)]

use ark_ff::MontFp;
use ark_pallas::Fq;

#[circuit]
pub fn field_arithmetic_example(n: Fq) -> Fq {
    const ZERO: Fq = MontFp!("0x0");
    const ONE: Fq = MontFp!("0x1");
    const TWO: Fq = MontFp!("0x2");

    if n == ZERO {
        return ZERO;
    } else if n == ONE {
        return ONE;
    }

    field_arithmetic_example(n - ONE) + field_arithmetic_example(n - TWO)
}
