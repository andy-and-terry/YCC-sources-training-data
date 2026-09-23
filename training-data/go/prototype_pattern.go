package main

import "fmt"

type document struct {
	title    string
	tags     []string
	metadata map[string]string
}

func (d *document) clone() *document {
	tagsCopy := make([]string, len(d.tags))
	copy(tagsCopy, d.tags)

	metaCopy := make(map[string]string, len(d.metadata))
	for k, v := range d.metadata {
		metaCopy[k] = v
	}

	return &document{
		title:    d.title,
		tags:     tagsCopy,
		metadata: metaCopy,
	}
}

func main() {
	original := &document{
		title:    "Report",
		tags:     []string{"draft"},
		metadata: map[string]string{"author": "Alice"},
	}

	copyDoc := original.clone()
	copyDoc.title = "Report Copy"
	copyDoc.tags = append(copyDoc.tags, "duplicate")
	copyDoc.metadata["author"] = "Bob"

	fmt.Println("original:", original.title, original.tags, original.metadata)
	fmt.Println("copy:", copyDoc.title, copyDoc.tags, copyDoc.metadata)
}
