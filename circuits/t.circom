include "./rotate.circom";
include "../node_modules/circomlib/circuits/binsum.circom";

template T(t) {
     signal input a[32];
     signal input b[32];
     signal input c[32];
     signal input d[32];
     signal input e[32];
     signal input k[32];
     signal input w[32];

     component rotatel = RotL(32, 5);

     var k;
     for (k=0; k<32; k++) {
          rotatel.in[k] <== a[k];
     }

     component sum = BinSum(32, 5);

     signal output out[32];

}