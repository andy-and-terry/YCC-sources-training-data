abstract class SupportHandler {
  private next: SupportHandler | null = null;

  setNext(handler: SupportHandler): SupportHandler {
    this.next = handler;
    return handler;
  }

  handle(ticketLevel: number, message: string): string {
    if (this.canHandle(ticketLevel)) {
      return this.resolve(message);
    }
    if (this.next) {
      return this.next.handle(ticketLevel, message);
    }
    return `Unhandled: ${message}`;
  }

  protected abstract canHandle(level: number): boolean;
  protected abstract resolve(message: string): string;
}

class Level1Support extends SupportHandler {
  protected canHandle(level: number): boolean {
    return level <= 1;
  }
  protected resolve(message: string): string {
    return `Level1 resolved: ${message}`;
  }
}

class Level2Support extends SupportHandler {
  protected canHandle(level: number): boolean {
    return level <= 2;
  }
  protected resolve(message: string): string {
    return `Level2 resolved: ${message}`;
  }
}

class Level3Support extends SupportHandler {
  protected canHandle(level: number): boolean {
    return level <= 3;
  }
  protected resolve(message: string): string {
    return `Level3 resolved: ${message}`;
  }
}

const level1 = new Level1Support();
const level2 = new Level2Support();
const level3 = new Level3Support();
level1.setNext(level2).setNext(level3);

console.log(level1.handle(1, "password reset"));
console.log(level1.handle(2, "network outage"));
console.log(level1.handle(5, "data breach"));
