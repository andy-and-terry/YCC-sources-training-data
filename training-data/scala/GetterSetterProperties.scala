object GetterSetterProperties {
  class Thermostat {
    private var _target = 20.0
    def target: Double = _target
    def target_=(t: Double): Unit = {
      require(t >= 5 && t <= 30, s"target $t out of range")
      _target = t
    }
  }

  def main(args: Array[String]): Unit = {
    val t = new Thermostat
    println(t.target)
    t.target = 24.5
    println(t.target)
    try t.target = 99
    catch { case e: IllegalArgumentException => println(e.getMessage) }
    println(t.target)
  }
}
