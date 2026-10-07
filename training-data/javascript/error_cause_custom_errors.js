class AppError extends Error {
  constructor(message, options = {}) {
    super(message, { cause: options.cause });
    this.name = this.constructor.name;
    this.code = options.code ?? 'E_APP';
  }
}

class NotFoundError extends AppError {
  constructor(resource, options) {
    super(`${resource} not found`, { code: 'E_NOT_FOUND', ...options });
    this.resource = resource;
  }
}

function readConfig() {
  try {
    JSON.parse('{ bad json');
  } catch (err) {
    throw new AppError('could not load config', { cause: err, code: 'E_CONFIG' });
  }
}

try {
  readConfig();
} catch (e) {
  console.log(e.name, e.code, '-', e.message);
  console.log('cause:', e.cause.name);
  console.log(e instanceof AppError, e instanceof Error);
}

try {
  throw new NotFoundError('user');
} catch (e) {
  console.log(e instanceof NotFoundError, e instanceof AppError, e.resource, e.code);
  console.log(String(e));
}

const agg = new AggregateError([new Error('a'), new TypeError('b')], 'multiple failures');
console.log(agg.errors.length, agg.message);
