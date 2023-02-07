pragma circom 2.1.3;

include "./constants/constants.circom";
include "./functions/sha1compression.circom";

template Sha1General(maxNBits) {
    /*
    * Compute SHA1 on pre-images with arbitrary lengths. 
    * For arbitrary fixed pre-image lengths, use the Sha1 template (sha1.circom)
    */
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

        if (i==0) {
            for (k=0; k<32; k++) {
                sha1compression[i].hin[0*32+k] <== ha0.out[k];
                sha1compression[i].hin[1*32+k] <== hb0.out[k];
                sha1compression[i].hin[2*32+k] <== hc0.out[k];
                sha1compression[i].hin[3*32+k] <== hd0.out[k];
                sha1compression[i].hin[4*32+k] <== he0.out[k];
            }
        } else {
            for (k=0; k<32; k++) {
                sha1compression[i].hin[32*0+k] <== sha1compression[i-1].out[32*0+31-k];
                sha1compression[i].hin[32*1+k] <== sha1compression[i-1].out[32*1+31-k];
                sha1compression[i].hin[32*2+k] <== sha1compression[i-1].out[32*2+31-k];
                sha1compression[i].hin[32*3+k] <== sha1compression[i-1].out[32*3+31-k];
                sha1compression[i].hin[32*4+k] <== sha1compression[i-1].out[32*4+31-k];
            } 
        }

        for (k=0; k<512; k++) {
            sha1compression[i].inp[k] <== paddedIn[i*512+k];
        }
        
    }

    for (k=0; k<160; k++) {
        out[k] <== sha1compression[nBlocks-1].out[k];
    }
}