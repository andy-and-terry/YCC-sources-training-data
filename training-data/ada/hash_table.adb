with Ada.Text_IO; use Ada.Text_IO;

procedure Hash_Table is
   Table_Size : constant Integer := 11;
   type Slot_Array is array (0 .. Table_Size - 1) of Integer;
   type Used_Array is array (0 .. Table_Size - 1) of Boolean;

   Keys   : Slot_Array := (others => -1);
   Values : Slot_Array := (others => 0);
   Used   : Used_Array := (others => False);

   function Hash (Key : Integer) return Integer is
   begin
      return Key mod Table_Size;
   end Hash;

   procedure Insert (Key, Value : Integer) is
      Idx : Integer := Hash (Key);
   begin
      for Probe in 0 .. Table_Size - 1 loop
         if not Used (Idx) or else Keys (Idx) = Key then
            Keys (Idx) := Key;
            Values (Idx) := Value;
            Used (Idx) := True;
            return;
         end if;
         Idx := (Idx + 1) mod Table_Size;
      end loop;
   end Insert;

   procedure Lookup (Key : Integer; Value : out Integer; Found : out Boolean) is
      Idx : Integer := Hash (Key);
   begin
      for Probe in 0 .. Table_Size - 1 loop
         if Used (Idx) and then Keys (Idx) = Key then
            Value := Values (Idx);
            Found := True;
            return;
         end if;
         Idx := (Idx + 1) mod Table_Size;
      end loop;
      Value := 0;
      Found := False;
   end Lookup;

   Result : Integer;
   Found  : Boolean;
begin
   Insert (17, 100);
   Insert (28, 200);
   Insert (6, 300);
   Insert (17, 999);

   Lookup (17, Result, Found);
   Put_Line (Found'Image & Result'Image);

   Lookup (6, Result, Found);
   Put_Line (Found'Image & Result'Image);

   Lookup (42, Result, Found);
   Put_Line (Found'Image & Result'Image);
end Hash_Table;
