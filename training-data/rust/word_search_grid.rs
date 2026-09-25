fn exists(board: &mut [Vec<u8>], word: &[u8]) -> bool {
    fn dfs(b: &mut [Vec<u8>], w: &[u8], r: usize, c: usize) -> bool {
        let Some(first) = w.first() else { return true };
        if b.get(r).and_then(|row| row.get(c)) != Some(first) {
            return false;
        }
        let saved = std::mem::replace(&mut b[r][c], b'#');
        let rest = &w[1..];
        let found = dfs(b, rest, r + 1, c)
            || (r > 0 && dfs(b, rest, r - 1, c))
            || dfs(b, rest, r, c + 1)
            || (c > 0 && dfs(b, rest, r, c - 1));
        b[r][c] = saved;
        found
    }
    let (rows, cols) = (board.len(), board[0].len());
    (0..rows).any(|r| (0..cols).any(|c| dfs(board, word, r, c)))
}

fn main() {
    let mut board: Vec<Vec<u8>> = ["ABCE", "SFCS", "ADEE"].iter().map(|s| s.bytes().collect()).collect();
    for w in ["ABCCED", "SEE", "ABCB"] {
        println!("{} {}", w, exists(&mut board, w.as_bytes()));
    }
}
