package main

import (
	"bytes"
	"encoding/binary"
	"fmt"
)

type Header struct {
	Magic   uint16
	Version uint8
	Flags   uint8
	Length  uint32
}

func main() {
	var buf bytes.Buffer
	h := Header{0xCAFE, 1, 3, 1024}
	if err := binary.Write(&buf, binary.BigEndian, h); err != nil {
		panic(err)
	}
	fmt.Printf("% x\n", buf.Bytes())

	var out Header
	binary.Read(&buf, binary.BigEndian, &out)
	fmt.Printf("%+v\n", out)

	b := make([]byte, 4)
	binary.LittleEndian.PutUint32(b, 0xDEADBEEF)
	fmt.Printf("% x\n", b)
}
