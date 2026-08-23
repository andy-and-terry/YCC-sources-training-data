text = "Contact us at support@example.com or sales@example.org"
matches = text.scan(/[\w.+-]+@[\w-]+\.[\w.-]+/).map { |m| m[0] }
puts matches.inspect
