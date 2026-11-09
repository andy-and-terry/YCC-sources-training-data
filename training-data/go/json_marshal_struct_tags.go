package main

import (
	"encoding/json"
	"fmt"
)

type P struct {
	Name string `json:"name"`
	Age  int    `json:"age,omitempty"`
	Pass string `json:"-"`
}

func main() {
	b, _ := json.Marshal(P{"ann", 0, "secret"})
	fmt.Println(string(b))
	var p P
	_ = json.Unmarshal([]byte(`{"name":"bob","age":5}`), &p)
	fmt.Println(p)
}
