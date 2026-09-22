function escapeHtml(value: unknown): string {
  return String(value)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");
}

function html(strings: TemplateStringsArray, ...values: unknown[]): string {
  return strings.reduce((result, str, i) => {
    const value = i < values.length ? escapeHtml(values[i]) : "";
    return result + str + value;
  }, "");
}

const userInput = "<script>alert('xss')</script>";
const page = html`<div>Hello, ${userInput}!</div>`;
console.log(page);

type SqlParam = string | number;

function sql(strings: TemplateStringsArray, ...params: SqlParam[]): { text: string; values: SqlParam[] } {
  const text = strings.reduce((acc, str, i) => acc + str + (i < params.length ? `$${i + 1}` : ""), "");
  return { text, values: params };
}

const userId = 42;
const accountStatus = "active";
const query = sql`SELECT * FROM users WHERE id = ${userId} AND status = ${accountStatus}`;
console.log(query.text, query.values);
