package main

import (
	"encoding/json"
	"fmt"
)

type Profile struct {
	Name     string   `json:"name"`
	Email    string   `json:"email,omitempty"`
	Age      int      `json:"age,omitempty"`
	Tags     []string `json:"tags,omitempty"`
	Password string   `json:"-"`
	Score    float64  `json:"score,string"`
}

func main() {
	p := Profile{Name: "Ada", Password: "secret", Score: 9.5}
	b, _ := json.Marshal(p)
	fmt.Println(string(b))

	p.Email = "ada@example.com"
	p.Tags = []string{"math", "code"}
	b, _ = json.MarshalIndent(p, "", "  ")
	fmt.Println(string(b))
}
