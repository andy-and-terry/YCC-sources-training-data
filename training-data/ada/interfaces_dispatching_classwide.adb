with Ada.Text_IO; use Ada.Text_IO;

procedure Interfaces_Dispatching_Classwide is
   type Speaker is interface;
   function Speak (S : Speaker) return String is abstract;

   type Dog is new Speaker with null record;
   overriding function Speak (D : Dog) return String is ("woof");
   type Cat is new Speaker with null record;
   overriding function Speak (C : Cat) return String is ("meow");

   procedure Announce (S : Speaker'Class) is
   begin
      Put_Line (Speak (S));
   end Announce;

   D : Dog;
   C : Cat;
begin
   Announce (D);
   Announce (C);
   declare
      type Speaker_Access is access all Speaker'Class;
      List : constant array (1 .. 2) of Speaker_Access := (new Dog, new Cat);
   begin
      for P of List loop Announce (P.all); end loop;
   end;
end Interfaces_Dispatching_Classwide;
