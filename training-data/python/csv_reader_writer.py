import csv
import io


def write_csv(rows, fieldnames):
    buffer = io.StringIO()
    writer = csv.DictWriter(buffer, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerows(rows)
    return buffer.getvalue()


def read_csv(text):
    return list(csv.DictReader(io.StringIO(text)))


if __name__ == "__main__":
    rows = [{"name": "Alice", "age": "30"}, {"name": "Bob", "age": "25"}]
    csv_text = write_csv(rows, ["name", "age"])
    print(csv_text)
    print(read_csv(csv_text))
