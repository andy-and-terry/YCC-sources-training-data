const esc = (s) => String(s).replace(/[&<>"']/g, (c) => `&#${c.charCodeAt(0)};`);
function html(strings, ...vals) {
  return strings.reduce((acc, s, i) => acc + s + (i < vals.length ? esc(vals[i]) : ""), "");
}
console.log(html`<p>${"<script>"} & ${"ok"}</p>`);
