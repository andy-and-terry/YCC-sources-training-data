package main

import "fmt"

func kind(v any) string {
	switch x := v.(type) {
	case nil:
		return "nil"
	case int, int64:
		return fmt.Sprintf("integer %v", x)
	case string:
		return "string of len " + fmt.Sprint(len(x))
	case []any:
		return fmt.Sprintf("slice of %d", len(x))
	case error:
		return "error " + x.Error()
	default:
		return fmt.Sprintf("other %T", x)
	}
}

func main() {
	for _, v := range []any{nil, 3, "go", []any{1, 2}, fmt.Errorf("x"), 2.5} {
		fmt.Println(kind(v))
	}
}
