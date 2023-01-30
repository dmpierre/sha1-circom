//@ts-ignore
import wasm_tester from "circom_tester/wasm/tester";
import path from "path";
import * as crypto from "crypto";
import { bitArrayToHex, buffer2bitArray } from "../lib/transform";
import { expect } from "chai";

describe("Computing SHA-1", () => {
  it("Should output correct hash value of a 24bits input", async () => {
    
    const cir = await wasm_tester(path.join(__dirname, "../../test/circuits/main24.circom"));

    const testStr = "abc";
    const b = Buffer.from(testStr, "utf-8");

    const hash = crypto.createHash("sha1").update(b).digest("hex");

    const arrIn = buffer2bitArray(b);
    const witness = await cir.calculateWitness({ in: arrIn }, true);
    const arrOut = witness.slice(1, 161);

    const h0 = bitArrayToHex(arrOut.slice(0, 32).reverse());
    const h1 = bitArrayToHex(arrOut.slice(32, 64).reverse());
    const h2 = bitArrayToHex(arrOut.slice(64, 96).reverse());
    const h3 = bitArrayToHex(arrOut.slice(96, 128).reverse());
    const h4 = bitArrayToHex(arrOut.slice(128, 160).reverse());

    const formattedHashOut = `${h0}${h1}${h2}${h3}${h4}`;

    expect(hash).equal(formattedHashOut);
  });
  it("Should output correct hash value of 512bits inputs", async () => {
    const cir = await wasm_tester(path.join(__dirname, "../../test/circuits/main512.circom"));
    const testStr = "abcabcababcabcababcabcababcabcababcabcababcabcababcabcababcabcab";
    const b = Buffer.from(testStr, "utf-8");

    const hash = crypto.createHash("sha1").update(b).digest("hex");

    const arrIn = buffer2bitArray(b);
    const witness = await cir.calculateWitness({ in: arrIn }, true);
    const arrOut = witness.slice(1, 161);

    const h0 = bitArrayToHex(arrOut.slice(0, 32).reverse());
    const h1 = bitArrayToHex(arrOut.slice(32, 64).reverse());
    const h2 = bitArrayToHex(arrOut.slice(64, 96).reverse());
    const h3 = bitArrayToHex(arrOut.slice(96, 128).reverse());
    const h4 = bitArrayToHex(arrOut.slice(128, 160).reverse());

    const formattedHashOut = `${h0}${h1}${h2}${h3}${h4}`;

    expect(hash).equal(formattedHashOut);
    
  })
});
