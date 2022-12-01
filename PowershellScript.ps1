using namespace System.IO
using namespace System.Collections.Generic

$SE2050 = Read-Host "Please enter the software name."

# Replace occurrences of "SE2050" in all files
Get-ChildItem -File -Recurse | ForEach-Object {
    try {
        (Get-Content $_.FullName) -replace 'SE2050', $SE2050 | Set-Content $_.FullName
    } 
    catch {}
}

# Rename files and folders
$stack = [Stack[string]]::new()
$allPaths = [List[string]]::new()


# Get all files and directories containing "SE2050" recursively
Get-ChildItem -Recurse -Directory | ForEach-Object {
    $dirpath = $_.FullName
    $dirname = Split-Path  $dirpath -Leaf
    if ($dirname.Contains("SE2050"))
    {
        Write-Host "dirpath: " $dirpath
        $stack.Push($dirpath)
        $allPaths.Add($dirpath)
    }

    # Write-Host $_.FullName

    foreach ($file in [Directory]::EnumerateFiles($dirpath)) 
    {
        $filename = [Path]::GetFileName($file)
        if ($filename.Contains('SE2050') -and -not $allPaths.Contains($file))
        {
            Write-Host "filepath: " $file
            $stack.Push($file)
            $allPaths.Add($file)
        }
    }
}

# Add root files
Get-ChildItem -File | ForEach-Object {
    if ($_.FullName.Contains("SE2050")) {
        Write-Host "filepath: " $_.FullName
        $stack.Push($_.FullName)
    }
}

# Rename files and folders
while ($stack.Count) {
    $poppedFullName = $stack.Pop()
    $pathExists = (-not ([string]::IsNullOrEmpty($poppedFullName))) -and (Test-Path -Path $poppedFullName)

    $filename = [Path]::GetFileName($poppedFullName)

    if($filename.Contains('SE2050') -and $pathExists)
    {
        $newName = $filename.Replace('SE2050', $SE2050)

        Write-Host "Renaming: " $poppedFullName " to: " $newName

        Rename-Item -LiteralPath $poppedFullName -NewName $newName #-WhatIf
    }
}
