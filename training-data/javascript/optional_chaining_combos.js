const users = [
  { name: 'Ann', profile: { social: { twitter: '@ann' }, greet: (msg) => `${msg}, Ann` } },
  { name: 'Bo', profile: null },
  { name: 'Cy' },
];

function getTwitter(user) {
  return user?.profile?.social?.twitter ?? 'no handle';
}

function greet(user, msg) {
  return user?.profile?.greet?.(msg) ?? `${msg}, stranger`;
}

function firstTag(user) {
  return user?.profile?.tags?.[0] ?? 'untagged';
}

console.log(users.map(getTwitter));
console.log(users.map((u) => greet(u, 'Hi')));
console.log(users.map(firstTag));

const config = { handlers: { onSave: null } };
console.log(config?.handlers?.onSave?.() ?? 'no-op');
console.log(config?.handlers?.onLoad?.() ?? 'no-op');

module.exports = { getTwitter, greet, firstTag };
