//@ts-ignore
import wasm_tester from "circom_tester/wasm/tester";
import path from "path";
import * as crypto from "crypto";
import { expect } from "chai";
import {
  buffer2bitArray,
  getHexHashFromSha1CircuitOut,
} from "../lib/transform";
import { getStringOfNBits } from "../lib/input";

describe("Computing SHA-1", () => {
  it("Should output correct hash value of a 24bits input", async () => {
    const cir = await wasm_tester(
      path.join(__dirname, "../../test/circuits/main24.circom")
    );

    const testStr = getStringOfNBits(24);
    const b = Buffer.from(testStr, "utf-8");
    const arrIn = buffer2bitArray(b);
    const witness = await cir.calculateWitness({ in: arrIn }, true);
    const arrOut = witness.slice(1, 161);

    const circuitHashOut = getHexHashFromSha1CircuitOut(arrOut);

    const hash = crypto.createHash("sha1").update(b).digest("hex");

    expect(hash).equal(circuitHashOut);
  });

  it("Should output correct hash value of 512bits inputs", async () => {
    const cir = await wasm_tester(
      path.join(__dirname, "../../test/circuits/main512.circom")
    );

    const testStr = getStringOfNBits(512);
    const b = Buffer.from(testStr, "utf-8");
    const arrIn = buffer2bitArray(b);
    const witness = await cir.calculateWitness({ in: arrIn }, true);
    const arrOut = witness.slice(1, 161);
    const circuitHashOut = getHexHashFromSha1CircuitOut(arrOut);

    const hash = crypto.createHash("sha1").update(b).digest("hex");

    expect(hash).equal(circuitHashOut);
  });
});
