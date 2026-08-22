function partition(s) {
  const result = [];
  const isPalindrome = (sub) => sub === [...sub].reverse().join('');

  function backtrack(start, path) {
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
module.exports = { partition };
