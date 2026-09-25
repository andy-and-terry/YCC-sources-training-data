package main

import (
	"fmt"
	"net/url"
)

func describe(raw string) {
	u, err := url.Parse(raw)
	if err != nil {
		fmt.Println("error:", err)
		return
	}
	port := u.Port()
	if port == "" {
		port = map[string]string{"http": "80", "https": "443"}[u.Scheme]
	}
	pw, _ := u.User.Password()
	fmt.Printf("scheme=%s user=%s pass=%s host=%s port=%s path=%q fragment=%q\n",
		u.Scheme, u.User.Username(), pw, u.Hostname(), port, u.Path, u.Fragment)
	for k, vs := range u.Query() {
		fmt.Printf("  query %s = %v\n", k, vs)
	}
	base, _ := url.Parse("https://example.com/docs/guide/")
	fmt.Println("  resolved '../api?v=2':", base.ResolveReference(&url.URL{Path: "../api", RawQuery: "v=2"}))
}

func main() {
	describe("https://user:pw@example.com:8443/a/b?x=1&y=hello%20world#top")
	describe("http://localhost")
	describe("http://[::1]:namedport")
}
