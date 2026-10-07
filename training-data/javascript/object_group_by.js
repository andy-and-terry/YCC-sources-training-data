const orders = [
  { id: 1, status: 'shipped', total: 20 },
  { id: 2, status: 'pending', total: 15 },
  { id: 3, status: 'shipped', total: 40 },
  { id: 4, status: 'cancelled', total: 5 },
  { id: 5, status: 'pending', total: 30 },
];

const byStatus = Object.groupBy(orders, (order) => order.status);
console.log(byStatus.shipped.map((o) => o.id));
console.log(byStatus.pending.map((o) => o.id));

const byParity = Map.groupBy([1, 2, 3, 4, 5, 6], (n) => (n % 2 === 0 ? 'even' : 'odd'));
console.log([...byParity.get('even')]);
console.log([...byParity.get('odd')]);

const totalsByStatus = Object.fromEntries(
  Object.entries(byStatus).map(([status, group]) => [status, group.reduce((sum, o) => sum + o.total, 0)])
);
console.log(totalsByStatus);

module.exports = { byStatus, byParity, totalsByStatus };
