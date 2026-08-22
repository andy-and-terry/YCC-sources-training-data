function wordLadderLength(beginWord, endWord, wordList) {
  const words = new Set(wordList);
  if (!words.has(endWord)) return 0;

  const queue = [[beginWord, 1]];
  const visited = new Set([beginWord]);
  const alphabet = 'abcdefghijklmnopqrstuvwxyz';

  while (queue.length > 0) {
    const [word, length] = queue.shift();
    if (word === endWord) return length;
    for (let i = 0; i < word.length; i++) {
      for (const ch of alphabet) {
        const candidate = word.slice(0, i) + ch + word.slice(i + 1);
        if (words.has(candidate) && !visited.has(candidate)) {
          visited.add(candidate);
          queue.push([candidate, length + 1]);
        }
      }
    }
  }
  return 0;
}

console.log(wordLadderLength('hit', 'cog', ['hot', 'dot', 'dog', 'lot', 'log', 'cog']));
module.exports = { wordLadderLength };
