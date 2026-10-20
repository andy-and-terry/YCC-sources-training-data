package main

import (
	"log/slog"
	"os"
)

func main() {
	h := slog.NewTextHandler(os.Stdout, &slog.HandlerOptions{
		Level: slog.LevelDebug,
		ReplaceAttr: func(groups []string, a slog.Attr) slog.Attr {
			if a.Key == slog.TimeKey {
				return slog.Attr{} // drop the timestamp for stable output
			}
			return a
		},
	})
	log := slog.New(h).With("service", "api")
	log.Info("request", "path", "/x", "status", 200)
	log.Debug("cache", slog.Group("stats", slog.Int("hits", 3), slog.Int("miss", 1)))
	log.WithGroup("db").Warn("slow query", "ms", 912)
}
