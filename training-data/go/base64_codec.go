package main

import (
	"encoding/base64"
	"fmt"
)

func encode(data []byte) string {
	return base64.StdEncoding.EncodeToString(data)
}

func decode(text string) ([]byte, error) {
	return base64.StdEncoding.DecodeString(text)
}

func main() {
	encoded := encode([]byte("hello world"))
	fmt.Println(encoded)
	decoded, _ := decode(encoded)
	fmt.Println(string(decoded))
}
