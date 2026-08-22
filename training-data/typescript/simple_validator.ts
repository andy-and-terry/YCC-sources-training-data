type Rule = (value: unknown) => boolean;
type Schema = Record<string, Rule[]>;

class ValidationError extends Error {
  constructor(public errors: Record<string, string[]>) {
    super(JSON.stringify(errors));
  }
}

const required: Rule = (value) => value !== undefined && value !== null && value !== '';
const isEmail: Rule = (value) => typeof value === 'string' && /^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(value);
const minLength = (n: number): Rule => (value) => typeof value === 'string' && value.length >= n;

function validate(data: Record<string, unknown>, schema: Schema): void {
  const errors: Record<string, string[]> = {};
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
