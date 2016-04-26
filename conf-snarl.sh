#
# Snarl
#
USER=snarl
GROUP=$USER
echo Configuring Snarl
echo Creating directories ...
mkdir -p /data/snarl/db/ring
mkdir -p /data/snarl/etc
mkdir -p /data/snarl/log/sasl
chown -R $USER:$GROUP /data/snarl

echo Trying to guess configuration ...
CONFFILE=/data/snarl/etc/snarl.conf
cp /opt/local/fifo-snarl/etc/snarl.conf.example ${CONFFILE}.example

if [ ! -f "${CONFFILE}" ]
then
    echo "Creating new configuration from example file."
    cp ${CONFFILE}.example ${CONFFILE}
    $SED -i bak -e "s/127.0.0.1/${IP}/g" ${CONFFILE}
else
    echo "Please make sure you update your config according to the update manual!"
    #/opt/local/fifo-sniffle/share/update_config.sh ${CONFFILE}.example ${CONFFILE} > ${CONFFILE}.new &&
    #    mv ${CONFFILE} ${CONFFILE}.old &&
    #    mv ${CONFFILE}.new ${CONFFILE}
fi