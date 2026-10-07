function deepClone<T>(value: T): T {
  if (value === null || typeof value !== 'object') {
    return value;
  }
  if (Array.isArray(value)) {
    return value.map((item) => deepClone(item)) as unknown as T;
  }
  const result = {} as { [K in keyof T]: T[K] };
  for (const key of Object.keys(value as object) as (keyof T)[]) {
    result[key] = deepClone((value as T)[key]);
  }
  return result;
}

interface Address {
  city: string;
  zip: string;
}

interface Profile {
  name: string;
  tags: string[];
  address: Address;
}

const original: Profile = {
  name: 'Ada',
  tags: ['engineer', 'mathematician'],
  address: { city: 'London', zip: 'SW1' },
};

const clone = deepClone(original);
clone.address.city = 'Paris';
clone.tags.push('author');

console.log(original.address.city, clone.address.city);
console.log(original.tags, clone.tags);
