type DeepReadonly<T> = T extends (infer U)[]
  ? ReadonlyArray<DeepReadonly<U>>
  : T extends object
  ? { readonly [K in keyof T]: DeepReadonly<T[K]> }
  : T;

type DeepPartial<T> = T extends (infer U)[]
  ? DeepPartial<U>[]
  : T extends object
  ? { [K in keyof T]?: DeepPartial<T[K]> }
  : T;

interface Address {
  city: string;
  zip: string;
}

interface Profile {
  name: string;
  addresses: Address[];
  meta: { verified: boolean };
}

type FrozenProfile = DeepReadonly<Profile>;
type DraftProfile = DeepPartial<Profile>;

const frozen: FrozenProfile = {
  name: "Ada",
  addresses: [{ city: "London", zip: "E1" }],
  meta: { verified: true },
};
// frozen.addresses[0].city = "Paris"; // compile-time error: readonly all the way down

const draft: DraftProfile = { meta: { verified: false } };

function mergeDraft(base: Profile, patch: DeepPartial<Profile>): Profile {
  return {
    name: patch.name ?? base.name,
    addresses: (patch.addresses as Address[] | undefined) ?? base.addresses,
    meta: { ...base.meta, ...patch.meta },
  };
}

console.log(frozen);
console.log(mergeDraft({ name: "Grace", addresses: [], meta: { verified: false } }, draft));
