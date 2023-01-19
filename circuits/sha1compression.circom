pragma circom 2.0.3;

include "../node_modules/circomlib/circuits/sha256/xor3.circom";
include "./rotate.circom";

template Sha1compression() {
    signal input hin[160];
    signal input inp[512];
    signal output out[160];

    signal w[80][32];

    for (t=0; t<=79; t++) {
        if (t<=15) {
            for (k=0; k<32; k++) {
                w[t][k] <== inp[t*32+k];
            }
        } else {
            for (k=0; k<32; k++) {
                
            }
        }
    }
}