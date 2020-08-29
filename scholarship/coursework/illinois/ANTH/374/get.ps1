#!Windows.Terminal.PowershellCore
del log.csv
echo "get /var/netscans/anth374/log.csv" | sftp pi@192.168.10.250
Rscript.exe graph.r log.csv
