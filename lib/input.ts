export const getStringOfNBits = (nBits: number) => {
  // Should be a multiple of 8
  let str = "";
  const nChars = Math.floor(nBits / 8);
  for (let i = 0; i < nChars; i++) {
    str += "a";
  }
  return str;
};

export const getNRandomBits = (nBits: number) => {
     let bin = "0b";
     for (let i = 0; i < nBits; i++) {
          bin += +(Math.random() < 0.5);
     } 
     return bin
};
