package main

import "fmt"

type Server struct {
	host string
	port int
}

type Option func(*Server)

func WithPort(p int) Option { return func(s *Server) { s.port = p } }

func New(host string, opts ...Option) *Server {
	s := &Server{host: host, port: 80}
	for _, o := range opts {
		o(s)
	}
	return s
}

func main() { fmt.Printf("%+v\n", *New("localhost", WithPort(8080))) }
