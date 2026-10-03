with Ada.Text_IO; use Ada.Text_IO;

procedure Adapter_Pattern_Demo is
   -- Target interface the client code expects.
   type Modern_Printer is interface;
   procedure Print (P : Modern_Printer; Text : String) is abstract;

   -- Legacy class with an incompatible interface.
   type Legacy_Printer is tagged null record;
   procedure Old_Print (P : Legacy_Printer; Text : String) is
   begin
      Put_Line ("[legacy] " & Text);
   end Old_Print;

   -- Adapter makes Legacy_Printer conform to Modern_Printer.
   type Legacy_Adapter is new Modern_Printer with record
      Wrapped : Legacy_Printer;
   end record;
   overriding procedure Print (P : Legacy_Adapter; Text : String) is
   begin
      Old_Print (P.Wrapped, Text);
   end Print;

   Adapter : constant Legacy_Adapter := (Wrapped => (null record));
begin
   Print (Adapter, "Hello via adapter");
end Adapter_Pattern_Demo;
