function html(strings, ...vals) {
  const esc = (s) => String(s).replace(/[&<>"]/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[c]));
  return strings.reduce((out, s, i) => out + s + (i < vals.length ? esc(vals[i]) : ""), "");
}
console.log(html`<p>${"<script>"} & ${"ok"}</p>`);
