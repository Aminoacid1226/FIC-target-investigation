#!/usr/bin/env powershell
# install.ps1 · Target Investigation Skill Installer
# Usage: .\install.ps1 [TRAE|CURSOR|CLAUDE|CLINE|ALL]
# Run from anywhere — auto-detects repo root via .git or this script's location

param(
    [ValidateSet("TRAE", "CURSOR", "CLAUDE", "CLINE", "ALL")]
    [string]$Target = "ALL"
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillName = "target-investigation"

Write-Host ""
Write-Host "========== Target Investigation Skill Installer ==========" -ForegroundColor Cyan
Write-Host ""

# ── Detect repo root ──
if (-not (Test-Path "$RepoRoot\SKILL.md")) {
    Write-Host "⚠️  Cannot detect repo root. Run this script from the target-investigation repo." -ForegroundColor Yellow
    $RepoRoot = Read-Host "Enter path to target-investigation repo"
}

# ── 1. TRAE ──
function Install-Trae {
    $skillDir = Join-Path $RepoRoot "platforms\trae"
    $globalDir = Join-Path $env:USERPROFILE ".trae-cn\skills\$SkillName"
    $projectDir = Join-Path (Get-Location) ".trae\skills\$SkillName"

    # Global install (recommended)
    if (Test-Path $globalDir) { Remove-Item $globalDir -Recurse -Force }
    New-Item -ItemType Directory -Force -Path $globalDir | Out-Null

    Copy-Item (Join-Path $skillDir "*") $globalDir -Recurse -Force
    if (Test-Path (Join-Path $RepoRoot "domains")) {
        Copy-Item (Join-Path $RepoRoot "domains") $globalDir -Recurse -Force
    }
    Write-Host "  ✅ TRAE global skill installed → $globalDir" -ForegroundColor Green

    # Also copy project format (for repo-committed skills)
    Write-Host "  💡 For repo-committed skill, copy .trae/skills/ folder into your project root" -ForegroundColor DarkGray
}

# ── 2. Cursor ──
function Install-Cursor {
    $cursorFile = Join-Path $RepoRoot "platforms\cursor\target-investigation.mdc"
    $globalDir = Join-Path $env:USERPROFILE ".cursor\rules"
    $projectDir = Join-Path (Get-Location) ".cursor\rules"

    # Global
    New-Item -ItemType Directory -Force -Path $globalDir | Out-Null
    Copy-Item $cursorFile $globalDir -Force
    Write-Host "  ✅ Cursor global rule installed → $globalDir\target-investigation.mdc" -ForegroundColor Green

    # Domains (Cursor supports @file references in rules)
    $domainsDir = Join-Path $globalDir "target-investigation-domains"
    New-Item -ItemType Directory -Force -Path $domainsDir | Out-Null
    if (Test-Path (Join-Path $RepoRoot "domains")) {
        Copy-Item (Join-Path $RepoRoot "domains\*.md") $domainsDir -Force
    }
}

# ── 3. Claude Desktop ──
function Install-ClaudeDesktop {
    $claudeFile = Join-Path $RepoRoot "platforms\claude-desktop\CLAUDE.md"
    $targetFile = Join-Path $env:USERPROFILE "CLAUDE.md"

    # Append if exists, else create
    if (Test-Path $targetFile) {
        Write-Host "  ⚠️  ~/CLAUDE.md already exists. Appending skill content." -ForegroundColor Yellow
        Add-Content -Path $targetFile -Value "`n`n---`n`n"
        Add-Content -Path $targetFile -Value (Get-Content $claudeFile -Raw)
        Write-Host "  ✅ Appended to → $targetFile" -ForegroundColor Green
    } else {
        Copy-Item $claudeFile $targetFile -Force
        Write-Host "  ✅ CLAUDE.md installed → $targetFile" -ForegroundColor Green
    }
}

# ── 4. Cline ──
function Install-Cline {
    $clineFile = Join-Path $RepoRoot "platforms\cline\target-investigation.md"
    $globalDir = Join-Path $env:USERPROFILE ".cline\custom-prompts"

    New-Item -ItemType Directory -Force -Path $globalDir | Out-Null
    Copy-Item $clineFile $globalDir -Force
    if (Test-Path (Join-Path $RepoRoot "domains")) {
        Copy-Item (Join-Path $RepoRoot "domains") $globalDir -Recurse -Force
    }
    Write-Host "  ✅ Cline custom prompt installed → $globalDir" -ForegroundColor Green
}

# ── Run ──
switch ($Target) {
    "TRAE" { Write-Host "Installing for TRAE..." -ForegroundColor Magenta; Install-Trae }
    "CURSOR" { Write-Host "Installing for Cursor..." -ForegroundColor Magenta; Install-Cursor }
    "CLAUDE" { Write-Host "Installing for Claude Desktop..." -ForegroundColor Magenta; Install-ClaudeDesktop }
    "CLINE" { Write-Host "Installing for Cline..." -ForegroundColor Magenta; Install-Cline }
    "ALL" {
        Write-Host "Installing for ALL platforms..." -ForegroundColor Magenta
        Install-Trae
        Install-Cursor
        Install-ClaudeDesktop
        Install-Cline
    }
}

Write-Host ""
Write-Host "🎉 Done! Restart your agent to load the skill." -ForegroundColor Green
Write-Host ""
