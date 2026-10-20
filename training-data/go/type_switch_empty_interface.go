package main

import "fmt"

func describe(v any) string {
	switch x := v.(type) {
	case nil:
		return "nil"
	case int, int64:
		return fmt.Sprintf("integer %v", x)
	case string:
		return "string of len " + fmt.Sprint(len(x))
	case []int:
		return fmt.Sprintf("slice len %d", len(x))
	case error:
		return "error " + x.Error()
	default:
		return fmt.Sprintf("other %T", x)
	}
}

func main() {
	for _, v := range []any{nil, 3, "abc", []int{1}, fmt.Errorf("e"), 2.5} {
		fmt.Println(describe(v))
	}
}
