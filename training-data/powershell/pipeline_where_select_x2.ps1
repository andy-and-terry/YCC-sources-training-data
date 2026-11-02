Get-Process | Where-Object { $_.WorkingSet -gt 100MB } |
  Sort-Object WorkingSet -Descending | Select-Object -First 3 Name, Id
