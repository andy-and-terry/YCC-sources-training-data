with Ada.Text_IO; use Ada.Text_IO;

procedure Emirp_Numbers is
   function Is_Prime (N : Natural) return Boolean is
      I : Natural := 2;
   begin
      if N < 2 then
         return False;
      end if;
      while I * I <= N loop
         if N mod I = 0 then
            return False;
         end if;
         I := I + 1;
      end loop;
      return True;
   end Is_Prime;

   function Reverse_Digits (N : Natural) return Natural is
      M : Natural := N;
      R : Natural := 0;
   begin
      while M > 0 loop
         R := R * 10 + M mod 10;
         M := M / 10;
      end loop;
      return R;
   end Reverse_Digits;
begin
   for P in 2 .. 199 loop
      if Reverse_Digits (P) /= P and then Is_Prime (P) and then Is_Prime (Reverse_Digits (P)) then
         Put (Integer'Image (P));
      end if;
   end loop;
   New_Line;  --  13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
end Emirp_Numbers;
