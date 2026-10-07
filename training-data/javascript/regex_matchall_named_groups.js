const log = `
2024-03-01 ERROR db: connection lost
2024-03-01 INFO  api: started
2024-03-02 ERROR api: timeout after 30s
`;

const re = /^(?<date>\d{4}-\d{2}-\d{2}) (?<level>[A-Z]+)\s+(?<module>\w+): (?<msg>.+)$/gm;

const entries = [...log.matchAll(re)].map((m) => ({ ...m.groups }));
console.log(entries);

const errors = entries.filter((e) => e.level === 'ERROR');
console.log(errors.map((e) => `${e.module}: ${e.msg}`));

const swapped = '2024-03-01'.replace(
  /(?<y>\d+)-(?<m>\d+)-(?<d>\d+)/,
  '$<d>/$<m>/$<y>'
);
console.log(swapped);

const camelToSnake = 'parseHttpResponseCode'.replace(/[A-Z]/g, (c) => '_' + c.toLowerCase());
console.log(camelToSnake);

console.log('a1b22c333'.split(/(\d+)/));
console.log(/(?<=\$)\d+(\.\d\d)?/.exec('cost: $42.50')[0]);
