with Ada.Text_IO; use Ada.Text_IO;

procedure Insert_Interval is
   type Interval is record
      Lo, Hi : Integer;
   end record;
   Ivs    : constant array (1 .. 2) of Interval := ((1, 3), (6, 9));
   N      : Interval := (2, 5);
   Placed : Boolean := False;

   procedure Show (I : Interval) is
   begin
      Put ("[" & Integer'Image (I.Lo) & "," & Integer'Image (I.Hi) & " ] ");
   end Show;
begin
   for I of Ivs loop
      if I.Hi < N.Lo then
         Show (I);
      elsif I.Lo > N.Hi then
         if not Placed then
            Show (N);
            Placed := True;
         end if;
         Show (I);
      else
         N.Lo := Integer'Min (N.Lo, I.Lo);
         N.Hi := Integer'Max (N.Hi, I.Hi);
      end if;
   end loop;
   if not Placed then
      Show (N);
   end if;
   New_Line; -- [ 1, 5 ] [ 6, 9 ]
end Insert_Interval;
