with Ada.Text_IO; use Ada.Text_IO;

procedure Tagged_Demo is
   type Animal is tagged null record;
   procedure Speak (A : Animal) is begin Put_Line ("..."); end Speak;
   type Dog is new Animal with null record;
   overriding procedure Speak (D : Dog) is begin Put_Line ("Woof"); end Speak;
   procedure Call (A : Animal'Class) is begin Speak (A); end Call;
begin
   Call (Animal'(null record));
   Call (Dog'(null record));
end Tagged_Demo;
