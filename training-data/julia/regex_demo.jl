text = "Contact: alice@example.com or bob@work.org for details."

email_pattern = r"[\w.]+@[\w.]+"
println(occursin(email_pattern, text))

for m in eachmatch(email_pattern, text)
    println(m.match)
end

named = match(r"(?<user>[\w.]+)@(?<domain>[\w.]+)", text)
println(named[:user], " / ", named[:domain])

println(replace(text, email_pattern => "[redacted]"))
