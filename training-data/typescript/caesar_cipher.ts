function encrypt(text: string, shift: number): string {
  return text.replace(/[a-zA-Z]/g, (ch) => {
    const base = ch === ch.toUpperCase() ? 65 : 97;
    return String.fromCharCode(((ch.charCodeAt(0) - base + shift) % 26 + 26) % 26 + base);
  });
}

function decrypt(text: string, shift: number): string {
  return encrypt(text, -shift);
}

const cipher = encrypt('Hello, World!', 3);
console.log(cipher);
console.log(decrypt(cipher, 3));
