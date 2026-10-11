with Ada.Text_IO; use Ada.Text_IO;

procedure Aliased_Object_Access is
   type Int_Ptr is access all Integer;

   X : aliased Integer := 10;
   P : constant Int_Ptr := X'Access;
begin
   P.all := P.all + 5;
   Put_Line ("X =" & X'Image);
   Put_Line ("Same object: " & Boolean'Image (P.all = X));
end Aliased_Object_Access;
