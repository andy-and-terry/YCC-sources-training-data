using System;
using System.Linq;

class WordSearchGrid
{
    static bool Exists(char[][] board, string word)
    {
        bool Dfs(int r, int c, int i)
        {
            if (i == word.Length) return true;
            if (r < 0 || c < 0 || r >= board.Length || c >= board[r].Length || board[r][c] != word[i]) return false;
            char saved = board[r][c];
            board[r][c] = '#';
            bool found = Dfs(r + 1, c, i + 1) || Dfs(r - 1, c, i + 1) || Dfs(r, c + 1, i + 1) || Dfs(r, c - 1, i + 1);
            board[r][c] = saved;
            return found;
        }

        return Enumerable.Range(0, board.Length).Any(r => Enumerable.Range(0, board[r].Length).Any(c => Dfs(r, c, 0)));
    }

    static void Main()
    {
        var board = new[] { "ABCE", "SFCS", "ADEE" }.Select(s => s.ToCharArray()).ToArray();
        foreach (var w in new[] { "ABCCED", "SEE", "ABCB" }) Console.WriteLine($"{w} {Exists(board, w)}");
    }
}
