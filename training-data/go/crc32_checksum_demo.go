package main

import (
	"fmt"
	"hash/crc32"
	"hash/fnv"
)

func main() {
	data := []byte("hello world")
	fmt.Printf("crc32 IEEE: %08x\n", crc32.ChecksumIEEE(data))

	tab := crc32.MakeTable(crc32.Castagnoli)
	fmt.Printf("crc32 Castagnoli: %08x\n", crc32.Checksum(data, tab))

	h := crc32.NewIEEE()
	h.Write([]byte("hello "))
	h.Write([]byte("world"))
	fmt.Printf("streamed: %08x\n", h.Sum32())

	f := fnv.New32a()
	f.Write(data)
	fmt.Printf("fnv32a: %08x\n", f.Sum32())
}
