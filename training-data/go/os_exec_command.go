package main

import (
	"bytes"
	"context"
	"fmt"
	"os/exec"
	"strings"
	"time"
)

func main() {
	out, err := exec.Command("echo", "hello").Output()
	fmt.Printf("%q %v\n", out, err)

	cmd := exec.Command("tr", "a-z", "A-Z")
	cmd.Stdin = strings.NewReader("shout")
	var buf bytes.Buffer
	cmd.Stdout = &buf
	_ = cmd.Run()
	fmt.Println(buf.String())

	ctx, cancel := context.WithTimeout(context.Background(), 50*time.Millisecond)
	defer cancel()
	err = exec.CommandContext(ctx, "sleep", "2").Run()
	fmt.Println("killed:", err != nil)

	_, err = exec.LookPath("definitely-not-a-binary")
	fmt.Println(err != nil)
}
