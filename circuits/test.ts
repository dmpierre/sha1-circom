//@ts-ignore
import wasm_tester from "circom_tester/wasm/tester";
import path from "path";
import { exit } from "process";

function buffer2bitArray(b: Buffer) {
  const res: number[] = [];
  for (let i = 0; i < b.length; i++) {
    for (let j = 0; j < 8; j++) {
      res.push((b[i] >> (7 - j)) & 1);
    }
  }
  return res;
}

async function main() {
  const cir = await wasm_tester(path.join(__dirname, "main.circom"));
  const testStr = "abc";
  const b = Buffer.from(testStr, "utf-8");
  const arrIn = buffer2bitArray(b);
  const witness = await cir.calculateWitness({ in: arrIn }, true);
}

main().then((res) => exit());
