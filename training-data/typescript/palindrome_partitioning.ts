function partition(s: string): string[][] {
  const result: string[][] = [];
  const isPalindrome = (sub: string): boolean => sub === [...sub].reverse().join('');

  function backtrack(start: number, path: string[]): void {
    if (start === s.length) {
      result.push([...path]);
      return;
    }
    for (let end = start + 1; end <= s.length; end++) {
      const sub = s.slice(start, end);
      if (isPalindrome(sub)) {
        path.push(sub);
        backtrack(end, path);
        path.pop();
      }
    }
  }

  backtrack(0, []);
  return result;
}

console.log(partition('aab'));
