export const getStringOfNBits = (nBits: number) => {
     // Should be a multiple of 8
     let testStr = "";
     const nChars = Math.floor(nBits/8);
     for (let i=0; i < nChars; i++) {
       testStr += "a";
     }
     return testStr;
   }
   