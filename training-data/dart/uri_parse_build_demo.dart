void main() {
  final uri = Uri.parse('https://example.com:8080/docs/intro?lang=dart&v=3#top');

  print(uri.scheme);
  print(uri.host);
  print(uri.port);
  print(uri.path);
  print(uri.pathSegments);
  print(uri.query);
  print(uri.queryParameters);
  print(uri.fragment);

  // Build a URI from parts
  final built = Uri(
    scheme: 'https',
    host: 'api.example.org',
    path: '/search',
    queryParameters: {'q': 'hello world', 'page': '2'},
  );
  print(built);

  // Resolve a relative reference
  print(uri.resolve('../guide/start'));

  // Percent-encoding helpers
  print(Uri.encodeComponent('a b&c=d'));
  print(Uri.decodeComponent('a%20b%26c%3Dd'));

  // Immutable copy with changes
  print(uri.replace(path: '/other', queryParameters: {'x': '1'}));
}
