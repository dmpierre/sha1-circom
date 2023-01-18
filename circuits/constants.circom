pragma circom 2.0.3;

template H(x) {
    signal output out[32];
    var c[5] = [
        0x67452301,
        0xefcdab89,
        0x98badcfe,
        0x10325476,
        0xc3d2e1f0
    ];

    for (var i=0; i<32; i++) {
        // binary representation of hex value
        out[i] <== (c[x] >> i) & 1;
    }
}