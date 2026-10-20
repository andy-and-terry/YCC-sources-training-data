with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Ordered_Maps;
with Ada.Containers.Ordered_Sets;
with Ada.Containers.Indefinite_Vectors;

procedure Containers_Ordered_Sets_Maps is
   package Str_Int_Maps is new Ada.Containers.Ordered_Maps (String, Integer);
   package Int_Sets is new Ada.Containers.Ordered_Sets (Integer);
   package Str_Vectors is new Ada.Containers.Indefinite_Vectors (Positive, String);
   M : Str_Int_Maps.Map;
   S : Int_Sets.Set;
   V : Str_Vectors.Vector;
begin
   M.Insert ("b", 2); M.Insert ("a", 1); M.Include ("b", 20);
   for C in M.Iterate loop Put (Str_Int_Maps.Key (C) & "=" & Integer'Image (Str_Int_Maps.Element (C)) & " "); end loop;
   New_Line;
   S.Insert (5); S.Insert (1); S.Insert (5); S.Insert (3);
   Put_Line (Count_Type'Image (S.Length) & Integer'Image (S.First_Element) & Integer'Image (S.Last_Element));
   V.Append ("x"); V.Append ("yy"); V.Prepend ("w");
   for E of V loop Put (E & ","); end loop;
   New_Line;
   Put_Line (Boolean'Image (M.Contains ("a")) & Boolean'Image (S.Contains (4)));
end Containers_Ordered_Sets_Maps;
