errordomain ValidationError {
    EMPTY_INPUT,
    TOO_SHORT,
    INVALID_FORMAT
}

void check_not_empty(string input) throws ValidationError {
    if (input.length == 0) {
        throw new ValidationError.EMPTY_INPUT("input must not be empty");
    }
}

void check_min_length(string input, int min_length) throws ValidationError {
    check_not_empty(input);
    if (input.length < min_length) {
        throw new ValidationError.TOO_SHORT("input must be at least %d characters".printf(min_length));
    }
}

void validate_username(string input) throws ValidationError {
    check_min_length(input, 3);
    if (input.contains(" ")) {
        throw new ValidationError.INVALID_FORMAT("input must not contain spaces");
    }
}

void try_validate(string input) {
    try {
        validate_username(input);
        stdout.printf("\"%s\" is valid\n", input);
    } catch (ValidationError e) {
        stdout.printf("\"%s\" rejected: %s\n", input, e.message);
    }
}

void main() {
    try_validate("");
    try_validate("ab");
    try_validate("bad name");
    try_validate("good_name");
}
