function encodeBytes(buffer) {
  return Buffer.from(buffer).toString('base64');
}

function decodeString(text) {
  return Buffer.from(text, 'base64');
}

const encoded = encodeBytes(Buffer.from('hello world'));
console.log(encoded);
console.log(decodeString(encoded).toString());
module.exports = { encodeBytes, decodeString };
