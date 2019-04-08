$getDomain = [System.Directoryservices.ActiveDirectory.Domain]::GetCurrentDomain()

$getDomain | ForEach-Object  {$_.DomainControllers} | ForEach-Object {

	$hostEntry = [Systen.Net.Dns]::GetHostByName($_.Name)
	New-Object -TypeName PSObject -Property @{
	Name = $_.Name
	IPAddress = $hostEntry.AddressList[0].IPAdddressToString
	}

} | Export-CSV "" -NoTypeInformation -Encoding UTF8
