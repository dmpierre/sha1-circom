pragma circom 2.0.3;

template RotL(n, r) {
    signal input in[n];
    signal output out[n];

    for (var i=(n-1); i >= 0; i--) {
        out[i] <== in[ (i+r)%n ]
    }
}