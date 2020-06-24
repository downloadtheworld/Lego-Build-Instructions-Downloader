$url = "https://brickset.com/exportscripts/instructions"
$outputfolder = "e:\lego\"
$output = $outputfolder + 'index.csv'

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri $url -OutFile $output
$index = Import-Csv $output
foreach ($file in $index){
    $url = $file.url
    $output = $outputfolder + $file.setnumber + '.pdf'
    if(!(Test-Path $output)){
        Write-Host "Trying" $file.SetNumber - $file.Description " - " $file.Notes
        try{
            Invoke-WebRequest -Uri $url -OutFile $output
        } 
        catch{
            switch ($_.Exception.Response.StatusCode.Value__)
            {
                403{ 
                    Write-Host -ForegroundColor Yellow "Access Denied - Probably not on Lego's servers anymore."           
                }
            }
        }
    }else{
        Write-Host -ForegroundColor Green $file.SetNumber "already exists, skipping"
    }
}
