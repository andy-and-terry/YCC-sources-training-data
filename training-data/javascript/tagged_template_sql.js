function sql(strings, ...values) {
  return { text: strings.reduce((a, s, i) => a + "$" + i + s), values };
}

const id = 5, name = "bob";
console.log(sql`SELECT * FROM users WHERE id = ${id} AND name = ${name}`);
