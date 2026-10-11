with Ada.Text_IO; use Ada.Text_IO;
with Ada.Tags;

procedure Class_Wide_Dispatch_Array is
   type Animal is tagged null record;
   function Sound (A : Animal) return String is ("...");

   type Dog is new Animal with null record;
   overriding function Sound (D : Dog) return String is ("Woof");

   type Cat is new Animal with null record;
   overriding function Sound (C : Cat) return String is ("Meow");

   type Animal_Access is access all Animal'Class;

   D : aliased Dog;
   C : aliased Cat;
   A : aliased Animal;
   Zoo : constant array (1 .. 3) of Animal_Access :=
     (A'Access, D'Access, C'Access);
begin
   for Z of Zoo loop
      Put_Line (Ada.Tags.Expanded_Name (Z.all'Tag) & " says " & Sound (Z.all));
   end loop;
end Class_Wide_Dispatch_Array;
