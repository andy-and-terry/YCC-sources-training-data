with Ada.Text_IO; use Ada.Text_IO;

--  s-gonal number: P(s, n) = ((s - 2) * n * n - (s - 4) * n) / 2
procedure Polygonal_Numbers is
   function Polygonal (S, N : Integer) return Integer is
     (((S - 2) * N * N - (S - 4) * N) / 2);

   procedure Show (Name : String; S : Integer) is
   begin
      Put (Name & ":");
      for N in 1 .. 10 loop
         Put (Integer'Image (Polygonal (S, N)));
      end loop;
      New_Line;
   end Show;
begin
   Show ("Triangular", 3);
   Show ("Pentagonal", 5);
   Show ("Hexagonal", 6);
end Polygonal_Numbers;
