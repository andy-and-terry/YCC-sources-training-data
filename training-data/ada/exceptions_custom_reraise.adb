with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;

procedure Exceptions_Custom_Reraise is
   Invalid_Input : exception;
   Too_Big : exception;
   type Int_List is array (Positive range <>) of Integer;
   Inputs : constant Int_List := (5, -1, 500);

   procedure Check (N : Integer) is
   begin
      if N < 0 then raise Invalid_Input with "negative: " & Integer'Image (N);
      elsif N > 100 then raise Too_Big;
      end if;
   end Check;
begin
   for V of Inputs loop
      begin
         Check (V);
         Put_Line ("ok" & Integer'Image (V));
      exception
         when E : Invalid_Input => Put_Line ("invalid: " & Exception_Message (E));
         when Too_Big => Put_Line ("too big");
      end;
   end loop;
   begin
      begin
         declare X : Integer := Integer'Last; begin X := X + 1; end;
      exception
         when Constraint_Error => Put_Line ("inner"); raise;
      end;
   exception
      when E : others => Put_Line ("outer " & Exception_Name (E));
   end;
end Exceptions_Custom_Reraise;
