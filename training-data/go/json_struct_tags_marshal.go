package main

import (
	"encoding/json"
	"fmt"
)

type User struct {
	ID    int      `json:"id"`
	Name  string   `json:"name"`
	Email string   `json:"email,omitempty"`
	Tags  []string `json:"tags"`
	pass  string
}

func main() {
	b, _ := json.Marshal(User{ID: 1, Name: "Ada", pass: "x"})
	fmt.Println(string(b))
	var u User
	_ = json.Unmarshal([]byte(`{"id":2,"name":"Lin","tags":["a"]}`), &u)
	fmt.Printf("%+v\n", u)
}
