#include <iostream>
#include <string>
#include <vector>

class EditorMemento {
public:
    explicit EditorMemento(std::string text) : text(std::move(text)) {}
    const std::string &get_text() const { return text; }

private:
    std::string text;
};

class Editor {
public:
    void type(const std::string &words) { content += words; }
    const std::string &content_text() const { return content; }

    EditorMemento save() const { return EditorMemento(content); }
    void restore(const EditorMemento &memento) { content = memento.get_text(); }

private:
    std::string content;
};

class History {
public:
    void push(const EditorMemento &memento) { snapshots.push_back(memento); }

    EditorMemento pop() {
        EditorMemento last = snapshots.back();
        snapshots.pop_back();
        return last;
    }

private:
    std::vector<EditorMemento> snapshots;
};

int main() {
    Editor editor;
    History history;

    editor.type("Hello");
    history.push(editor.save());
    editor.type(", world");
    history.push(editor.save());
    editor.type("!!!");

    std::cout << editor.content_text() << std::endl;
    editor.restore(history.pop());
    std::cout << editor.content_text() << std::endl;
    editor.restore(history.pop());
    std::cout << editor.content_text() << std::endl;

    return 0;
}
