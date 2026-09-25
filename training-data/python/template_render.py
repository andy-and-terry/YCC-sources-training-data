import re

TOKEN = re.compile(r"\{\{\s*([\w.]+)\s*(?:\|\s*(\w+))?\s*\}\}")
FILTERS = {"upper": str.upper, "lower": str.lower, "title": str.title}


def lookup(ctx, path):
    cur = ctx
    for part in path.split("."):
        cur = cur[part] if isinstance(cur, dict) else getattr(cur, part)
    return cur


def render(template, ctx):
    def repl(m):
        value = str(lookup(ctx, m.group(1)))
        f = m.group(2)
        return FILTERS[f](value) if f else value

    return TOKEN.sub(repl, template)


if __name__ == "__main__":
    tpl = "Hello {{ user.name | title }}, you have {{count}} new {{ kind|upper }}."
    print(render(tpl, {"user": {"name": "ada lovelace"}, "count": 3, "kind": "messages"}))
