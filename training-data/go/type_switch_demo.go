package main

import (
	"fmt"
	"time"
)

func describe(v any) string {
	switch x := v.(type) {
	case nil:
		return "nil"
	case int, int64:
		return fmt.Sprintf("integer %v", x)
	case string:
		return fmt.Sprintf("string of length %d", len(x))
	case []int:
		return fmt.Sprintf("int slice with %d items", len(x))
	case error:
		return "error: " + x.Error()
	case fmt.Stringer:
		return "stringer: " + x.String()
	default:
		return fmt.Sprintf("unknown type %T", x)
	}
}

func main() {
	values := []any{nil, 42, "hello", []int{1, 2}, fmt.Errorf("boom"), time.Second, 3.14}
	for _, v := range values {
		fmt.Println(describe(v))
	}
}
