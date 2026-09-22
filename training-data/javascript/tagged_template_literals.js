function html(strings, ...values) {
  const escape = (value) =>
    String(value)
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;');

  return strings.reduce((result, str, i) => {
    const value = i < values.length ? escape(values[i]) : '';
    return result + str + value;
  }, '');
}

const user = { name: '<script>alert(1)</script>', age: 30 };
const page = html`<p>Name: ${user.name}, Age: ${user.age}</p>`;
console.log(page);

module.exports = { html };
