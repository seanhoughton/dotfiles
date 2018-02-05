foreach($line in Get-Content "$PSScriptRoot\..\Scoopfile") {
	scoop install $line
}