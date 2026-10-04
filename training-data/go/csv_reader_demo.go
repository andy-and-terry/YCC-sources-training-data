package main

import (
	"encoding/csv"
	"fmt"
	"io"
	"strconv"
	"strings"
)

const data = `name,age,city
Alice,30,Paris
Bob,25,"New York, NY"
Carol,41,Berlin
`

func main() {
	r := csv.NewReader(strings.NewReader(data))
	header, _ := r.Read()
	fmt.Println("columns:", header)

	total := 0
	for {
		rec, err := r.Read()
		if err == io.EOF {
			break
		}
		if err != nil {
			panic(err)
		}
		age, _ := strconv.Atoi(rec[1])
		total += age
		fmt.Printf("%-6s %2d %s\n", rec[0], age, rec[2])
	}
	fmt.Println("total age:", total)
}
