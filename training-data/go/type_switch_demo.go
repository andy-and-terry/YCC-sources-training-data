package main

import (
	"fmt"
	"time"
)

func describe(v interface{}) string {
	switch x := v.(type) {
	case nil:
		return "nil value"
	case int, int64:
		return fmt.Sprintf("integer %v", x)
	case float64:
		return fmt.Sprintf("float %.2f", x)
	case string:
		return fmt.Sprintf("string of length %d", len(x))
	case []int:
		return fmt.Sprintf("int slice with %d items", len(x))
	case error:
		return "error: " + x.Error()
	case fmt.Stringer:
		return "stringer: " + x.String()
	case func() int:
		return fmt.Sprintf("func returning %d", x())
	default:
		return fmt.Sprintf("unknown type %T", x)
	}
}

func main() {
	values := []interface{}{
		nil, 42, int64(7), 3.14159, "hello", []int{1, 2, 3},
		fmt.Errorf("boom"), 2 * time.Second, func() int { return 9 }, struct{}{},
	}
	for _, v := range values {
		fmt.Println(describe(v))
	}
}
