package main

import (
	"fmt"
	"net/url"
	"sort"
	"strings"
)

// parseQuery is a small manual implementation; results are compared with net/url.
func parseQuery(qs string) (map[string][]string, error) {
	out := map[string][]string{}
	for _, pair := range strings.Split(strings.TrimPrefix(qs, "?"), "&") {
		if pair == "" {
			continue
		}
		k, v, _ := strings.Cut(pair, "=")
		key, err := url.QueryUnescape(k)
		if err != nil {
			return nil, err
		}
		val, err := url.QueryUnescape(v)
		if err != nil {
			return nil, err
		}
		out[key] = append(out[key], val)
	}
	return out, nil
}

func main() {
	qs := "?name=J%C3%BCrgen+M&tag=a&tag=b&empty="
	mine, _ := parseQuery(qs)
	std, _ := url.ParseQuery(strings.TrimPrefix(qs, "?"))
	keys := make([]string, 0, len(mine))
	for k := range mine {
		keys = append(keys, k)
	}
	sort.Strings(keys)
	for _, k := range keys {
		fmt.Printf("%-5s %q (stdlib %q)\n", k, mine[k], std[k])
	}
	fmt.Println(url.Values(mine).Encode())
	_, err := parseQuery("bad=%zz")
	fmt.Println("error:", err)
}
