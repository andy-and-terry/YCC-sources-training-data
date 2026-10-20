package main

import (
	"crypto/hmac"
	"crypto/sha256"
	"encoding/hex"
	"fmt"
)

func sign(key, msg []byte) string {
	m := hmac.New(sha256.New, key)
	m.Write(msg)
	return hex.EncodeToString(m.Sum(nil))
}

func verify(key, msg []byte, sig string) bool {
	want, err := hex.DecodeString(sig)
	if err != nil {
		return false
	}
	m := hmac.New(sha256.New, key)
	m.Write(msg)
	return hmac.Equal(m.Sum(nil), want) // constant-time compare
}

func main() {
	key := []byte("k")
	sig := sign(key, []byte("payload"))
	fmt.Println(sig[:16], verify(key, []byte("payload"), sig), verify(key, []byte("tampered"), sig))
}
