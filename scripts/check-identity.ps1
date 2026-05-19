function Assert-Contains {
    param(
        [string]$Path,
        [string]$Pattern,
        [string]$Message
    )

    $content = Get-Content -Raw -LiteralPath $Path
    if ($content -notmatch $Pattern) {
        Write-Error $Message
        exit 1
    }
}

Assert-Contains "README.md" 'Sett1a/soren-superman' "README.md does not point at the renamed repository."
Assert-Contains "README.zh-CN.md" 'Sett1a/soren-superman' "README.zh-CN.md does not point at the renamed repository."
Assert-Contains "public/app-icons/icon-dark.svg" 'Soren Superman' "Dark app icon is not branded for Soren Superman."
Assert-Contains "public/app-icons/icon-light.svg" 'Soren Superman' "Light app icon is not branded for Soren Superman."
Assert-Contains "branding/soren-superman-icon.svg" 'Soren Superman' "Canonical Soren Superman source icon is missing."

Write-Output "Identity checks passed."
