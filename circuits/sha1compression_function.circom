pragma circom 2.0.3;

function lrot(x, n) {
    return ((x << n) | (x >> (32-n))) & 0xFFFFFFFF;
}
