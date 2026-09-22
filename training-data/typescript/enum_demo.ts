enum Direction {
  Up,
  Down,
  Left,
  Right,
}

enum HttpStatus {
  OK = 200,
  NotFound = 404,
  ServerError = 500,
}

const enum Level {
  Low = 'LOW',
  Medium = 'MEDIUM',
  High = 'HIGH',
}

function describeDirection(direction: Direction): string {
  switch (direction) {
    case Direction.Up:
      return 'moving up';
    case Direction.Down:
      return 'moving down';
    case Direction.Left:
      return 'moving left';
    case Direction.Right:
      return 'moving right';
  }
}

console.log(describeDirection(Direction.Left));
console.log(Direction[Direction.Up]); // reverse mapping for numeric enums
console.log(HttpStatus.NotFound);
console.log(Level.High);

function isServerError(status: HttpStatus): boolean {
  return status >= HttpStatus.ServerError;
}

console.log(isServerError(HttpStatus.ServerError));
console.log(isServerError(HttpStatus.OK));
