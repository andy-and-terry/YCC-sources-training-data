require 'uri'

def describe(raw)
  u = URI.parse(raw)
  query = u.query ? URI.decode_www_form(u.query).to_h : {}
  puts({ scheme: u.scheme, userinfo: u.userinfo, host: u.host, port: u.port, path: u.path.empty? ? '/' : u.path,
         query: query, fragment: u.fragment }.inspect)
rescue URI::InvalidURIError => e
  puts "invalid: #{e.message}"
end

describe('https://user:pw@example.com:8443/a/b?x=1&y=hello%20world#top')
describe('http://localhost')
describe('http://exa mple.com')
puts URI.join('https://example.com/docs/guide/', '../api?v=2')
