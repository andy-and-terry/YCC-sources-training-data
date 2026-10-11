package main

import (
	"log/slog"
	"os"
)

func main() {
	opts := &slog.HandlerOptions{
		Level: slog.LevelDebug,
		ReplaceAttr: func(groups []string, a slog.Attr) slog.Attr {
			if a.Key == slog.TimeKey {
				return slog.Attr{}
			}
			return a
		},
	}
	logger := slog.New(slog.NewTextHandler(os.Stdout, opts))
	logger.Debug("starting", "port", 8080)
	logger.Info("request", slog.String("method", "GET"), slog.Int("status", 200))

	reqLog := logger.With("req_id", "abc123")
	reqLog.Warn("slow", slog.Group("timing", slog.Int("ms", 1200)))

	jl := slog.New(slog.NewJSONHandler(os.Stdout, opts))
	jl.Error("failed", "err", "disk full")
}
