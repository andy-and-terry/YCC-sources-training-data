function xorTransform(data, key) {
  const keyBuf = Buffer.from(key);
  return Buffer.from(data.map((b, i) => b ^ keyBuf[i % keyBuf.length]));
}

const key = 'secret';
const ciphertext = xorTransform(Buffer.from('hello world'), key);
console.log(ciphertext);
console.log(xorTransform(ciphertext, key).toString());
module.exports = { xorTransform };
