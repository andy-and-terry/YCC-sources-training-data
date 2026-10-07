with Ada.Text_IO; use Ada.Text_IO;

procedure Access_To_Subprogram_Demo is
   type Binary_Op is access function (A, B : Integer) return Integer;

   function Add (A, B : Integer) return Integer is (A + B);
   function Mul (A, B : Integer) return Integer is (A * B);

   type Op_Entry is record
      Name : String (1 .. 3);
      Op   : Binary_Op;
   end record;

   Table : constant array (1 .. 2) of Op_Entry :=
     (("add", Add'Access), ("mul", Mul'Access));
begin
   for E of Table loop
      Put_Line (E.Name & " ->" & E.Op (6, 7)'Image);
   end loop;
end Access_To_Subprogram_Demo;
