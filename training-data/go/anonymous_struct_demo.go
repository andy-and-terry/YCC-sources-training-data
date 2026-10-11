package main

import "fmt"

func main() {
	point := struct{ X, Y int }{3, 4}
	fmt.Printf("%+v\n", point)

	tests := []struct {
		name string
		in   int
		want bool
	}{
		{"even", 4, true},
		{"odd", 7, false},
		{"zero", 0, true},
	}
	for _, tc := range tests {
		got := tc.in%2 == 0
		fmt.Printf("%-5s got=%v want=%v pass=%v\n", tc.name, got, tc.want, got == tc.want)
	}

	cfg := struct {
		Host string
		Port int
	}{"localhost", 8080}
	fmt.Println(cfg.Host, cfg.Port)
}
