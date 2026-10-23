function html(strings, ...values) {
  const esc = (s) => String(s).replace(/[&<>"]/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' })[c]);
  return strings.reduce((out, str, i) => out + str + (i < values.length ? esc(values[i]) : ''), '');
}

const user = '<script>alert("x")</script>';
console.log(html`<p>Hello, ${user}!</p>`);
