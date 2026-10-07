with Ada.Text_IO; use Ada.Text_IO;

procedure Proxy_Pattern_Demo is
   type Image is interface;
   procedure Display (I : Image) is abstract;

   type Real_Image is new Image with record
      Filename : access constant String;
   end record;
   overriding procedure Display (I : Real_Image) is
   begin
      Put_Line ("Rendering " & I.Filename.all);
   end Display;

   -- The proxy defers loading the real image until it is actually needed.
   type Real_Image_Access is access all Real_Image;
   type Image_Proxy is new Image with record
      Filename : access constant String;
      Loaded   : Real_Image_Access := null;
   end record;
   overriding procedure Display (I : Image_Proxy) is
      Proxy : Image_Proxy := I;
   begin
      if Proxy.Loaded = null then
         Put_Line ("Loading " & Proxy.Filename.all & " from disk");
         Proxy.Loaded := new Real_Image'(Filename => Proxy.Filename);
      end if;
      Display (Proxy.Loaded.all);
   end Display;

   Name  : aliased constant String := "photo.png";
   Proxy : Image_Proxy := (Filename => Name'Access, Loaded => null);
begin
   Put_Line ("First call:");
   Display (Proxy);
   Put_Line ("Second call:");
   Display (Proxy);
end Proxy_Pattern_Demo;
