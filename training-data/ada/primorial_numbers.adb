--  Primorials up to 1e6, including 1; expect 8.
with Ada.Text_IO; use Ada.Text_IO;

procedure Primorial_Numbers is
   function Is_Prime (N : Integer) return Boolean is
      D : Integer := 2;
   begin
      if N < 2 then
         return False;
      end if;
      while D * D <= N loop
         if N mod D = 0 then
            return False;
         end if;
         D := D + 1;
      end loop;
      return True;
   end Is_Prime;
   C   : Integer := 1;
   Acc : Long_Long_Integer := 1;
   P   : Integer := 2;
begin
   loop
      if Is_Prime (P) then
         Acc := Acc * Long_Long_Integer (P);
         exit when Acc > 1_000_000;
         C := C + 1;
      end if;
      P := P + 1;
   end loop;
   Put_Line (Integer'Image (C));
end Primorial_Numbers;
