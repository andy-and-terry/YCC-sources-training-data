const FILTERS = {
  upper: (s) => s.toUpperCase(),
  lower: (s) => s.toLowerCase(),
  title: (s) => s.replace(/\b\w/g, (c) => c.toUpperCase()),
};

const lookup = (ctx, path) => path.split(".").reduce((obj, key) => obj?.[key], ctx);

function render(template, ctx) {
  return template.replace(/\{\{\s*([\w.]+)\s*(?:\|\s*(\w+))?\s*\}\}/g, (_, path, filter) => {
    const value = String(lookup(ctx, path) ?? "");
    return filter ? FILTERS[filter](value) : value;
  });
}

const tpl = "Hello {{ user.name | title }}, you have {{count}} new {{ kind|upper }}.";
console.log(render(tpl, { user: { name: "ada lovelace" }, count: 3, kind: "messages" }));
module.exports = { render };
