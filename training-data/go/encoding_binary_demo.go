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
	buf := new(bytes.Buffer)
	h := Header{Magic: 0xCAFE, Version: 1, Flags: 0x80, Length: 1024}
	binary.Write(buf, binary.BigEndian, h)
	fmt.Printf("% x\n", buf.Bytes())

	var out Header
	binary.Read(bytes.NewReader(buf.Bytes()), binary.BigEndian, &out)
	fmt.Printf("%+v\n", out)

	b := make([]byte, 4)
	binary.LittleEndian.PutUint32(b, 0x01020304)
	fmt.Println(b, binary.BigEndian.Uint32(b))

	vb := binary.AppendUvarint(nil, 300)
	v, n := binary.Uvarint(vb)
	fmt.Println(vb, v, n)
}
