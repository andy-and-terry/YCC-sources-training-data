// Maximum nesting depth of parentheses; -1 if the string is unbalanced.
import 'dart:math';

int maxDepth(String s) {
  var depth = 0, best = 0;
  for (final ch in s.split('')) {
    if (ch == '(') {
      best = max(best, ++depth);
    } else if (ch == ')' && --depth < 0) {
      return -1;
    }
  }
  return depth == 0 ? best : -1;
}

void main() => print('${maxDepth('(1+(2*(3)))')} ${maxDepth('(()')}');
