package main

import (
	"encoding/xml"
	"fmt"
)

type Book struct {
	XMLName xml.Name `xml:"book"`
	ID      int      `xml:"id,attr"`
	Title   string   `xml:"title"`
	Authors []string `xml:"authors>author"`
}

func main() {
	b := Book{ID: 7, Title: "Go", Authors: []string{"Ann", "Bo"}}
	data, err := xml.MarshalIndent(b, "", "  ")
	if err != nil {
		panic(err)
	}
	fmt.Println(string(data))
	var back Book
	if err := xml.Unmarshal(data, &back); err != nil {
		panic(err)
	}
	fmt.Println(back.ID, back.Title, back.Authors)
}
