func main() {
    // Call fib(1, 1, 10).
    let result: felt = fib(1, 1, 10);

    // Make sure the 10th Fibonacci number is 144.
    ret;
}

// TODO: make less optimal
func fib(first_element, second_element, n) -> (res: felt) {
    jmp fib_body if n != 0;
    return (0,);

    fib_body:
    tempvar y = first_element + second_element;
    return fib(second_element, y, n - 1);
}

