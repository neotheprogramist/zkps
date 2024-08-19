use core::array::ArrayTrait;
fn main(mut n: Array<u32>) -> Array<felt252> {
    let mut n = n.pop_front().unwrap();

    let mut divider = 2;
    let mut factors = array![];

    while(divider <= n) {
        if (n % divider == 0) {
            factors.append(divider .into());
            n /= divider;
        } else {
            divider += 1;
        }
    };

    factors
}


#[cfg(test)]
mod tests {
    use super::main;

    #[test]
    #[available_gas(64000000)]
    fn factor_70() {
        let n = 70;

        let result = main(array![n]);
        let expected = array![2, 5, 7];
        assert(result == expected, 'it works!');
    }

    #[test]
    #[available_gas(64000000)]
    fn factor_big() {
        let n = 3865438800;

        let result = main(array![n]);
        let expected = array![2, 2,2,2, 3,3,3, 5,5,71,71,71];
        assert(result == expected, 'it works!');

    }
}
