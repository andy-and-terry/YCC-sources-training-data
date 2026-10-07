interface HttpRequestSpec {
  url: string;
  method: string;
  body: unknown;
}

type RequiredKeys = "url" | "method";

class RequestBuilder<Built extends keyof HttpRequestSpec = never> {
  private spec: Partial<HttpRequestSpec> = {};

  url(value: string): RequestBuilder<Built | "url"> {
    this.spec.url = value;
    return this as RequestBuilder<Built | "url">;
  }

  method(value: string): RequestBuilder<Built | "method"> {
    this.spec.method = value;
    return this as RequestBuilder<Built | "method">;
  }

  body(value: unknown): RequestBuilder<Built | "body"> {
    this.spec.body = value;
    return this as RequestBuilder<Built | "body">;
  }

  build(this: RequestBuilder<RequiredKeys>): HttpRequestSpec {
    return { body: undefined, ...this.spec } as HttpRequestSpec;
  }
}

const request = new RequestBuilder().url("/users").method("POST").body({ name: "Ada" }).build();
console.log(request);

const minimal = new RequestBuilder().method("GET").url("/health").build();
console.log(minimal);

// new RequestBuilder().url("/users").build(); // compile-time error: "method" not built yet
