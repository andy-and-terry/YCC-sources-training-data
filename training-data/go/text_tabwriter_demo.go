package main

import (
	"fmt"
	"os"
	"text/tabwriter"
)

func main() {
	w := tabwriter.NewWriter(os.Stdout, 0, 8, 2, ' ', 0)
	fmt.Fprintln(w, "NAME\tQTY\tPRICE")
	fmt.Fprintln(w, "apple\t3\t0.50")
	fmt.Fprintln(w, "watermelon\t1\t4.25")
	fmt.Fprintln(w, "fig\t12\t0.10")
	w.Flush()

	r := tabwriter.NewWriter(os.Stdout, 0, 0, 1, '.', tabwriter.AlignRight|tabwriter.Debug)
	fmt.Fprintln(r, "a\tbbb\tc\t")
	fmt.Fprintln(r, "aaaa\tb\tccccc\t")
	r.Flush()
}
