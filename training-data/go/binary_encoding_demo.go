package main

import (
	"bytes"
	"encoding/binary"
	"fmt"
)

type Header struct {
	Magic   uint32
	Version uint16
	Flags   uint16
	Length  int64
}

func main() {
	h := Header{Magic: 0xCAFEBABE, Version: 2, Flags: 0x0101, Length: 4096}

	var buf bytes.Buffer
	if err := binary.Write(&buf, binary.BigEndian, h); err != nil {
		panic(err)
	}
	fmt.Printf("% x\n", buf.Bytes())

	var out Header
	if err := binary.Read(&buf, binary.BigEndian, &out); err != nil {
		panic(err)
	}
	fmt.Printf("%+v\n", out)

	b := make([]byte, 8)
	binary.LittleEndian.PutUint32(b, 1)
	fmt.Println(b, binary.LittleEndian.Uint32(b))
}
