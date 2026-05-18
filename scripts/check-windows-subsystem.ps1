param(
    [Parameter(Mandatory = $true)]
    [string]$ExePath
)

$resolvedPath = Resolve-Path -LiteralPath $ExePath -ErrorAction Stop
$bytes = [System.IO.File]::ReadAllBytes($resolvedPath)

if ($bytes.Length -lt 0x40) {
    Write-Error "File is too small to be a valid PE executable."
    exit 1
}

$peOffset = [System.BitConverter]::ToInt32($bytes, 0x3C)
if ($peOffset -lt 0 -or ($peOffset + 0x5E) -ge $bytes.Length) {
    Write-Error "Invalid PE header offset."
    exit 1
}

$signature = [System.Text.Encoding]::ASCII.GetString($bytes, $peOffset, 4)
if ($signature -ne "PE`0`0") {
    Write-Error "Missing PE signature."
    exit 1
}

$optionalHeaderOffset = $peOffset + 4 + 20
$subsystemOffset = $optionalHeaderOffset + 68
$subsystem = [System.BitConverter]::ToUInt16($bytes, $subsystemOffset)

Write-Output "Subsystem value: $subsystem"

if ($subsystem -ne 2) {
    Write-Error "Expected Windows GUI subsystem (2), but found $subsystem."
    exit 1
}

Write-Output "Windows GUI subsystem verified."
