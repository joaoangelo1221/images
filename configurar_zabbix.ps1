$conf = "C:\Program Files\Zabbix Agent\zabbix_agentd.conf"

(Get-Content $conf) |
ForEach-Object {

$_ -replace "^Server=.*","Server=10.230.254.106" `
   -replace "^ServerActive=.*","ServerActive=10.230.254.106" `
   -replace "^Hostname=.*","HostnameItem=system.hostname"

} | Set-Content $conf

Restart-Service "Zabbix Agent" -Force