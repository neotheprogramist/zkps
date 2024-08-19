pragma circom 2.0.0;

template Factors(d) {
  signal input n;
  // signal output m;
  signal output factors[d];
  signal cumulative[d];

  var leftover = n;
  var divider = 2;

  // Throws `signal already assigned` when using a while loop.
  for (var f = 0; f < d; f++) {
    var factor;

    while (leftover % divider != 0 && divider <= leftover) {
      divider++;
    }

    if (divider > leftover) {
      // No more factors to find, just have to pad with ones.
      factor = 1;
    } else {
      factor = divider;
      leftover = leftover / divider;
    }

    factors[f] <-- factor;
  }

  // Constraint have to be quadratic, so we have to multiply one by one.
  cumulative[0] <== factors[0];
  for (var i = 1; i < d; i++) {
    cumulative[i] <== factors[i] * cumulative[i-1];
  }

  cumulative[d-1] === n;
}

component main = Factors(3);
