$words = 'apple','avocado','banana','blueberry','cherry'
$words | Group-Object { $_[0] } | ForEach-Object { "$($_.Name): $($_.Count)" }
$words | Measure-Object -Property Length -Average -Maximum | Select-Object Average, Maximum
