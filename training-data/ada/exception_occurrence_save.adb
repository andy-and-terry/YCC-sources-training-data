with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;

procedure Exception_Occurrence_Save is
   Saved : Exception_Occurrence;

   procedure Risky is
   begin
      raise Constraint_Error with "bad index";
   end Risky;
begin
   begin
      Risky;
   exception
      when E : others =>
         --  Keep a copy of the occurrence to inspect or re-raise later.
         Save_Occurrence (Saved, E);
         Put_Line ("caught and saved");
   end;

   Put_Line (Exception_Name (Saved) & ": " & Exception_Message (Saved));

   begin
      Reraise_Occurrence (Saved);
   exception
      when Constraint_Error =>
         Put_Line ("re-raised later");
   end;
end Exception_Occurrence_Save;
