use std::collections::HashMap;
use std::rc::Rc;

/// Intrinsic (shared) state: expensive to build, safe to reuse.
struct TreeType {
    name: String,
    texture: String,
}

impl TreeType {
    fn render(&self, x: i32, y: i32) -> String {
        format!("{} ({}) at ({}, {})", self.name, self.texture, x, y)
    }
}

struct TreeFactory {
    cache: HashMap<String, Rc<TreeType>>,
}

impl TreeFactory {
    fn new() -> Self {
        TreeFactory { cache: HashMap::new() }
    }

    fn get(&mut self, name: &str, texture: &str) -> Rc<TreeType> {
        let key = format!("{name}:{texture}");
        self.cache
            .entry(key)
            .or_insert_with(|| {
                Rc::new(TreeType {
                    name: name.to_string(),
                    texture: texture.to_string(),
                })
            })
            .clone()
    }
}

fn main() {
    let mut factory = TreeFactory::new();
    // Extrinsic (per-instance) state: the coordinates, passed at render time.
    let placements = [("oak", "green", 1, 2), ("oak", "green", 5, 9), ("pine", "dark", 3, 3)];

    let mut rendered = Vec::new();
    for (kind, texture, x, y) in placements {
        let tree_type = factory.get(kind, texture);
        rendered.push(tree_type.render(x, y));
    }
    for line in &rendered {
        println!("{line}");
    }
    println!("distinct flyweights cached: {}", factory.cache.len());
}
