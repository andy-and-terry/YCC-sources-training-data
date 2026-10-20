const bytes = new TextEncoder().encode("héllo €");
console.log(bytes.length, bytes);
console.log(new TextDecoder().decode(bytes));
