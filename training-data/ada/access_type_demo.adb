with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Deallocation;

procedure Access_Type_Demo is
   type Int_Ptr is access Integer;
   procedure Free is new Ada.Unchecked_Deallocation (Integer, Int_Ptr);
   P : Int_Ptr := new Integer'(42);
   Q : Int_Ptr := P;
begin
   Put_Line ("P.all =" & P.all'Image);
   Q.all := Q.all + 1;
   Put_Line ("P.all after Q update =" & P.all'Image);
   Free (P);
   Put_Line ("P is null: " & Boolean'Image (P = null));
end Access_Type_Demo;
