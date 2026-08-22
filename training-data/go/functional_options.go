package main

import "fmt"

type serverConfig struct {
	host    string
	port    int
	timeout int
}

type option func(*serverConfig)

func withHost(host string) option {
	return func(c *serverConfig) { c.host = host }
}

func withPort(port int) option {
	return func(c *serverConfig) { c.port = port }
}

func withTimeout(timeout int) option {
	return func(c *serverConfig) { c.timeout = timeout }
}

func newServerConfig(opts ...option) *serverConfig {
	config := &serverConfig{host: "localhost", port: 8080, timeout: 30}
	for _, opt := range opts {
		opt(config)
	}
	return config
}

func main() {
	config := newServerConfig(withPort(9090), withTimeout(60))
	fmt.Printf("%+v\n", *config)
}
