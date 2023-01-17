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

    for (k = 0; k< 64; k++) {
        paddedIn[nBlocks*512 - k -1] <== (nBits >> k)&1;
    }

    component ha0 = H(0);
    component hb0 = H(1);
    component hc0 = H(2);
    component hd0 = H(3);
    component he0 = H(4);

    component sha1compression[nBlocks];

    for (i=0; i<nBlocks; i++) {
        sha1compression[i] = Sha1compression();

    }

}