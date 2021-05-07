$url = "https://brickset.com/exportscripts/instructions"
$outputfolder = "e:\lego\"
$output = $outputfolder + 'index.csv'

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
#Invoke-WebRequest -Uri $url -OutFile $output
$index = Import-Csv $output
foreach ($file in $index){
    $url = $file.url
    $desc = $file.description.Split([IO.Path]::GetInvalidFileNameChars()) -join '_'
    $output = $outputfolder + $file.setnumber + ' ' + $desc +  '.pdf'
    if(!(Test-Path $output)){
        Write-Host "Trying" $file.SetNumber - $file.Description
        Invoke-WebRequest -Uri $url -OutFile $output
    }else{
        Write-Host -ForegroundColor Green $file.SetNumber - $desc "already exists, skipping"
    }
}
