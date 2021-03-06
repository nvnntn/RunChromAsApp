#Generated Form Function
function GenerateForm {
########################################################################
# Generated On: 7/14/2016 3:23 PM
# Generated By: NS
# Added Function to add URL in URL list
# Added label to show Website name or custom label
########################################################################

#region Import the Assemblies
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
#endregion

#region Generated Form Objects
$form1 = New-Object System.Windows.Forms.Form
$btAddURL = New-Object System.Windows.Forms.Button
$cbIncognito = New-Object System.Windows.Forms.CheckBox
$btOpen = New-Object System.Windows.Forms.Button
$tbURL = New-Object System.Windows.Forms.TextBox
$cbURL = New-Object System.Windows.Forms.ComboBox
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
#endregion Generated Form Objects

#Some variables 
$Chromepath = "C:\Program Files (x86)\Google\Chrome\Application\Chrome.exe"
$URLList = ".\list.txt"
$Logfile = ".\chromelog.log"

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
		$Arg += $URL
		#If Incognito is checked 
		if($($cbIncognito.Checked)){$Arg += " --incognito"}
		
		write-host "$Arg"
		add-content -path $Logfile -value "$(get-date) $arg"
	}
	return $arg;	
}
if(!(test-path $Chromepath) -or !(test-path $URLList))
{
add-content -path $Logfile -value "$(get-date) either Chrome : $Chromepath or List  : $URLList  missing"
exit;
}

#----------------------------------------------
#Generated Event Script Blocks
#----------------------------------------------
#Provide Custom Code for events specified in PrimalForms.
$handler_checkBox1_CheckedChanged= 
{
#TODO: Place custom script here

}

$btOpen_OnClick= 
{
$Arg = get-URL
"URL $arg"
#Launching Chrome
start-process -FilePath $Chromepath -ArgumentList $Arg	
}

$handler_tbURL_TextChanged= 
{


}

$handler_btAddURL_Click= 
{
	if($tbURL.text -ne "")
	{
	add-content -path $URLList -value "$($tbURL.text)"
	$cbURL.Items.Add($($tbURL.text))|Out-Null
	}

}

$OnLoadForm_StateCorrection=
{
	#Correct the initial state of the form to prevent the .Net maximized form issue
	$form1.WindowState = $InitialFormWindowState
}

#----------------------------------------------
#region Generated Form Code
#$form1.BackgroundImage = [System.Drawing.Image]::FromFile('chrome.png')
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 198
$System_Drawing_Size.Width = 255
$form1.ClientSize = $System_Drawing_Size
$form1.DataBindings.DefaultDataSourceUpdateMode = 0
$form1.Name = "form1"
$form1.Text = "Launch Chrome"


$btAddURL.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 129
$System_Drawing_Point.Y = 91
$btAddURL.Location = $System_Drawing_Point
$btAddURL.Name = "btAddURL"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$btAddURL.Size = $System_Drawing_Size
$btAddURL.TabIndex = 4
$btAddURL.Text = "Add URL"
$btAddURL.UseVisualStyleBackColor = $True
$btAddURL.add_Click($handler_btAddURL_Click)

$form1.Controls.Add($btAddURL)


$cbIncognito.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 23
$System_Drawing_Point.Y = 91
$cbIncognito.Location = $System_Drawing_Point
$cbIncognito.Name = "cbIncognito"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 80
$cbIncognito.Size = $System_Drawing_Size
$cbIncognito.TabIndex = 2
$cbIncognito.Text = "Incognito"
$cbIncognito.UseVisualStyleBackColor = $True
$cbIncognito.Checked = $True
$cbIncognito.add_CheckedChanged($handler_checkBox1_CheckedChanged)

$form1.Controls.Add($cbIncognito)


$btOpen.DataBindings.DefaultDataSourceUpdateMode = 0
$btOpen.Font = New-Object System.Drawing.Font("Comic Sans MS",12,1,3,0)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 23
$System_Drawing_Point.Y = 134
$btOpen.Location = $System_Drawing_Point
$btOpen.Name = "btOpen"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 43
$System_Drawing_Size.Width = 206
$btOpen.Size = $System_Drawing_Size
$btOpen.TabIndex = 3
$btOpen.Text = "Launch"
$btOpen.UseVisualStyleBackColor = $True
$btOpen.add_Click($btOpen_OnClick)

$form1.Controls.Add($btOpen)

$tbURL.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 23
$System_Drawing_Point.Y = 55
$tbURL.Location = $System_Drawing_Point
$tbURL.Name = "tbURL"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 206
$tbURL.Size = $System_Drawing_Size
$tbURL.TabIndex = 1
$tbURL.add_TextChanged($handler_tbURL_TextChanged)

$form1.Controls.Add($tbURL)

$cbURL.DataBindings.DefaultDataSourceUpdateMode = 0
$cbURL.DropDownStyle = 2
$cbURL.FormattingEnabled = $True
#Adding items in drop down  
gc $URLList | foreach-object { 
	$cbURL.Items.Add($_)|Out-Null
	}


$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 23
$System_Drawing_Point.Y = 12
$cbURL.Location = $System_Drawing_Point
$cbURL.Name = "cbURL"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 21
$System_Drawing_Size.Width = 206
$cbURL.Size = $System_Drawing_Size
$cbURL.TabIndex = 0

$form1.Controls.Add($cbURL)

#endregion Generated Form Code

#Save the initial state of the form
$InitialFormWindowState = $form1.WindowState
#Init the OnLoad event to correct the initial state of the form
$form1.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$form1.ShowDialog()| Out-Null

} #End Function

#Call the Function
GenerateForm
