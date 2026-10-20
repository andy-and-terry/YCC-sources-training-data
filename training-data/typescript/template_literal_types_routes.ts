// Template literal types constrain strings to a pattern.
type Method = "GET" | "POST";
type Route = `/${"users" | "posts"}/${number}`;
type Endpoint = `${Method} ${Route}`;

function call(endpoint: Endpoint): string {
  return `calling ${endpoint}`;
}

console.log(call("GET /users/42"));
console.log(call("POST /posts/7"));
// call("PUT /users/1"); // error: not assignable
