pub fn fib30(n: u32) -> u32 {
    if n <= 1 { n } else { fib29(n) + fib28(n) }
}

pub fn fib29(n: u32) -> u32 {
    if n <= 1 { n } else { fib28(n) + fib27(n) }
}

pub fn fib28(n: u32) -> u32 {
    if n <= 1 { n } else { fib27(n) + fib26(n) }
}

pub fn fib27(n: u32) -> u32 {
    if n <= 1 { n } else { fib26(n) + fib25(n) }
}

pub fn fib26(n: u32) -> u32 {
    if n <= 1 { n } else { fib25(n) + fib24(n) }
}

pub fn fib25(n: u32) -> u32 {
    if n <= 1 { n } else { fib24(n) + fib23(n) }
}

pub fn fib24(n: u32) -> u32 {
    if n <= 1 { n } else { fib23(n) + fib22(n) }
}

pub fn fib23(n: u32) -> u32 {
    if n <= 1 { n } else { fib22(n) + fib21(n) }
}

pub fn fib22(n: u32) -> u32 {
    if n <= 1 { n } else { fib21(n) + fib20(n) }
}

pub fn fib21(n: u32) -> u32 {
    if n <= 1 { n } else { fib20(n) + fib19(n) }
}

pub fn fib20(n: u32) -> u32 {
    if n <= 1 { n } else { fib19(n) + fib18(n) }
}

pub fn fib19(n: u32) -> u32 {
    if n <= 1 { n } else { fib18(n) + fib17(n) }
}

pub fn fib18(n: u32) -> u32 {
    if n <= 1 { n } else { fib17(n) + fib16(n) }
}

pub fn fib17(n: u32) -> u32 {
    if n <= 1 { n } else { fib16(n) + fib15(n) }
}

pub fn fib16(n: u32) -> u32 {
    if n <= 1 { n } else { fib15(n) + fib14(n) }
}

pub fn fib15(n: u32) -> u32 {
    if n <= 1 { n } else { fib14(n) + fib13(n) }
}

pub fn fib14(n: u32) -> u32 {
    if n <= 1 { n } else { fib13(n) + fib12(n) }
}

pub fn fib13(n: u32) -> u32 {
    if n <= 1 { n } else { fib12(n) + fib11(n) }
}

pub fn fib12(n: u32) -> u32 {
    if n <= 1 { n } else { fib11(n) + fib10(n) }
}

pub fn fib11(n: u32) -> u32 {
    if n <= 1 { n } else { fib10(n) + fib9(n) }
}

pub fn fib10(n: u32) -> u32 {
    if n <= 1 { n } else { fib9(n) + fib8(n) }
}

pub fn fib9(n: u32) -> u32 {
    if n <= 1 { n } else { fib8(n) + fib7(n) }
}

pub fn fib8(n: u32) -> u32 {
    if n <= 1 { n } else { fib7(n) + fib6(n) }
}

pub fn fib7(n: u32) -> u32 {
    if n <= 1 { n } else { fib6(n) + fib5(n) }
}

pub fn fib6(n: u32) -> u32 {
    if n <= 1 { n } else { fib5(n) + fib4(n) }
}

pub fn fib5(n: u32) -> u32 {
    if n <= 1 { n } else { fib4(n) + fib3(n) }
}

pub fn fib4(n: u32) -> u32 {
    if n <= 1 { n } else { fib3(n) + fib2(n) }
}

pub fn fib3(n: u32) -> u32 {
    if n <= 1 { n } else { fib2(n) + fib1(n) }
}

pub fn fib2(n: u32) -> u32 {
    if n <= 1 { n } else { fib1(n) + fib0(n) }
}

pub fn fib1(n: u32) -> u32 {
    if n <= 1 { n } else { 1 }
}

pub fn fib0(n: u32) -> u32 {
    if n <= 1 { n } else { 0 }
}
