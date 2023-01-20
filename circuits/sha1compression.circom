pragma circom 2.0.3;

include "./rotate.circom";  
include "./xor4.circom";

template Sha1compression() {
    signal input hin[160];
    signal input inp[512];
    signal output out[160];

    signal w[80][32];

    component rotatel[64];
    component xor4[64];

    for (var i=0; i<64; i++) rotatel[i] = RotL(32, 1);

    for (var i=0; i<64; i++) xor4[i] = Xor4(32);

    for (var t=0; t<=79; t++) {
        // Prepare message schedule
        if (t<=15) {
            for (var k=0; k<32; k++) {
                w[t][k] <== inp[t*32+k];
            }
        } else {
            for (var k=0; k<32; k++) {
                xor4[t-16].a[k] <== w[t-3][k];
                xor4[t-16].b[k] <== w[t-8][k];
                xor4[t-16].c[k] <== w[t-14][k];
                xor4[t-16].d[k] <== w[t-16][k];
            }
            for (var k=0; k<32; k++) {
                rotatel[t-16].in[k] <== xor4[t-16].out[k];
            }
            for (var k=0; k<32; k++) {
                w[t][k] <== rotatel[t-16].out[k];
            }
        }
    }

    // TEMP FOR CHECKING THAT MESSAGE SCHEDULE PREPARATION IS CORRECT;
    for (var t=0; t<=79; t++) {
        for (var k=0; k<32; k++) {
            log(w[t][k]);
        }
    }

}