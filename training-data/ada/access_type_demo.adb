with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Deallocation;

procedure Access_Type_Demo is
   type Int_Ptr is access Integer;
   procedure Free is new Ada.Unchecked_Deallocation (Integer, Int_Ptr);

   A : Int_Ptr := new Integer'(42);
   B : Int_Ptr := A;
begin
   Put_Line ("A.all =" & Integer'Image (A.all));
   B.all := B.all + 1;
   Put_Line ("after B update, A.all =" & Integer'Image (A.all));
   Free (A);
   if A = null then
      Put_Line ("A is null after Free");
   end if;
end Access_Type_Demo;
