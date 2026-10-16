package main

import (
	"crypto/hmac"
	"crypto/sha256"
	"encoding/hex"
	"fmt"
)

func main() {
	sum := sha256.Sum256([]byte("abc"))
	fmt.Println(hex.EncodeToString(sum[:]))

	h := sha256.New()
	h.Write([]byte("a"))
	h.Write([]byte("bc"))
	fmt.Printf("%x\n", h.Sum(nil))

	mac := hmac.New(sha256.New, []byte("key"))
	mac.Write([]byte("message"))
	sig := mac.Sum(nil)
	fmt.Printf("hmac: %x\n", sig)

	mac2 := hmac.New(sha256.New, []byte("key"))
	mac2.Write([]byte("message"))
	fmt.Println("valid:", hmac.Equal(sig, mac2.Sum(nil)))
}
