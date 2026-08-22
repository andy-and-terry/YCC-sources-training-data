class ValidationError extends Error {
  constructor(errors) {
    super(JSON.stringify(errors));
    this.errors = errors;
  }
}

const required = (value) => value !== undefined && value !== null && value !== '';
const isEmail = (value) => /^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(value || '');
const minLength = (n) => (value) => (value || '').length >= n;

function validate(data, schema) {
  const errors = {};
  for (const [field, rules] of Object.entries(schema)) {
    for (const rule of rules) {
      if (!rule(data[field])) {
        errors[field] = errors[field] || [];
        errors[field].push(rule.name || 'invalid');
      }
    }
  }
  if (Object.keys(errors).length > 0) throw new ValidationError(errors);
}

try {
  validate(
    { email: 'not-an-email', password: 'short' },
    { email: [required, isEmail], password: [required, minLength(8)] }
  );
} catch (e) {
  if (e instanceof ValidationError) console.log(e.errors);
}

module.exports = { validate, ValidationError, required, isEmail, minLength };
