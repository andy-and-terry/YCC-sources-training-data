class HttpError extends Error {
  constructor(status, message, options) {
    super(message, options);
    this.name = "HttpError";
    this.status = status;
  }
}
try { throw new HttpError(404, "Not found", { cause: new Error("db miss") }); }
catch (e) { console.log(e.name, e.status, e.cause.message, e instanceof Error); }
