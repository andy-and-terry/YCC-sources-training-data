enum FileSystemNode {
    File { name: String, size: u64 },
    Directory { name: String, children: Vec<FileSystemNode> },
}

impl FileSystemNode {
    fn total_size(&self) -> u64 {
        match self {
            FileSystemNode::File { size, .. } => *size,
            FileSystemNode::Directory { children, .. } => {
                children.iter().map(|c| c.total_size()).sum()
            }
        }
    }

    fn print(&self, depth: usize) {
        let indent = "  ".repeat(depth);
        match self {
            FileSystemNode::File { name, size } => println!("{indent}{name} ({size} bytes)"),
            FileSystemNode::Directory { name, children } => {
                println!("{indent}{name}/");
                for child in children {
                    child.print(depth + 1);
                }
            }
        }
    }
}

fn main() {
    let tree = FileSystemNode::Directory {
        name: "root".to_string(),
        children: vec![
            FileSystemNode::File { name: "a.txt".to_string(), size: 100 },
            FileSystemNode::Directory {
                name: "src".to_string(),
                children: vec![
                    FileSystemNode::File { name: "main.rs".to_string(), size: 250 },
                    FileSystemNode::File { name: "lib.rs".to_string(), size: 400 },
                ],
            },
        ],
    };

    tree.print(0);
    println!("total size: {}", tree.total_size());
}
