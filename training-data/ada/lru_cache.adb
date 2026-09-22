with Ada.Text_IO; use Ada.Text_IO;

procedure Lru_Cache is
   Capacity : constant := 2;
   type Key_Array is array (1 .. Capacity) of Integer;
   type Val_Array is array (1 .. Capacity) of Integer;

   Keys   : Key_Array := (others => -1);
   Vals   : Val_Array := (others => -1);
   Filled : Natural := 0;

   procedure Touch (Index : Positive) is
      Key_Tmp, Val_Tmp : Integer;
   begin
      -- move the entry at Index to the most-recently-used end
      Key_Tmp := Keys (Index);
      Val_Tmp := Vals (Index);
      for I in reverse 2 .. Index loop
         Keys (I) := Keys (I - 1);
         Vals (I) := Vals (I - 1);
      end loop;
      Keys (1) := Key_Tmp;
      Vals (1) := Val_Tmp;
   end Touch;

   function Get (Key : Integer) return Integer is
   begin
      for I in 1 .. Filled loop
         if Keys (I) = Key then
            declare
               Value : constant Integer := Vals (I);
            begin
               Touch (I);
               return Value;
            end;
         end if;
      end loop;
      return -1;
   end Get;

   procedure Put (Key, Value : Integer) is
   begin
      for I in 1 .. Filled loop
         if Keys (I) = Key then
            Vals (I) := Value;
            Touch (I);
            return;
         end if;
      end loop;
      if Filled < Capacity then
         Filled := Filled + 1;
      end if;
      for I in reverse 2 .. Filled loop
         Keys (I) := Keys (I - 1);
         Vals (I) := Vals (I - 1);
      end loop;
      Keys (1) := Key;
      Vals (1) := Value;
   end Put;
begin
   Put (1, 100);
   Put (2, 200);
   Put_Line (Get (1)'Image);
   Put (3, 300);
   Put_Line (Get (2)'Image);
   Put_Line (Get (3)'Image);
end Lru_Cache;
