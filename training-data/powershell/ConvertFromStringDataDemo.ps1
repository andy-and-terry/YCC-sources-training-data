$text = @'
# simple key=value settings
Name = Widget
Version = 2
Path = C:\Program Files\Widget
'@

$settings = ConvertFrom-StringData -StringData $text

$settings.GetType().Name
foreach ($key in $settings.Keys | Sort-Object) {
    "{0} -> {1}" -f $key, $settings[$key]
}

$template = ConvertFrom-StringData -StringData @'
greeting = Hello, {0}!
farewell = Goodbye, {0}.
'@

$template.greeting -f 'Alice'
$template.farewell -f 'Bob'
