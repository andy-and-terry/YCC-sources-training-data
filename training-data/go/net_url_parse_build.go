package main

import (
	"fmt"
	"net/url"
)

func main() {
	u, err := url.Parse("https://user:pw@example.com:8080/a%20b/c?q=go+lang&x=1&x=2#frag")
	if err != nil {
		panic(err)
	}
	fmt.Println(u.Scheme, u.Hostname(), u.Port(), u.Path, u.Fragment, u.User.Username())
	q := u.Query()
	fmt.Println(q.Get("q"), q["x"])
	q.Set("page", "2")
	q.Del("x")
	u.RawQuery = q.Encode()
	fmt.Println(u.String())
	fmt.Println(url.QueryEscape("a b/c"), url.PathEscape("a b/c"))
}
