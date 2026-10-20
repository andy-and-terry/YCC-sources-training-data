package main

import (
	"fmt"
	"io"
	"net/http"
	"net/http/httptest"
)

func hello(w http.ResponseWriter, r *http.Request) {
	name := r.URL.Query().Get("name")
	if name == "" {
		http.Error(w, "missing name", http.StatusBadRequest)
		return
	}
	fmt.Fprintf(w, "hi %s", name)
}

func main() {
	req := httptest.NewRequest("GET", "/?name=ann", nil)
	rec := httptest.NewRecorder()
	hello(rec, req)
	body, _ := io.ReadAll(rec.Result().Body)
	fmt.Println(rec.Code, string(body))

	rec = httptest.NewRecorder()
	hello(rec, httptest.NewRequest("GET", "/", nil))
	fmt.Println(rec.Code)

	srv := httptest.NewServer(http.HandlerFunc(hello))
	defer srv.Close()
	resp, _ := http.Get(srv.URL + "?name=bo")
	b, _ := io.ReadAll(resp.Body)
	resp.Body.Close()
	fmt.Println(string(b))
}
