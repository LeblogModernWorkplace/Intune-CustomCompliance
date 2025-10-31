$value = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\CI\State\" | select-object -ExpandProperty "HVCIEnabled" -ErrorAction Stop 

if ($value -eq 1)
{
Write-Output "Compliant"
$HVCIstate = $true
}
else
{
Write-Output "Non Compliant"
$HVCIstate = $false
}

$output = @{
  MemoryIntegrityStatus = $HVCIstate
    }
 return $output | ConvertTo-Json -Compress
