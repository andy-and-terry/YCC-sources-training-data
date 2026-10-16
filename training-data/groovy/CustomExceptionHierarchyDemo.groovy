class AppException extends RuntimeException {
    AppException(String msg, Throwable cause = null) { super(msg, cause) }
}

class NotFoundException extends AppException {
    final String id
    NotFoundException(String id) {
        super("not found: $id")
        this.id = id
    }
}

def find(String id) {
    if (id != 'a') throw new NotFoundException(id)
    'found'
}

try {
    println find('a')
    find('zzz')
} catch (NotFoundException e) {
    println "${e.message} (id=${e.id})"
} catch (AppException e) {
    println 'other'
}

try {
    try { find('x') }
    catch (AppException e) { throw new AppException('wrapped', e) }
} catch (e) {
    println "${e.message} <- ${e.cause.message}"
}
