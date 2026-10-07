#import <Foundation/Foundation.h>

// The memento pattern lets an object's internal state be captured and
// restored later without exposing that state's representation to the
// code that manages the history. TextEditor produces opaque
// TextMemento snapshots; only TextEditor itself knows how to read one.
@interface TextMemento : NSObject
@property (nonatomic, copy, readonly) NSString *savedText;
- (instancetype)initWithText:(NSString *)text;
@end

@implementation TextMemento
- (instancetype)initWithText:(NSString *)text {
    self = [super init];
    if (self) _savedText = [text copy];
    return self;
}
@end

@interface TextEditor : NSObject
@property (nonatomic, copy) NSString *text;
- (TextMemento *)save;
- (void)restore:(TextMemento *)memento;
@end

@implementation TextEditor
- (TextMemento *)save {
    return [[TextMemento alloc] initWithText:self.text];
}

- (void)restore:(TextMemento *)memento {
    self.text = memento.savedText;
}
@end

// The history keeps mementos on a stack, so undo pops the most recent
// snapshot without the editor needing to manage its own history.
@interface EditorHistory : NSObject
@property (nonatomic, strong) NSMutableArray<TextMemento *> *snapshots;
- (void)push:(TextMemento *)memento;
- (TextMemento *)pop;
@end

@implementation EditorHistory
- (instancetype)init {
    self = [super init];
    if (self) _snapshots = [NSMutableArray array];
    return self;
}
- (void)push:(TextMemento *)memento {
    [self.snapshots addObject:memento];
}
- (TextMemento *)pop {
    TextMemento *last = self.snapshots.lastObject;
    [self.snapshots removeLastObject];
    return last;
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        TextEditor *editor = [[TextEditor alloc] init];
        EditorHistory *history = [[EditorHistory alloc] init];

        editor.text = @"Hello";
        [history push:[editor save]];

        editor.text = @"Hello, world";
        [history push:[editor save]];

        editor.text = @"Hello, world!!!";
        NSLog(@"current: %@", editor.text);

        [editor restore:[history pop]];
        NSLog(@"after one undo: %@", editor.text);

        [editor restore:[history pop]];
        NSLog(@"after two undos: %@", editor.text);
    }
    return 0;
}
