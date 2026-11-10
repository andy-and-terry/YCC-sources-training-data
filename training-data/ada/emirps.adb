with Ada.Text_IO; use Ada.Text_IO;

procedure Emirps is
   function Is_Prime (N : Natural) return Boolean is
      I : Natural := 2;
   begin
      if N < 2 then return False; end if;
      while I * I <= N loop
         if N mod I = 0 then return False; end if;
         I := I + 1;
      end loop;
      return True;
   end Is_Prime;

   function Reverse_Digits (N : Natural) return Natural is
      X : Natural := N;
      R : Natural := 0;
   begin
      while X > 0 loop
         R := R * 10 + X mod 10;
         X := X / 10;
      end loop;
      return R;
   end Reverse_Digits;

   Count : Natural := 0;
   N     : Natural := 2;
begin
   while Count < 10 loop
      declare
         R : constant Natural := Reverse_Digits (N);
      begin
         if R /= N and then Is_Prime (N) and then Is_Prime (R) then
            Put (Natural'Image (N));
            Count := Count + 1;
         end if;
      end;
      N := N + 1;
   end loop;
   New_Line;  --  13 17 31 37 71 73 79 97 107 113
end Emirps;
