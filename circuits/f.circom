pragma circom 2.0.3;

include "./parity.circom";
include "../node_modules/circomlib/circuits/sha256/maj.circom";
include "../node_modules/circomlib/circuits/sha256/ch.circom";

template f_t(t) {

     signal input b[32];
     signal input c[32];
     signal input d[32];
     signal output out[32];

     component parity = Parity_t(32);
     component ch = Ch_t(32);
     component maj = Maj_t(32);

     var k;
     
     if (t <= 19) {

          // ch(x, y, z)
          for (k=0; k<32; k++) {
               ch.a[k] <== b[k];
               ch.b[k] <== c[k];
               ch.c[k] <== d[k];
          }

          for (k=0; k <32; k++) {
               out[k] <== ch.out[k];
          }

     } else {

          if (t <= 39 || t >= 60) {
               
               // parity(x, y, z)
               for (k=0; k < 32; k++) {
                    parity.a[k] <== b[k];
                    parity.b[k] <== c[k];
                    parity.c[k] <== d[k];
               }

               for (k=0; k < 32; k++) {
                    out[k] <== parity.out[k];
               }

          } else {

               // maj(x, y, z)
               for (k=0; k<32; k++) {
                    maj.a[k] <== b[k];
                    maj.b[k] <== c[k];
                    maj.c[k] <== d[k];
               }

               for (k=0; k<32; k++) {
                    out[k] <== maj.out[k];
               }
               
          }
     }

}