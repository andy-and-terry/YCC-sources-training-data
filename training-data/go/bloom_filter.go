package main

import (
	"crypto/sha256"
	"fmt"
	"math/big"
)

type bloomFilter struct {
	bits      []bool
	size      int
	numHashes int
}

func newBloomFilter(size, numHashes int) *bloomFilter {
	return &bloomFilter{bits: make([]bool, size), size: size, numHashes: numHashes}
}

func (bf *bloomFilter) hashes(item string) []int {
	result := make([]int, bf.numHashes)
	for i := 0; i < bf.numHashes; i++ {
		sum := sha256.Sum256([]byte(fmt.Sprintf("%d:%s", i, item)))
		value := new(big.Int).SetBytes(sum[:])
		result[i] = int(new(big.Int).Mod(value, big.NewInt(int64(bf.size))).Int64())
	}
	return result
}

func (bf *bloomFilter) add(item string) {
	for _, idx := range bf.hashes(item) {
		bf.bits[idx] = true
	}
}

func (bf *bloomFilter) mightContain(item string) bool {
	for _, idx := range bf.hashes(item) {
		if !bf.bits[idx] {
			return false
		}
	}
	return true
}

func main() {
	bf := newBloomFilter(1000, 3)
	bf.add("hello")
	fmt.Println(bf.mightContain("hello"), bf.mightContain("world"))
}
