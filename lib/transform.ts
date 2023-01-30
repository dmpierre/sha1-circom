export const buffer2bitArray = (b: Buffer) => {
  // from circomlib tests folder
  const res: number[] = [];
  for (let i = 0; i < b.length; i++) {
    for (let j = 0; j < 8; j++) {
      res.push((b[i] >> (7 - j)) & 1);
    }
  }
  return res;
};

export const bitArrayToHex = (arr: []) => {
  return parseInt(arr.join(""), 2).toString(16);
};


export const getHexHashFromSha1CircuitOut = (arrOut: any) => {
  const h0 = bitArrayToHex(arrOut.slice(0, 32).reverse());
  const h1 = bitArrayToHex(arrOut.slice(32, 64).reverse());
  const h2 = bitArrayToHex(arrOut.slice(64, 96).reverse());
  const h3 = bitArrayToHex(arrOut.slice(96, 128).reverse());
  const h4 = bitArrayToHex(arrOut.slice(128, 160).reverse());

  return `${h0}${h1}${h2}${h3}${h4}`;
}
