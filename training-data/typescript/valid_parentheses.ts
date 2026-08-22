function isValid(s: string): boolean {
  const pairs: Record<string, string> = { ')': '(', ']': '[', '}': '{' };
  const stack: string[] = [];
  for (const ch of s) {
    if ('([{'.includes(ch)) {
      stack.push(ch);
    } else if (')]}'.includes(ch)) {
      if (stack.pop() !== pairs[ch]) return false;
    }
  }
  return stack.length === 0;
}

console.log(isValid('([{}])'));
console.log(isValid('([)]'));
