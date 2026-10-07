function rob(houses) {
  let take = 0, skip = 0;
  for (const h of houses) [take, skip] = [skip + h, Math.max(take, skip)];
  return Math.max(take, skip);
}

const robCircular = (h) => (h.length === 1 ? h[0] : Math.max(rob(h.slice(1)), rob(h.slice(0, -1))));

console.log(rob([2, 7, 9, 3, 1]), robCircular([2, 3, 2]), robCircular([1, 2, 3, 1]));
module.exports = { rob, robCircular };
