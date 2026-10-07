with Ada.Text_IO; use Ada.Text_IO;

procedure Composite_Pattern_Demo is
   type Component is interface;
   function Size (C : Component) return Natural is abstract;

   type File_Leaf is new Component with record
      Bytes : Natural;
   end record;
   overriding function Size (C : File_Leaf) return Natural is (C.Bytes);

   type Component_Access is access all Component'Class;
   type Component_Array is array (Positive range <>) of Component_Access;

   type Folder (Count : Positive) is new Component with record
      Children : Component_Array (1 .. Count);
   end record;
   overriding function Size (C : Folder) return Natural is
      Total : Natural := 0;
   begin
      for Child of C.Children loop
         Total := Total + Size (Child.all);
      end loop;
      return Total;
   end Size;

   File_A : aliased File_Leaf := (Bytes => 100);
   File_B : aliased File_Leaf := (Bytes => 250);
   Sub    : aliased Folder := (Count => 1, Children => (1 => File_B'Access));
   Root   : constant Folder := (Count => 2, Children => (File_A'Access, Sub'Access));
begin
   Put_Line ("Total size:" & Size (Root)'Image);
end Composite_Pattern_Demo;
