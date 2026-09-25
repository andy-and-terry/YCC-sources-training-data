package main

import (
	"fmt"
	"unicode"
)

type kind int

const (
	kNumber kind = iota
	kIdent
	kKeyword
	kString
	kOp
	kEOF
)

var kindNames = [...]string{"NUMBER", "IDENT", "KEYWORD", "STRING", "OP", "EOF"}

func (k kind) String() string { return kindNames[k] }

type token struct {
	kind      kind
	text      string
	line, col int
}

type lexer struct {
	src             []rune
	pos, line, lcol int
}

var keywords = map[string]bool{"func": true, "if": true, "else": true, "for": true, "return": true, "var": true}

func (lx *lexer) next() token {
	for lx.pos < len(lx.src) {
		c := lx.src[lx.pos]
		if c == '\n' {
			lx.line++
			lx.pos++
			lx.lcol = lx.pos
		} else if unicode.IsSpace(c) {
			lx.pos++
		} else if c == '/' && lx.pos+1 < len(lx.src) && lx.src[lx.pos+1] == '/' {
			for lx.pos < len(lx.src) && lx.src[lx.pos] != '\n' {
				lx.pos++
			}
		} else {
			break
		}
	}
	start, col := lx.pos, lx.pos-lx.lcol+1
	if lx.pos >= len(lx.src) {
		return token{kEOF, "", lx.line, col}
	}
	c := lx.src[lx.pos]
	var k kind
	switch {
	case unicode.IsDigit(c):
		for lx.pos < len(lx.src) && (unicode.IsDigit(lx.src[lx.pos]) || lx.src[lx.pos] == '.') {
			lx.pos++
		}
		k = kNumber
	case unicode.IsLetter(c) || c == '_':
		for lx.pos < len(lx.src) && (unicode.IsLetter(lx.src[lx.pos]) || unicode.IsDigit(lx.src[lx.pos]) || lx.src[lx.pos] == '_') {
			lx.pos++
		}
		k = kIdent
		if keywords[string(lx.src[start:lx.pos])] {
			k = kKeyword
		}
	case c == '"':
		for lx.pos++; lx.pos < len(lx.src) && lx.src[lx.pos] != '"'; lx.pos++ {
			if lx.src[lx.pos] == '\\' {
				lx.pos++
			}
		}
		lx.pos++
		k = kString
	default:
		lx.pos++
		if lx.pos < len(lx.src) {
			switch string(lx.src[start : lx.pos+1]) {
			case "==", "!=", "<=", ">=", ":=", "&&", "||":
				lx.pos++
			}
		}
		k = kOp
	}
	return token{k, string(lx.src[start:lx.pos]), lx.line, col}
}

func main() {
	lx := &lexer{src: []rune("x := 3.5 * (y + 2) // note\nif x >= 10 && ok { print(\"big\") }"), line: 1}
	for t := lx.next(); t.kind != kEOF; t = lx.next() {
		fmt.Printf("%d:%-3d %-8v %s\n", t.line, t.col, t.kind, t.text)
	}
}
