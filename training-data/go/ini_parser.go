package main

import (
	"fmt"
	"strings"
)

func parseIni(text string) map[string]map[string]string {
	result := make(map[string]map[string]string)
	section := ""
	for _, rawLine := range strings.Split(text, "\n") {
		line := strings.TrimSpace(rawLine)
		if line == "" || strings.HasPrefix(line, "#") || strings.HasPrefix(line, ";") {
			continue
		}
		if strings.HasPrefix(line, "[") && strings.HasSuffix(line, "]") {
			section = line[1 : len(line)-1]
			result[section] = make(map[string]string)
		} else if strings.Contains(line, "=") && section != "" {
			parts := strings.SplitN(line, "=", 2)
			result[section][strings.TrimSpace(parts[0])] = strings.TrimSpace(parts[1])
		}
	}
	return result
}

func main() {
	sample := "\n[server]\nhost = localhost\nport = 8080\n"
	fmt.Println(parseIni(sample))
}
