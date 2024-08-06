pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template Square () {  

   // Declaration of signals.
   signal input n;
   signal b;  
   signal output c;  

   // Constraints.
   b <== n;
   c <== b * n;
}

component main = Square();