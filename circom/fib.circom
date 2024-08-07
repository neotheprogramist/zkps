pragma circom 2.0.0;

template Fibonacci(n) {
  signal output out;

  component f1, f2;
  if (n <= 1) {
    out <== n;
  } else {
    f1 = Fibonacci(n-1);
    f2 = Fibonacci(n-2);
    out <== f1.out + f2.out ;
  }
}

component main = Fibonacci(5);
