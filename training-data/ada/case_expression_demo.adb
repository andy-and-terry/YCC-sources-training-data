with Ada.Text_IO; use Ada.Text_IO;

procedure Case_Expression_Demo is
   type Day is (Mon, Tue, Wed, Thu, Fri, Sat, Sun);

   function Kind (D : Day) return String is
     (case D is
         when Mon .. Fri => "weekday",
         when Sat | Sun  => "weekend");
begin
   for D in Day loop
      Put_Line (D'Image & " -> " & Kind (D));
   end loop;
end Case_Expression_Demo;
