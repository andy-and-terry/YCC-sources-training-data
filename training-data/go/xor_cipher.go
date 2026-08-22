package main

import "fmt"

func xorTransform(data, key []byte) []byte {
	result := make([]byte, len(data))
	for i, b := range data {
		result[i] = b ^ key[i%len(key)]
	}
	return result
}

func main() {
	key := []byte("secret")
	ciphertext := xorTransform([]byte("hello world"), key)
	fmt.Println(ciphertext)
	fmt.Println(string(xorTransform(ciphertext, key)))
}
