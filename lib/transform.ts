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
