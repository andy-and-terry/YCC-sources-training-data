with Ada.Text_IO; use Ada.Text_IO;

procedure Case_Statement_Demo is
   type Int_Array is array (Positive range <>) of Integer;

   function Category (Code : Integer) return String is
   begin
      case Code is
         when 200 .. 299 => return "success";
         when 300 .. 399 => return "redirect";
         when 400 .. 499 => return "client error";
         when 500 .. 599 => return "server error";
         when others => return "unknown";
      end case;
   end Category;
begin
   for Code of Int_Array'(200, 301, 404, 503, 999) loop
      Put_Line (Code'Image & ": " & Category (Code));
   end loop;
end Case_Statement_Demo;
