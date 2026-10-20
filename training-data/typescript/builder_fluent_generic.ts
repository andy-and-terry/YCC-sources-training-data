class QueryBuilder {
  private parts: string[] = [];
  private wheres: string[] = [];
  from(t: string) { this.parts.push(`FROM ${t}`); return this; }
  where(c: string) { this.wheres.push(c); return this; }
  build() { return `SELECT * ${this.parts.join(" ")}${this.wheres.length ? " WHERE " + this.wheres.join(" AND ") : ""}`; }
}
console.log(new QueryBuilder().from("users").where("age > 18").where("active").build());
