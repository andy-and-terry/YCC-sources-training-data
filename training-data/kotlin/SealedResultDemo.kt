sealed interface ApiResult<out T> {
    data class Success<T>(val data: T) : ApiResult<T>
    data class Failure(val error: String) : ApiResult<Nothing>
    object Loading : ApiResult<Nothing>
}

fun <T> describe(result: ApiResult<T>): String = when (result) {
    is ApiResult.Success -> "success: ${result.data}"
    is ApiResult.Failure -> "failure: ${result.error}"
    ApiResult.Loading -> "loading..."
}

fun main() {
    val results: List<ApiResult<Int>> = listOf(
        ApiResult.Success(42),
        ApiResult.Failure("timeout"),
        ApiResult.Loading,
    )
    results.forEach { println(describe(it)) }
}
