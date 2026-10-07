<?php

final class Url
{
    public function __construct(
        public readonly string $scheme,
        public readonly ?string $userInfo,
        public readonly string $host,
        public readonly int $port,
        public readonly string $path,
        public readonly array $query,
        public readonly ?string $fragment,
    ) {
    }

    public static function parse(string $url): self
    {
        $re = '~^(?<scheme>[a-z][a-z0-9+.-]*)://(?:(?<user>[^@/]*)@)?(?<host>[^:/?#]+)(?::(?<port>\d+))?(?<path>/[^?#]*)?(?:\?(?<query>[^#]*))?(?:#(?<frag>.*))?$~i';
        if (!preg_match($re, $url, $m)) {
            throw new InvalidArgumentException("invalid URL: $url");
        }
        $scheme = strtolower($m['scheme']);
        $defaults = ['http' => 80, 'https' => 443, 'ftp' => 21];
        parse_str($m['query'] ?? '', $query);
        return new self(
            $scheme,
            ($m['user'] ?? '') !== '' ? $m['user'] : null,
            strtolower($m['host']),
            ($m['port'] ?? '') !== '' ? (int) $m['port'] : ($defaults[$scheme] ?? 0),
            ($m['path'] ?? '') !== '' ? $m['path'] : '/',
            $query,
            isset($m['frag']) ? $m['frag'] : null,
        );
    }
}

foreach (['https://user:pw@Example.com:8443/a/b?x=1&y=hello+world#top', 'http://localhost'] as $u) {
    $p = Url::parse($u);
    echo json_encode(get_object_vars($p)), PHP_EOL;
}
try {
    Url::parse('not a url');
} catch (InvalidArgumentException $e) {
    echo $e->getMessage(), PHP_EOL;
}
