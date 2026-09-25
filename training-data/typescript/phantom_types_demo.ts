declare const validatedTag: unique symbol;
declare const sanitizedTag: unique symbol;

type Validated<T> = T & { readonly [validatedTag]: true };
type Sanitized<T> = T & { readonly [sanitizedTag]: true };

function validateEmail(input: string): Validated<string> {
  if (!input.includes("@")) throw new Error(`invalid email: ${input}`);
  return input as Validated<string>;
}

function sanitizeHtml(input: string): Sanitized<string> {
  return input.replace(/[<>]/g, "") as Sanitized<string>;
}

function sendWelcomeEmail(email: Validated<string>): void {
  console.log(`sending welcome email to ${email}`);
}

function renderComment(html: Sanitized<string>): string {
  return `<p>${html}</p>`;
}

const email = validateEmail("ada@example.com");
sendWelcomeEmail(email);
// sendWelcomeEmail("plain@example.com"); // compile-time error: plain string isn't Validated<string>

const comment = sanitizeHtml("<b>hi</b>");
console.log(renderComment(comment));
// renderComment(email); // compile-time error: Validated and Sanitized tags don't match
