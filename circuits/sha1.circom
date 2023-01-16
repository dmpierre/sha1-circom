pragma circom 2.0.3;

template Sha1(nBits) {
    signal input in[nBits];
    signal output out[160];

    var i;
    var k;
    var nBlocks;
    var bitsLastBlock;

    nBlocks = ((nBits + 64) \ 512) + 1;

    signal paddedIn[nBlocks * 512];

    for (k=0; k<nBits; k++) {
        paddedIn[k] <== in[k];
    }

    paddedIn[nBits] <== 1;

    for (k=nBits+1; k<nBlocks*512-64; k++) {
        paddedIn[k] <== 0;
    }   
}