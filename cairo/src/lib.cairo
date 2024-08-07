use core::array::ArrayTrait;
fn main(mut n: Array<u32>) -> Array<felt252> {
    let r = fib(n.pop_front().unwrap());
    array![r.into()]
}

fn fib(n: u32) -> u32 {
    if n <= 1 {
        return n;
    }

    fib(n - 1) + fib(n - 2)
}

#[cfg(test)]
mod tests {
    use super::fib;

    #[test]
    #[available_gas(64000000)]
    fn it_works() {
        assert(fib(17) == 1597, 'it works!');
    }
}
