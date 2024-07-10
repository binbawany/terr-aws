#!/bin/bash
# Install IIS
powershell.exe -Command "Install-WindowsFeature -name Web-Server -IncludeManagementTools"
# Install MySQL Workbench
choco install mysql.workbench -y
