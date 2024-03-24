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

export const bitArrayToHex = (arr: number[] | bigint[]) => {
  return parseInt(arr.join(""), 2).toString(16).padStart(arr.length / 4, '0')
};


export const getHexHashFromSha1CircuitOut = (arrOut: any) => {
  const h0 = bitArrayToHex(arrOut.slice(0, 32));
  const h1 = bitArrayToHex(arrOut.slice(32, 64));
  const h2 = bitArrayToHex(arrOut.slice(64, 96));
  const h3 = bitArrayToHex(arrOut.slice(96, 128));
  const h4 = bitArrayToHex(arrOut.slice(128, 160));

  return `${h0}${h1}${h2}${h3}${h4}`;
}
