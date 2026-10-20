package main

import (
	"fmt"
	"io"
	"net/http"
	"net/http/httptest"
)

func hello(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "hello %s", r.URL.Query().Get("name"))
}

func main() {
	rec := httptest.NewRecorder()
	hello(rec, httptest.NewRequest("GET", "/?name=go", nil))
	b, _ := io.ReadAll(rec.Result().Body)
	fmt.Println(string(b), rec.Code)
}
