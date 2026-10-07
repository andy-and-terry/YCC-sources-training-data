with Ada.Text_IO; use Ada.Text_IO;

procedure Bloom_Filter is
   Size : constant := 32;
   type Bit_Array is array (0 .. Size - 1) of Boolean;
   Filter : Bit_Array := (others => False);

   function Hash1 (S : String) return Natural is
      Total : Natural := 0;
   begin
      for Ch of S loop
         Total := Total + Character'Pos (Ch);
      end loop;
      return Total mod Size;
   end Hash1;

   function Hash2 (S : String) return Natural is
      Total : Natural := 7;
   begin
      for Ch of S loop
         Total := Total * 31 + Character'Pos (Ch);
      end loop;
      return Total mod Size;
   end Hash2;

   procedure Add (S : String) is
   begin
      Filter (Hash1 (S)) := True;
      Filter (Hash2 (S)) := True;
   end Add;

   function Might_Contain (S : String) return Boolean is
     (Filter (Hash1 (S)) and Filter (Hash2 (S)));
begin
   Add ("apple");
   Add ("banana");

   Put_Line ("apple: " & Might_Contain ("apple")'Image);
   Put_Line ("banana: " & Might_Contain ("banana")'Image);
   Put_Line ("cherry: " & Might_Contain ("cherry")'Image);
end Bloom_Filter;
