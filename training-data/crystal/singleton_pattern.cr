class AppConfig
  @@instance : AppConfig?

  def self.instance : AppConfig
    @@instance ||= new
  end

  getter settings : Hash(String, String)

  private def initialize
    @settings = {"env" => "production"}
  end

  def set(key : String, value : String)
    @settings[key] = value
  end
end

AppConfig.instance.set("region", "us-east")
puts AppConfig.instance.settings["region"]
puts AppConfig.instance.same?(AppConfig.instance)
