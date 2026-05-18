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

function Assert-NotContains {
    param(
        [string]$Path,
        [string]$Pattern,
        [string]$Message
    )

    $content = Get-Content -Raw -LiteralPath $Path
    if ($content -match $Pattern) {
        Write-Error $Message
        exit 1
    }
}

Assert-Contains "package.json" '"name"\s*:\s*"soren-superman"' "package.json is not branded as soren-superman."
Assert-Contains "src-tauri/tauri.conf.json" '"productName"\s*:\s*"Soren Superman"' "tauri.conf.json does not use Soren Superman as the product name."
Assert-Contains "src-tauri/tauri.conf.json" '"identifier"\s*:\s*"com\.sett1a\.sorensuperman"' "tauri.conf.json does not use the expected branded identifier."
Assert-Contains "src-tauri/Cargo.toml" 'name\s*=\s*"soren-superman"' "Cargo.toml does not expose the branded binary name."
Assert-Contains "src-tauri/src/lib.rs" 'TERM_PROGRAM", "Soren Superman"' "Rust terminal metadata still uses the old app name."
Assert-Contains "src/WorkspaceContext.tsx" 'soren-superman\.recent-projects' "Recent project storage key was not rebranded."
Assert-Contains "src/WorkspaceGate.tsx" 'soren-superman\.create-project-location' "Create-project storage key was not rebranded."
Assert-Contains "src/WorkspaceGate.tsx" 'Welcome to Soren Superman' "Workspace gate still shows the old welcome title."
Assert-Contains "README.md" 'Soren Superman' "README.md does not use the branded app name."
Assert-Contains "README.zh-CN.md" 'Soren Superman' "README.zh-CN.md does not use the branded app name."

Assert-NotContains "src/ChangesPanel.tsx" 'title:\s*"Supremum"' "ChangesPanel still uses the old app title."
Assert-NotContains "src/FileTree.tsx" 'title:\s*"Supremum"' "FileTree still uses the old app title."
Assert-NotContains "src/MainLayout.tsx" 'title:\s*"Supremum"' "MainLayout still uses the old app title."
Assert-NotContains "src/WorkspaceGate.tsx" 'Welcome to Supremum' "Workspace gate still uses the old app name."
Assert-NotContains "src-tauri/tauri.conf.json" '"productName"\s*:\s*"Supremum"' "tauri.conf.json still contains the old product name."

Write-Output "Branding checks passed."
