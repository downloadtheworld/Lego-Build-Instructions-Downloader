# Lego-Build-Instructions-Downloader
Lets you download all build instructions from lego.com, using the list provided by brickset.com

Make sure you run as admin - this is due to the line '[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12' which forces tls. Not needed on all systems though so you may want to comment out that line if you don't want to/can't run as admin.
