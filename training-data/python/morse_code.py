MORSE = {
    "A": ".-", "B": "-...", "C": "-.-.", "D": "-..", "E": ".", "F": "..-.",
    "G": "--.", "H": "....", "I": "..", "J": ".---", "K": "-.-", "L": ".-..",
    "M": "--", "N": "-.", "O": "---", "P": ".--.", "Q": "--.-", "R": ".-.",
    "S": "...", "T": "-", "U": "..-", "V": "...-", "W": ".--", "X": "-..-",
    "Y": "-.--", "Z": "--..", "0": "-----", "1": ".----", "2": "..---",
    "3": "...--", "4": "....-", "5": ".....", "6": "-....", "7": "--...",
    "8": "---..", "9": "----.",
}
REVERSE = {v: k for k, v in MORSE.items()}


def encode(text):
    return " / ".join(" ".join(MORSE[c] for c in word if c in MORSE) for word in text.upper().split())


def decode(code):
    return " ".join("".join(REVERSE[s] for s in word.split()) for word in code.split(" / "))


if __name__ == "__main__":
    m = encode("SOS help 2024")
    print(m)
    print(decode(m))
