abstract class SupportHandler(next: Option[SupportHandler]) {
  def canHandle(level: Int): Boolean
  def handle(level: Int, issue: String): Unit = {
    if (canHandle(level)) {
      println(s"${getClass.getSimpleName} handled: $issue")
    } else {
      next match {
        case Some(handler) => handler.handle(level, issue)
        case None => println(s"No handler available for: $issue")
      }
    }
  }
}

class TierOneSupport(next: Option[SupportHandler]) extends SupportHandler(next) {
  def canHandle(level: Int): Boolean = level <= 1
}

class TierTwoSupport(next: Option[SupportHandler]) extends SupportHandler(next) {
  def canHandle(level: Int): Boolean = level <= 2
}

class TierThreeSupport(next: Option[SupportHandler]) extends SupportHandler(next) {
  def canHandle(level: Int): Boolean = level <= 3
}

object ChainOfResponsibilityPatternDemo {
  def main(args: Array[String]): Unit = {
    val tier3 = new TierThreeSupport(None)
    val tier2 = new TierTwoSupport(Some(tier3))
    val tier1 = new TierOneSupport(Some(tier2))

    tier1.handle(1, "password reset")
    tier1.handle(3, "database outage")
    tier1.handle(5, "unknown catastrophe")
  }
}
