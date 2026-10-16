package main

import (
	"encoding/json"
	"fmt"
)

func describe(v any, indent string) {
	switch x := v.(type) {
	case map[string]any:
		for k, val := range x {
			fmt.Printf("%s%s:\n", indent, k)
			describe(val, indent+"  ")
		}
	case []any:
		for i, val := range x {
			fmt.Printf("%s[%d]\n", indent, i)
			describe(val, indent+"  ")
		}
	case float64:
		fmt.Printf("%snumber %v\n", indent, x)
	case string:
		fmt.Printf("%sstring %q\n", indent, x)
	case bool:
		fmt.Printf("%sbool %v\n", indent, x)
	case nil:
		fmt.Printf("%snull\n", indent)
	}
}

func main() {
	raw := `{"id": 7, "ok": true, "items": ["x", 2, null]}`
	var v any
	if err := json.Unmarshal([]byte(raw), &v); err != nil {
		panic(err)
	}
	describe(v, "")
}
