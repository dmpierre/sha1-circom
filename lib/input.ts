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
  return bin;
};

export const getSha1PaddedMessage = (bytesMessage: Uint8Array) => {
  // pad a pre-image to obtain n message blocks (1 <= n <= maxBlocks).
  let bitLengthMessage = (bytesMessage.length * 8).toString(2);
  let bitString = "";

  bytesMessage.forEach((b) => {
    let bits = b.toString(2);
    // each byte should have 8 bits, not ignoring leading zeros 00100010
    const nPadFront = "0".repeat(8 - bits.length);
    bits = `${nPadFront}${bits}`;
    bitString += bits;
  });

  // pad with 1 bit.
  bitString += "1";

  // pad with 0 
  // length of current bit string + 64 (bits length of message) + zero padding 
  // should be multiple of 512
  let zeroPadding = "";
  while ((bitString.length + zeroPadding.length + 64) % 512 != 0) {
    zeroPadding += "0";
  }

  bitString += `${zeroPadding}`;

  // format message length to 64 bits string
  const nPadFront = "0".repeat(64 - bitLengthMessage.length);
  bitLengthMessage = `${nPadFront}${bitLengthMessage}`;
  
  return `${bitString}${bitLengthMessage}`;
};
