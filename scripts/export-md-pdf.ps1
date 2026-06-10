<#
.SYNOPSIS
    Export a Markdown file to an A4 print-ready PDF using md-to-pdf.

.PARAMETER MdFile
    Path to the source Markdown file. Required.

.PARAMETER CssFile
    Path to the print stylesheet. Defaults to styles/print.css next to the repo root.

.PARAMETER OutputBase
    Base filename (without extension) for the generated PDFs.
    Defaults to the Markdown file's base name.

.EXAMPLE
    ./scripts/export-md-pdf.ps1 -MdFile "resumes/resume.en.md"

.EXAMPLE
    ./scripts/export-md-pdf.ps1 -MdFile "resumes/resume.cn.md" -OutputBase "Zhang_San_CV"
#>
param(
    [Parameter(Mandatory = $true)]
    [string]$MdFile,

    [string]$CssFile = "",

    [string]$OutputBase = ""
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($CssFile)) {
    $scriptDir = Split-Path -Path $MyInvocation.MyCommand.Path -Parent
    $repoRoot = Split-Path -Path $scriptDir -Parent
    $CssFile = Join-Path -Path $repoRoot -ChildPath "styles\print.css"
}

$mdPath = Resolve-Path -Path $MdFile
$cssPath = Resolve-Path -Path $CssFile

$mdFull = $mdPath.Path
$cssFull = $cssPath.Path

$mdDir = Split-Path -Path $mdFull -Parent
$mdName = [System.IO.Path]::GetFileNameWithoutExtension($mdFull)

if ([string]::IsNullOrWhiteSpace($OutputBase)) {
    $OutputBase = $mdName
}

$tmpPdf = Join-Path -Path $mdDir -ChildPath ($mdName + ".pdf")
$outPdf = Join-Path -Path $mdDir -ChildPath ($OutputBase + ".pdf")
$outPrintPdf = Join-Path -Path $mdDir -ChildPath ($OutputBase + ".print.pdf")

npx --yes md-to-pdf "$mdFull" --stylesheet "$cssFull" --page-media-type print

if (-not (Test-Path -Path $tmpPdf)) {
    throw "PDF generation failed: $tmpPdf was not created."
}

if ($tmpPdf -ne $outPdf) {
    Copy-Item -Path $tmpPdf -Destination $outPdf -Force
}

Copy-Item -Path $outPdf -Destination $outPrintPdf -Force

Write-Host "Generated: $outPdf"
Write-Host "Generated: $outPrintPdf"
