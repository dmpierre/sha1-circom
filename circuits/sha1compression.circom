pragma circom 2.0.3;

include "./rotate.circom";  
include "./xor4.circom";

template Sha1compression() {
    signal input hin[160];
    signal input inp[512];
    signal output out[160];
    signal a[81][32];
    signal b[81][32];
    signal c[81][32];
    signal d[81][32];
    signal e[81][32];
    signal w[80][32];

    component rotatel[64];
    component xor4[64];

    var i;
    for (i=0; i<64; i++) rotatel[i] = RotL(32, 1);

    for (i=0; i<64; i++) xor4[i] = Xor4(32);

    var k;
    var t;

    for (t=0; t<=79; t++) {
        // Prepare message schedule
        if (t<=15) {
            for (k=0; k<32; k++) {
                w[t][k] <== inp[t*32+k];
            }
        } else {
            for (k=0; k<32; k++) {
                xor4[t-16].a[k] <== w[t-3][k];
                xor4[t-16].b[k] <== w[t-8][k];
                xor4[t-16].c[k] <== w[t-14][k];
                xor4[t-16].d[k] <== w[t-16][k];
            }
            for (k=0; k<32; k++) {
                rotatel[t-16].in[k] <== xor4[t-16].out[k];
            }
            for (k=0; k<32; k++) {
                w[t][k] <== rotatel[t-16].out[k];
            }
        }
    }

    // Initialize five working variables
    for (k=0; k<32; k++) {
        a[0][k] <== hin[k];
        b[0][k] <== hin[32*1 + k];
        c[0][k] <== hin[32*2 + k];
        d[0][k] <== hin[32*3 + k];
        e[0][k] <== hin[32*4 + k];
    } 

    for (t = 0; t<=79; t++) {

    }

    // TEMP FOR CHECKING THAT MESSAGE SCHEDULE PREPARATION IS CORRECT;
    for (t=0; t<=79; t++) {
        for (k=0; k<32; k++) {
            log(w[t][k]);
        }
    }



}