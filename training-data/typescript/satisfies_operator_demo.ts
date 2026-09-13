type Color = "red" | "green" | "blue";

const palette = {
  primary: "red",
  secondary: "green",
  accent: "blue",
} satisfies Record<string, Color>;

console.log(palette.primary.toUpperCase());

interface RouteConfig {
  path: string;
  method: "GET" | "POST";
}

const routes = {
  home: { path: "/", method: "GET" },
  submit: { path: "/submit", method: "POST" },
} satisfies Record<string, RouteConfig>;

console.log(routes.submit.method, routes.home.path);
