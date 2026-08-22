package main

import (
	"encoding/json"
	"fmt"
)

type Address struct {
	City string `json:"city"`
	Zip  string `json:"zip"`
}

type Person struct {
	Name    string   `json:"name"`
	Age     int      `json:"age"`
	Address Address  `json:"address"`
	Tags    []string `json:"tags,omitempty"`
}

func main() {
	p := Person{Name: "Alice", Age: 30, Address: Address{City: "Springfield", Zip: "00000"}}
	data, err := json.Marshal(p)
	if err != nil {
		panic(err)
	}
	fmt.Println(string(data))

	var decoded Person
	if err := json.Unmarshal(data, &decoded); err != nil {
		panic(err)
	}
	fmt.Println(decoded)
}
