// Tagged template literal that escapes interpolated values.
const escapeHtml = (s) =>
  String(s).replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c]));

function safe(strings, ...values) {
  return strings.reduce((out, str, i) => out + str + (i < values.length ? escapeHtml(values[i]) : ""), "");
}

const name = '<script>alert("x")</script>';
console.log(safe`<p>Hello, ${name}!</p>`);
