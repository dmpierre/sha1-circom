include "../node_modules/circomlib/circuits/sha256/xor3.circom";

template Parity(n) {
     signal input a[n];
     signal input b[n];
     signal input c[n];
     signal output out[n];

     signal xor3 = Xor3(32);
     var k;

     for (k=0; k<32; k++) {
          xor3.a[k] <== a[k];
          xor3.b[k] <== b[k];
          xor3.c[k] <== c[k];
     }

     for (k=0; k<32; k++) {
          out[k] <== xor3.out[k];
     }
}