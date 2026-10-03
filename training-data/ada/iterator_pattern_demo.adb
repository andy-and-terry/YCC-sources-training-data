with Ada.Text_IO; use Ada.Text_IO;

procedure Iterator_Pattern_Demo is
   type Int_Array is array (Positive range <>) of Integer;

   type Iterator (Data : access constant Int_Array) is record
      Index : Positive := 1;
   end record;

   function Has_Next (It : Iterator) return Boolean is
     (It.Index <= It.Data'Last);

   function Next (It : in out Iterator) return Integer is
      Value : constant Integer := It.Data (It.Index);
   begin
      It.Index := It.Index + 1;
      return Value;
   end Next;

   Values : aliased constant Int_Array := (10, 20, 30, 40);
   It     : Iterator (Values'Access);
begin
   while Has_Next (It) loop
      Put (Next (It)'Image);
   end loop;
   New_Line;
end Iterator_Pattern_Demo;
