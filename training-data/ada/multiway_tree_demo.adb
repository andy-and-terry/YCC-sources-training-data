with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Indefinite_Multiway_Trees;

--  General (n-ary) tree built with the standard multiway tree container.
procedure Multiway_Tree_Demo is
   package Name_Trees is new Ada.Containers.Indefinite_Multiway_Trees (String);
   use Name_Trees;

   T : Tree;

   procedure Print (C : Cursor; Depth : Natural := 0) is
   begin
      Put_Line ((1 .. 2 * Depth => ' ') & Element (C));
      declare
         Child : Cursor := First_Child (C);
      begin
         while Has_Element (Child) loop
            Print (Child, Depth + 1);
            Next_Sibling (Child);
         end loop;
      end;
   end Print;

   Src, Bin, Lib : Cursor;
begin
   T.Insert_Child (T.Root, No_Element, "project", Src);
   T.Insert_Child (Src, No_Element, "bin", Bin);
   T.Insert_Child (Src, No_Element, "lib", Lib);
   T.Append_Child (Bin, "main");
   T.Append_Child (Lib, "utils");
   T.Append_Child (Lib, "parser");

   Print (Src);
   Put_Line ("Node count:" & Count_Type'Image (T.Node_Count - 1));
   Put_Line ("Leaves under lib:" & Count_Type'Image (Child_Count (Lib)));
end Multiway_Tree_Demo;
