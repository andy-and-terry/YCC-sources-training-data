from abc import ABC, abstractmethod


class DataExporter(ABC):
    """Template method: fixed skeleton, customizable steps."""

    def export(self, records):
        header = self.format_header()
        rows = [self.format_row(r) for r in records]
        return "\n".join([header, *rows])

    @abstractmethod
    def format_header(self):
        ...

    @abstractmethod
    def format_row(self, record):
        ...


class CsvExporter(DataExporter):
    def format_header(self):
        return "name,age"

    def format_row(self, record):
        return f"{record['name']},{record['age']}"


class MarkdownTableExporter(DataExporter):
    def format_header(self):
        return "| name | age |\n|------|-----|"

    def format_row(self, record):
        return f"| {record['name']} | {record['age']} |"


if __name__ == "__main__":
    people = [{"name": "Ada", "age": 36}, {"name": "Alan", "age": 41}]
    print(CsvExporter().export(people))
    print()
    print(MarkdownTableExporter().export(people))
