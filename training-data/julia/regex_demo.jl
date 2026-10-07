function extract_emails(text::String)
    pattern = r"[\w.+-]+@[\w-]+\.[\w.-]+"
    return [m.match for m in eachmatch(pattern, text)]
end

function valid_username(name::String)
    return occursin(r"^[a-zA-Z][a-zA-Z0-9_]{2,15}$", name)
end

function redact_digits(text::String)
    return replace(text, r"\d+" => "***")
end

text = "Contact alice@example.com or bob.smith@work.org for details."
println(extract_emails(text))

for name in ["alice_01", "9bob", "ab", "carol_the_great"]
    println(name, " => ", valid_username(name))
end

println(redact_digits("Order 42 shipped on 2024-05-17"))
