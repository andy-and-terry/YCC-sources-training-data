// ES2022's Error.cause links a new error to the lower-level one that
// triggered it, so callers can walk the chain instead of losing context
// behind a generic wrapper message.
function readConfig() {
  try {
    JSON.parse('{ invalid json');
  } catch (err) {
    throw new Error('failed to read config', { cause: err });
  }
}

try {
  readConfig();
} catch (err) {
  console.log('top-level error:', err.message);
  console.log('caused by:', err.cause.message);
}

module.exports = { readConfig };
