interface Address {
  city?: string;
  zip?: string;
}
interface Profile {
  name: string;
  address?: Address;
  nickname?: string | null;
  scores?: number[];
}

function summarize(p: Profile): string {
  const city = p.address?.city ?? "unknown city";
  const nick = p.nickname ?? p.name;
  const first = p.scores?.[0] ?? 0;
  return `${nick} from ${city}, first score ${first}`;
}

let counter: number | undefined;
counter ??= 10;
counter ||= 5;

console.log(summarize({ name: "Ada", address: { city: "London" }, scores: [9] }));
console.log(summarize({ name: "Bob", nickname: null }));
console.log(counter);
const zero: number = Number("0");
console.log(zero ?? 42, zero || 42);
