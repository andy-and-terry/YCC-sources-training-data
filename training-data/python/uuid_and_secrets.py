import secrets
import uuid


if __name__ == "__main__":
    ns = uuid.uuid5(uuid.NAMESPACE_DNS, "example.com")
    print(ns)  # deterministic: same name -> same UUID
    assert ns == uuid.uuid5(uuid.NAMESPACE_DNS, "example.com")
    rand = uuid.uuid4()
    print(rand.version, len(rand.hex))
    token = secrets.token_urlsafe(16)
    print(len(token) >= 16)
    print(secrets.compare_digest("abc", "abc"), secrets.compare_digest("abc", "abd"))
    print(secrets.choice("abcdef") in "abcdef")
