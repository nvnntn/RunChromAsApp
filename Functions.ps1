function get-URL()
{
	$URL = "";
	$Arg = "--app="
	#Validation
	if($($cbURL.text) -eq "" -and $($tbURL.text) -eq "")
	{
	$cbURL.ForeColor = [System.Drawing.Color]::FromArgb(255,255,0,0)
	$tbURL.ForeColor = [System.Drawing.Color]::FromArgb(255,255,0,0)	
	add-content -path $Logfile -value "$(get-date) Input the URL "
	write-host "Input the URL"
	}
	else 
	{	
		#Checking which input is given 
		if($($cbURL.text) -eq "" -or $($cbURL.text) -eq $null){$URL = $($tbURL.text)}
		else
		{
			if($($cbURL.text) -like "* *"){$URL = $($cbURL.text).split(" ")[1]}
			else{$URL = $($cbURL.text)}
		}
		#Addng https:// in URL
		if($url.indexof("http") -lt 0 -and $url.indexof(".") -gt 0){$URL = "https://"+$URL}
		
		#Adding URL in Arg
		if($URL -like "*wynk*") # If wynk changing the window size to 500x165 as its player
		{		
			$URL = "data:text/html,<html><body><script>window.resizeTo(500,165);window.location='"+$URL+"';</script></body></html>"
		}
		if($URL -like "*gaana*") # If gaana changing the window size to 900x165 as its player
		{		
			$URL = "data:text/html,<html><body><script>window.resizeTo(900,165);window.location='"+$URL+"';</script></body></html>"
		}
		$Arg += $URL
		#If Incognito is checked 
		if($($cbInsecure.Checked)){$Arg += " --allow-running-insecure-content"}
		if($($cbIncognito.Checked)){$Arg += " --incognito"}		
	}
	return $arg;	
}