package main

import (
	"encoding/json"
	"fmt"
)

type Base struct {
	ID int `json:"id"`
}
type Post struct {
	Base
	Title string `json:"title"`
}

func main() {
	b, _ := json.Marshal(Post{Base{7}, "hi"})
	fmt.Println(string(b))
}
