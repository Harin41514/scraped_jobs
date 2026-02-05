$ErrorActionPreference = "Stop"

Set-Location "E:\jobspy_scraper\scraped_jobs"

# Sync first (safe if you ever push from another machine)
git pull --rebase

git add -A

# Commit only if there are changes
$changes = git status --porcelain
if ([string]::IsNullOrWhiteSpace($changes)) {
  exit 0
}

$ts = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "Daily jobs update - $ts"

git push
