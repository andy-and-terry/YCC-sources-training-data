def parse_ini(text: str) -> dict:
    result = {}
    section = None
    for line in text.splitlines():
        line = line.strip()
        if not line or line.startswith(("#", ";")):
            continue
        if line.startswith("[") and line.endswith("]"):
            section = line[1:-1]
            result[section] = {}
        elif "=" in line and section is not None:
            key, _, value = line.partition("=")
            result[section][key.strip()] = value.strip()
    return result


if __name__ == "__main__":
    sample = """
    [server]
    host = localhost
    port = 8080
    """
    print(parse_ini(sample))
