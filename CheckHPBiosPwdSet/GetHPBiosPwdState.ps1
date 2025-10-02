<#
   .SYNOPSIS
 Check HP Bios Password is Set

#>

# Required Value

$ExpectedStatus = "1"


# Get the HP Bios password statut with WMI query
$CurrentStatus = Get-wmiobject -namespace root\hp\instrumentedbios -class HP_BiosSetting | Where-object name -EQ "Setup Password" | Select -expandProperty IsSet

# Check the result and return the statut
$ReturnStatus = if ($ExpectedStatus -ne $CurrentStatus) {
    $false
    Write-Host "Bios Pwd not OK"
} else {
    $true
    Write-Host "Bios Pwd OK"
}

# Send the output for Json check
$output = @{
    HPBiosBiospwdStatus = $ReturnStatus
    }
 return $output | ConvertTo-Json -Compress
