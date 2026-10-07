object BucketSort {
  def bucketSort(arr: Array[Double], bucketCount: Int = 5): Array[Double] = {
    if (arr.isEmpty) return arr

    val minVal = arr.min
    val maxVal = arr.max
    val range = math.max(maxVal - minVal, 1e-9)
    val buckets = Array.fill(bucketCount)(scala.collection.mutable.ListBuffer[Double]())

    for (v <- arr) {
      val idx = math.min(bucketCount - 1, (((v - minVal) / range) * bucketCount).toInt)
      buckets(idx) += v
    }

    buckets.flatMap(_.sorted)
  }

  def main(args: Array[String]): Unit = {
    println(bucketSort(Array(0.42, 0.32, 0.23, 0.52, 0.25, 0.47, 0.51)).mkString(","))
  }
}
