mod generics;

use generics::{
    fib0, fib1, fib2, fib3, fib4, fib5, fib6, fib7, fib8, fib9, fib10, fib11, fib12, fib13, fib14,
    fib15, fib16, fib17, fib18, fib19, fib20, fib21, fib22, fib23, fib24, fib25, fib26, fib27, fib28,
    fib29, fib30
};

fn main(n: u32) -> pub u32 {
    fib(n)
}

// fn fib(n: u32) -> u32 {
//     if n <= 1 { n } else { fib(n - 1) + fib(n - 2) }
// }

fn fib(n: u32) -> u32 {
    // Noir does not support recursion, so we have to have separate functions for each fib number.

    if n == 0 {
        fib0(n)
    } else if n == 1 {
        fib1(n)
    } else if n == 2 {
        fib2(n)
    } else if n == 3 {
        fib3(n)
    } else if n == 4 {
        fib4(n)
    } else if n == 5 {
        fib5(n)
    } else if n == 6 {
        fib6(n)
    } else if n == 7 {
        fib7(n)
    } else if n == 8 {
        fib8(n)
    } else if n == 9 {
        fib9(n)
    } else if n == 10 {
        fib10(n)
    } else if n == 11 {
        fib11(n)
    } else if n == 12 {
        fib12(n)
    } else if n == 13 {
        fib13(n)
    } else if n == 14 {
        fib14(n)
    } else if n == 15 {
        fib15(n)
    } else if n == 16 {
        fib16(n)
    } else if n == 17 {
        fib17(n)
    } else if n == 18 {
        fib18(n)
    } else if n == 19 {
        fib19(n)
    } else if n == 20 {
        fib20(n)
    } else if n == 21 {
        fib21(n)
    } else if n == 22 {
        fib22(n)
    } else if n == 23 {
        fib23(n)
    } else if n == 24 {
        fib24(n)
    } else if n == 25 {
        fib25(n)
        // Compilation takes as long as the greates fibbonaci number
        // } else if n == 26 {
        //     fib26(n)
        // } else if n == 27 {
        //     fib27(n)
        // } else if n == 28 {
        //     fib28(n)
        // } else if n == 29 {
        //     fib29(n)
        // } else if n == 30 {
        //     fib30(n)
    } else {
        assert(false, "fib: n must be between 0 and 30");
        0
    }
}

#[test]
fn test_main() {
    let _ = main(1);
    // Uncomment to make test fail
    // main(1, 1);
}
