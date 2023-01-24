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
        out[i] <== (c[x] >> i) & 1;
    }
}

template K(t) {
    signal output out[32];
    var k[4] = [0x5a827999, 0x6ed9eba1, 0x8f1bbcdc, 0xca621d6];

    var i;
    if (t <= 19) {
        for (i = 0; i<32; i++) {
            out[i] <== (k[0] >> i) & 1;
        }
    } else {
        if (t <= 39) {
            for (i =0; i < 32; i++ ){
                out[i] <== (k[1] >> i) & 1;
            }
        } else {
            if (t <= 59) {
                for (i =0; i < 32; i++ ){
                    out[i] <== (k[2] >> i) & 1;
                }
            } else {
                    for (i =0; i < 32; i++ ){
                        out[i] <== (k[3] >> i) & 1;
                    }
            }
        }
    }
}