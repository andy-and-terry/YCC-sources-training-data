enum ValidationError: Error {
    case tooShort
    case tooLong
    case invalidCharacters
}

func validate(username: String) throws -> String {
    if username.count < 3 {
        throw ValidationError.tooShort
    }
    if username.count > 16 {
        throw ValidationError.tooLong
    }
    if !username.allSatisfy({ $0.isLetter || $0.isNumber }) {
        throw ValidationError.invalidCharacters
    }
    return username
}

for name in ["ab", "validName", "bad name!"] {
    do {
        let result = try validate(username: name)
        print("valid: \(result)")
    } catch {
        print("invalid: \(name) -> \(error)")
    }
}
