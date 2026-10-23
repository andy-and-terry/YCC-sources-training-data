# A dynamicparam block adds parameters at run time, here only when -Mode is "Archive".
function Invoke-Task {
    [CmdletBinding()]
    param(
        [ValidateSet("Quick", "Archive")]
        [string]$Mode = "Quick"
    )

    dynamicparam {
        $dict = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
        if ($PSBoundParameters["Mode"] -eq "Archive") {
            $attrs = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
            $attrs.Add((New-Object System.Management.Automation.ParameterAttribute))
            $param = New-Object System.Management.Automation.RuntimeDefinedParameter("Destination", [string], $attrs)
            $dict.Add("Destination", $param)
        }
        $dict
    }

    process {
        if ($Mode -eq "Archive") {
            "Archiving to $($PSBoundParameters['Destination'])"
        } else {
            "Quick run"
        }
    }
}

Invoke-Task
Invoke-Task -Mode Archive -Destination "D:\backup"
