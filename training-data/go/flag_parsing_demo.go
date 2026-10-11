package main

import (
	"flag"
	"fmt"
	"os"
	"strings"
)

type listFlag []string

func (l *listFlag) String() string     { return strings.Join(*l, ",") }
func (l *listFlag) Set(s string) error { *l = append(*l, s); return nil }

func main() {
	fs := flag.NewFlagSet("demo", flag.ContinueOnError)
	fs.SetOutput(os.Stdout)
	name := fs.String("name", "world", "who to greet")
	n := fs.Int("n", 1, "repeat count")
	verbose := fs.Bool("v", false, "verbose")
	var tags listFlag
	fs.Var(&tags, "tag", "repeatable tag")

	args := []string{"-name=gopher", "-n", "2", "-v", "-tag", "a", "-tag", "b", "extra1", "extra2"}
	if err := fs.Parse(args); err != nil {
		return
	}
	for i := 0; i < *n; i++ {
		fmt.Println("hello,", *name)
	}
	fmt.Println(*verbose, tags, fs.Args(), fs.NArg())
}
