![](https://img.shields.io/badge/circom-2.1.3-lightgrey) ![](./test/report/badges/testReport.svg)

:warning: This is a WIP, with incomplete testing and unaudited code. Avoid production usage.

### Description

This repo provides a working SHA1 implementation in [circom](https://docs.circom.io/). Implementation is inspired from [circomlib SHA256](https://github.com/iden3/circomlib/tree/master/circuits/sha256), but adapted and tweaked to fit SHA1 specificities. 

`circuits` contains all necessary circuits for running SHA1 on arbitrary binary inputs. See `test/sha1.ts` for usage.

Work done under a Privacy and Scaling Exploration ([PSE](https://appliedzkp.org/)) grant.

### Usage

Run `yarn install`. 

In order to run tests out-of-the-box, an example `.zkey` comes with this repo. It should not be used in prduction. 

See `test` folder for example usage.

### Resources

- [circomlib](https://github.com/iden3/circomlib)
- [FIPS 180-4](https://csrc.nist.gov/publications/detail/fips/180/4/final)

