if [ -f /var/opt/CrushFTP8_PC/prefs.XML ]; then
    echo "CrushFTP prefrences already exist, just rm -f the zip"
    rm -f /tmp/CrushFTP8_PC.zip
else
    echo "Unzipping and setting up CrushFTP"
    unzip /tmp/CrushFTP8_PC.zip -d /var/opt/
    rm /tmp/CrushFTP8_PC.zip
    cd /var/opt/CrushFTP8_PC && java -jar /var/opt/CrushFTP8_PC/CrushFTP.jar -a "crushadmin" "crushadmin"
fi

/var/opt/run_crushftp.sh start
while true; do sleep 86400; done