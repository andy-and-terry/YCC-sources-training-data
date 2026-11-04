with Ada.Text_IO; use Ada.Text_IO;

procedure Base_N_Convert is
   Digits : constant String := "0123456789abcdefghijklmnopqrstuvwxyz";

   function To_Base (N : Natural; B : Positive) return String is
      V      : Natural := N;
      Buffer : String (1 .. 32);
      Pos    : Natural := Buffer'Last + 1;
   begin
      if N = 0 then
         return "0";
      end if;
      while V > 0 loop
         Pos := Pos - 1;
         Buffer (Pos) := Digits (V mod B + 1);
         V := V / B;
      end loop;
      return Buffer (Pos .. Buffer'Last);
   end To_Base;
begin
   for B of (2, 8, 16, 36) loop
      Put_Line ("255 in base" & Integer'Image (B) & " = " & To_Base (255, B));
   end loop;
end Base_N_Convert;
