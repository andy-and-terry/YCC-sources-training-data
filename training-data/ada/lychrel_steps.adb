with Ada.Text_IO; use Ada.Text_IO;

--  Reverse-and-add until a palindrome; count the steps.
procedure Lychrel_Steps is
   type Big is range 0 .. 2**62;

   function Reverse_Digits (V : Big) return Big is
      M : Big := V;
      R : Big := 0;
   begin
      while M > 0 loop
         R := R * 10 + M mod 10;
         M := M / 10;
      end loop;
      return R;
   end Reverse_Digits;

   function Steps (Start : Big) return Integer is
      N : Big := Start;
   begin
      for Count in 0 .. 49 loop
         if Count > 0 and then N = Reverse_Digits (N) then
            return Count;
         end if;
         N := N + Reverse_Digits (N);
      end loop;
      return -1;
   end Steps;

   Starts : constant array (1 .. 5) of Big := (56, 57, 59, 79, 89);
begin
   for S of Starts loop
      Put (Integer'Image (Steps (S)));
   end loop;
   New_Line;
end Lychrel_Steps;
