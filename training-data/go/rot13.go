package main

import (
	"fmt"
	"io"
	"os"
	"strings"
)

// rot13Reader wraps an io.Reader and rotates letters as they stream through.
type rot13Reader struct{ r io.Reader }

func (rr rot13Reader) Read(p []byte) (int, error) {
	n, err := rr.r.Read(p)
	for i := 0; i < n; i++ {
		switch c := p[i]; {
		case c >= 'a' && c <= 'z':
			p[i] = 'a' + (c-'a'+13)%26
		case c >= 'A' && c <= 'Z':
			p[i] = 'A' + (c-'A'+13)%26
		}
	}
	return n, err
}

func main() {
	io.Copy(os.Stdout, rot13Reader{strings.NewReader("Why did the chicken cross the road?\n")})
	var sb strings.Builder
	io.Copy(&sb, rot13Reader{rot13Reader{strings.NewReader("round trip")}})
	fmt.Println(sb.String())
}
