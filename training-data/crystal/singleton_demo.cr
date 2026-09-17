class AppConfig
  @@instance : AppConfig?

  property settings : Hash(String, String)

  private def initialize
    @settings = {} of String => String
  end

  def self.instance : AppConfig
    @@instance ||= new
  end
end

AppConfig.instance.settings["theme"] = "dark"
puts AppConfig.instance.settings["theme"]
puts AppConfig.instance.same?(AppConfig.instance)
