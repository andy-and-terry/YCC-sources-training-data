class Handler {
  constructor() {
    this.next = null;
  }

  setNext(handler) {
    this.next = handler;
    return handler;
  }

  handle(request) {
    if (this.next) return this.next.handle(request);
    return null;
  }
}

class InfoHandler extends Handler {
  handle(request) {
    if (request.level === 'info') return `info: ${request.message}`;
    return super.handle(request);
  }
}

class WarningHandler extends Handler {
  handle(request) {
    if (request.level === 'warning') return `warning: ${request.message}`;
    return super.handle(request);
  }
}

class ErrorHandler extends Handler {
  handle(request) {
    if (request.level === 'error') return `error: ${request.message}`;
    return super.handle(request);
  }
}

const info = new InfoHandler();
const warning = new WarningHandler();
const error = new ErrorHandler();
info.setNext(warning).setNext(error);

console.log(info.handle({ level: 'warning', message: 'disk almost full' }));
console.log(info.handle({ level: 'error', message: 'disk full' }));
console.log(info.handle({ level: 'info', message: 'backup complete' }));
module.exports = { Handler, InfoHandler, WarningHandler, ErrorHandler };
