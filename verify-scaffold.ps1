#Requires -Version 7.0
$ErrorActionPreference = 'Stop'
$repoRoot = $PSScriptRoot
$runtime = Join-Path $repoRoot '.scaffold-runtime'
$cache = Join-Path $runtime 'uv-cache'
$npmCache = Join-Path $runtime 'npm-cache'
New-Item -ItemType Directory -Path $runtime, $cache, $npmCache -Force | Out-Null
$env:UV_CACHE_DIR = $cache
$env:TEMP = $runtime
$env:TMP = $runtime
$env:UV_NO_PROGRESS = '1'
$env:PYTHONIOENCODING = 'utf-8'
$env:npm_config_cache = $npmCache
Push-Location -LiteralPath $repoRoot
try {
    uv sync --frozen
    if ($LASTEXITCODE -ne 0) { throw 'uv sync --frozen failed' }
    uv run --frozen python -c "import fastapi, pydantic, uvicorn, config; print(fastapi.__version__, pydantic.VERSION, uvicorn.__version__)"
    if ($LASTEXITCODE -ne 0) { throw 'uv import check failed' }
    npm ci --ignore-scripts
    if ($LASTEXITCODE -ne 0) { throw 'npm ci failed' }
    node --check .hooks.mjs
    if ($LASTEXITCODE -ne 0) { throw 'node --check .hooks.mjs failed' }
    Write-Output 'SCAFFOLD_CHECKS_PASSED=4'
} finally {
    Pop-Location
}