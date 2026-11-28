package main

import (
	"encoding/json"
	"fmt"
)

type Item struct {
	ID    int    `json:"id"`
	Name  string `json:"name"`
	Notes string `json:"notes,omitempty"`
	secret string
}

func main() {
	b, _ := json.Marshal(Item{ID: 1, Name: "pen", secret: "x"})
	fmt.Println(string(b))
	var it Item
	_ = json.Unmarshal([]byte(`{"id":2,"name":"cup","notes":"blue"}`), &it)
	fmt.Printf("%+v\n", it)
}
