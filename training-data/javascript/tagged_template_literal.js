function html(strings, ...vals) {
  return strings.reduce((out, s, i) => out + s + (vals[i] !== undefined ? String(vals[i]).replace(/</g, '&lt;') : ''), '');
}
console.log(html`<p>${'<b>x</b>'} and ${42}</p>`);
