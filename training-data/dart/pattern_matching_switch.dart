String httpStatusCategory(int code) {
  return switch (code) {
    >= 200 && < 300 => 'success',
    >= 300 && < 400 => 'redirect',
    >= 400 && < 500 => 'client error',
    >= 500 && < 600 => 'server error',
    _ => 'unknown',
  };
}

void main() {
  for (final code in [200, 301, 404, 503, 999]) {
    print('$code: ${httpStatusCategory(code)}');
  }
}
