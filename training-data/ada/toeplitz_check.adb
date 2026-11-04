with Ada.Text_IO; use Ada.Text_IO;

procedure Toeplitz_Check is
   type Matrix is array (Positive range <>, Positive range <>) of Integer;

   function Is_Toeplitz (M : Matrix) return Boolean is
   begin
      for I in M'First (1) + 1 .. M'Last (1) loop
         for J in M'First (2) + 1 .. M'Last (2) loop
            if M (I, J) /= M (I - 1, J - 1) then
               return False;
            end if;
         end loop;
      end loop;
      return True;
   end Is_Toeplitz;

   A : constant Matrix (1 .. 3, 1 .. 3) := ((1, 2, 3), (4, 1, 2), (5, 4, 1));
   B : constant Matrix (1 .. 2, 1 .. 2) := ((1, 2), (2, 2));
begin
   Put_Line (Boolean'Image (Is_Toeplitz (A)));
   Put_Line (Boolean'Image (Is_Toeplitz (B)));
end Toeplitz_Check;
