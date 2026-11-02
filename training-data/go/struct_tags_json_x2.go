package main

import (
	"encoding/json"
	"fmt"
)

type User struct {
	Name  string `json:"name"`
	Email string `json:"email,omitempty"`
	Age   int    `json:"-"`
}

func main() {
	b, _ := json.Marshal(User{Name: "ann", Age: 3})
	fmt.Println(string(b))
}
