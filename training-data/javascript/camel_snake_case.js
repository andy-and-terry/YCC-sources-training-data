const snakeToCamel = (s, upperFirst = false) =>
  s
    .toLowerCase()
    .split("_")
    .map((p, i) => (i === 0 && !upperFirst ? p : p.charAt(0).toUpperCase() + p.slice(1)))
    .join("");

const camelToSnake = (s) =>
  s
    .replace(/([A-Z]+)([A-Z][a-z])/g, "$1_$2")
    .replace(/([a-z0-9])([A-Z])/g, "$1_$2")
    .toLowerCase();

const toKebab = (s) => camelToSnake(s).replace(/_/g, "-");

console.log(snakeToCamel("parse_http_response"), snakeToCamel("user_id", true));
console.log(camelToSnake("parseHTTPResponse"), camelToSnake("XMLHttpRequest"));
console.log(toKebab("backgroundColor"));
module.exports = { snakeToCamel, camelToSnake, toKebab };
