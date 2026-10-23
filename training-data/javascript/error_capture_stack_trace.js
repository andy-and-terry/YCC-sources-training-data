// Custom errors that keep a clean stack trace. Error.captureStackTrace
// (V8/Node) omits the constructor frame so the trace starts at the caller.
class ValidationError extends Error {
  constructor(field, message) {
    super(message);
    this.name = "ValidationError";
    this.field = field;
    if (Error.captureStackTrace) {
      Error.captureStackTrace(this, ValidationError);
    }
  }

  toJSON() {
    return { name: this.name, field: this.field, message: this.message };
  }
}

function validateAge(age) {
  if (!Number.isInteger(age) || age < 0) {
    throw new ValidationError("age", `invalid age: ${age}`);
  }
  return age;
}

try {
  validateAge(-5);
} catch (err) {
  console.log(err instanceof ValidationError, err instanceof Error);
  console.log(String(err));
  console.log(JSON.stringify(err));
  const firstFrame = err.stack.split("\n")[1].trim();
  console.log("first frame mentions validateAge:", firstFrame.includes("validateAge"));
}

// captureStackTrace can also add a stack to a plain object.
const target = { label: "plain" };
Error.captureStackTrace(target);
console.log(typeof target.stack);
