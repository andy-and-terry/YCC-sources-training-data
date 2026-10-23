import groovy.transform.InheritConstructors

@InheritConstructors
class AppException extends RuntimeException {
    String describe() { "AppException: ${message}" }
}

def plain = new AppException()
def withMsg = new AppException('boom')
def withCause = new AppException('wrapped', new IllegalStateException('inner'))

println plain.message
println withMsg.describe()
println withCause.cause.class.simpleName
