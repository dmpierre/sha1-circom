import { getSha1PaddedMessage } from "../lib/input";

const main = () => {
  const utf8Encoder = new TextEncoder();
  const value = "abc";
  const encodedBytesArray = utf8Encoder.encode(value);
  const paddedMessage = getSha1PaddedMessage(encodedBytesArray);
};

main();
