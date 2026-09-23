#import <Foundation/Foundation.h>

// Under ARC, a "strong" property keeps its object alive as long as the
// property holds it; a "weak" property does not. If a Parent strongly
// retains its Child, and that Child strongly retains its Parent back,
// neither can ever reach a retain count of zero: a retain cycle. Making
// the back-reference "weak" breaks the cycle, since a weak reference is
// automatically set to nil once nothing strong points to the object.
@interface Child : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, weak) id parent; // weak: does not keep the parent alive
- (void)dealloc;
@end

@implementation Child
- (void)dealloc {
    NSLog(@"deallocating child %@", self.name);
}
@end

@interface Parent : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray<Child *> *children; // strong: owns its children
- (void)addChildNamed:(NSString *)name;
- (void)dealloc;
@end

@implementation Parent
- (instancetype)init {
    self = [super init];
    if (self) _children = [NSMutableArray array];
    return self;
}

- (void)addChildNamed:(NSString *)name {
    Child *child = [[Child alloc] init];
    child.name = name;
    child.parent = self; // weak back-reference: no retain cycle with children
    [self.children addObject:child];
}

- (void)dealloc {
    NSLog(@"deallocating parent %@", self.name);
}
@end

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Parent *parent = [[Parent alloc] init];
        parent.name = @"Household";
        [parent addChildNamed:@"Alice"];
        [parent addChildNamed:@"Bob"];

        for (Child *child in parent.children) {
            Parent *owner = child.parent;
            NSLog(@"%@'s parent is %@", child.name, owner.name);
        }
        // When this scope ends, parent and its children can be freed
        // together, since nothing but the weak back-reference points
        // from child back to parent.
    }
    return 0;
}
