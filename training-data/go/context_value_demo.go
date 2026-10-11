package main

import (
	"context"
	"fmt"
)

type ctxKey string

const (
	userKey  ctxKey = "user"
	traceKey ctxKey = "trace"
)

func withUser(ctx context.Context, u string) context.Context {
	return context.WithValue(ctx, userKey, u)
}

func userFrom(ctx context.Context) (string, bool) {
	u, ok := ctx.Value(userKey).(string)
	return u, ok
}

func handler(ctx context.Context) {
	u, ok := userFrom(ctx)
	fmt.Println("user:", u, ok, "trace:", ctx.Value(traceKey))
}

func main() {
	ctx := context.Background()
	handler(ctx)
	ctx = withUser(ctx, "alice")
	ctx = context.WithValue(ctx, traceKey, "t-42")
	handler(ctx)
}
