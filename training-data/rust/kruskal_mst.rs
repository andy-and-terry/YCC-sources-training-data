struct UnionFind {
    parent: Vec<usize>,
}

impl UnionFind {
    fn new(size: usize) -> Self {
        UnionFind { parent: (0..size).collect() }
    }

    fn find(&mut self, mut x: usize) -> usize {
        while self.parent[x] != x {
            x = self.parent[x];
        }
        x
    }

    fn union(&mut self, a: usize, b: usize) -> bool {
        let (root_a, root_b) = (self.find(a), self.find(b));
        if root_a == root_b {
            return false;
        }
        self.parent[root_a] = root_b;
        true
    }
}

fn kruskal(num_nodes: usize, edges: &[(usize, usize, i32)]) -> Vec<(usize, usize, i32)> {
    let mut sorted = edges.to_vec();
    sorted.sort_by_key(|e| e.2);
    let mut uf = UnionFind::new(num_nodes);
    sorted.into_iter().filter(|&(u, v, _)| uf.union(u, v)).collect()
}

fn main() {
    let edges = [(0, 1, 1), (0, 2, 3), (1, 2, 4), (1, 3, 2), (2, 3, 5)];
    println!("{:?}", kruskal(4, &edges));
}
