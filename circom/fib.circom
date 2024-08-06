pragma circom 2.0.0;

template Fibb (m) {
   signal input n;
   signal output r;
   signal fib[m+1];

   fib[0] <== 0;
   fib[1] <== 1;

   r <== fib[n] * n * n;
}

component main = Fibb(2);
