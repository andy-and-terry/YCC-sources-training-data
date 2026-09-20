interface SupportRequest {
  level: "basic" | "technical" | "critical";
  message: string;
}

abstract class SupportHandler {
  private next: SupportHandler | null = null;

  setNext(handler: SupportHandler): SupportHandler {
    this.next = handler;
    return handler;
  }

  handle(request: SupportRequest): void {
    if (this.canHandle(request)) {
      console.log(`${this.constructor.name} handled: ${request.message}`);
      return;
    }
    if (this.next) {
      this.next.handle(request);
    } else {
      console.log(`No handler available for: ${request.message}`);
    }
  }

  protected abstract canHandle(request: SupportRequest): boolean;
}

class BasicSupport extends SupportHandler {
  protected canHandle(request: SupportRequest): boolean {
    return request.level === "basic";
  }
}

class TechnicalSupport extends SupportHandler {
  protected canHandle(request: SupportRequest): boolean {
    return request.level === "technical";
  }
}

class CriticalSupport extends SupportHandler {
  protected canHandle(request: SupportRequest): boolean {
    return request.level === "critical";
  }
}

const basic = new BasicSupport();
const technical = new TechnicalSupport();
const critical = new CriticalSupport();
basic.setNext(technical).setNext(critical);

basic.handle({ level: "technical", message: "VPN not connecting" });
basic.handle({ level: "critical", message: "production database is down" });
basic.handle({ level: "basic", message: "how do I reset my password?" });
