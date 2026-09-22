interface Ticket {
  level: number;
  message: string;
}

abstract class SupportHandler {
  protected next: SupportHandler | null = null;

  setNext(handler: SupportHandler): SupportHandler {
    this.next = handler;
    return handler;
  }

  handle(ticket: Ticket): string {
    if (this.next) {
      return this.next.handle(ticket);
    }
    return `unresolved: ${ticket.message}`;
  }
}

class LevelHandler extends SupportHandler {
  constructor(private name: string, private levelHandled: number) {
    super();
  }

  handle(ticket: Ticket): string {
    if (ticket.level <= this.levelHandled) {
      return `${this.name} resolved: ${ticket.message}`;
    }
    return super.handle(ticket);
  }
}

const tier1 = new LevelHandler('Tier1', 1);
const tier2 = new LevelHandler('Tier2', 2);
const tier3 = new LevelHandler('Tier3', 3);
tier1.setNext(tier2).setNext(tier3);

const tickets: Ticket[] = [
  { level: 1, message: 'password reset' },
  { level: 3, message: 'server outage' },
  { level: 5, message: 'unknown issue' },
];

for (const ticket of tickets) {
  console.log(tier1.handle(ticket));
}
