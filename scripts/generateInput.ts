/**
 * Generate an input json for a string of an arbitrary length
 */

import { getStringOfNBits } from "../lib/input";
import { buffer2bitArray } from "../lib/transform";
import fs from "fs";
import { exit } from "process";

const main = (nBits: number) => {
  const str = getStringOfNBits(8);
  console.log(str);
  const bufferStr = Buffer.from(str, "utf-8");
  console.log(bufferStr);
  const bitString = buffer2bitArray(bufferStr);
  const json = { in: bitString };
  console.log(json);
  fs.writeFileSync(`data/input_${nBits}.json`, JSON.stringify(json));
  return 0;
};

exit(main(5));
