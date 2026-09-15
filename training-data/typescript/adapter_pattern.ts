interface ModernLogger {
  log(message: string): void;
}

class LegacyLogger {
  writeLine(text: string): void {
    console.log(`[legacy] ${text}`);
  }
}

class LegacyLoggerAdapter implements ModernLogger {
  constructor(private legacy: LegacyLogger) {}

  log(message: string): void {
    this.legacy.writeLine(message);
  }
}

class ConsoleLogger implements ModernLogger {
  log(message: string): void {
    console.log(`[console] ${message}`);
  }
}

function runDiagnostics(logger: ModernLogger): void {
  logger.log('diagnostics started');
  logger.log('diagnostics complete');
}

runDiagnostics(new ConsoleLogger());
runDiagnostics(new LegacyLoggerAdapter(new LegacyLogger()));
