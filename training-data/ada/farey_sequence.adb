with Ada.Text_IO; use Ada.Text_IO;

--  Farey sequence F_n: reduced fractions in [0,1] with denominator <= n
procedure Farey_Sequence is
   N    : constant Integer := 5;
   A    : Integer := 0;
   B    : Integer := 1;
   C    : Integer := 1;
   D    : Integer := N;
   K, E, F : Integer;

   function Img (X : Integer) return String is
      S : constant String := Integer'Image (X);
   begin
      return S (S'First + 1 .. S'Last);
   end Img;
begin
   Put (Img (A) & "/" & Img (B));
   while C <= N loop
      K := (N + B) / D;
      E := K * C - A;
      F := K * D - B;
      A := C; B := D; C := E; D := F;
      Put (" " & Img (A) & "/" & Img (B));
   end loop;
   New_Line;
end Farey_Sequence;
