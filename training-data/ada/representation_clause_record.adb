with Ada.Text_IO; use Ada.Text_IO;

procedure Representation_Clause_Record is
   type Mode is (Off, Idle, Run, Fault);
   for Mode use (Off => 0, Idle => 1, Run => 2, Fault => 7);
   for Mode'Size use 3;

   type Status is record
      M     : Mode;
      Ready : Boolean;
      Level : Integer range 0 .. 15;
   end record;

   for Status use record
      M     at 0 range 0 .. 2;
      Ready at 0 range 3 .. 3;
      Level at 0 range 4 .. 7;
   end record;
   for Status'Size use 8;

   S : constant Status := (M => Run, Ready => True, Level => 9);
begin
   Put_Line ("Size in bits:" & Status'Size'Image);
   Put_Line ("Mode code:" & Integer'Image (Mode'Enum_Rep (S.M)));
   Put_Line ("Level:" & S.Level'Image);
end Representation_Clause_Record;
