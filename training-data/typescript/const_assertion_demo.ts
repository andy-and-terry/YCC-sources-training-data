const rawConfig = {
  mode: "production",
  retries: 3,
  tags: ["stable", "verified"],
};

const config = {
  mode: "production",
  retries: 3,
  tags: ["stable", "verified"],
} as const;

// config.retries = 4; // would be a compile-time error: readonly property
type Mode = (typeof config)["mode"]; // "production", not string

const directions = ["north", "south", "east", "west"] as const;
type Direction = (typeof directions)[number];

function move(direction: Direction): string {
  return `moving ${direction}`;
}

const mode: Mode = "production";
console.log(mode, move("north"), rawConfig.mode);
