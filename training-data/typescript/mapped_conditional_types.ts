type Nullable<T> = { [K in keyof T]: T[K] | null };

type NonFunctionKeys<T> = {
  [K in keyof T]: T[K] extends (...args: unknown[]) => unknown ? never : K;
}[keyof T];

type DataOnly<T> = Pick<T, NonFunctionKeys<T>>;

interface Model {
  id: number;
  name: string;
  save(): void;
  validate(): boolean;
}

type NullableModel = Nullable<Model>;
type ModelData = DataOnly<Model>;

const data: ModelData = { id: 1, name: 'example' };
const nullable: NullableModel = { id: null, name: 'x', save: () => {}, validate: () => true };
console.log(data, nullable.id);
