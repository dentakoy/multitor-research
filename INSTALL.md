install and run:
```
INSTALL_DIR=/opt/multitor

mkdir $INSTALL_DIR
cp -rf ./* $INSTALL_DIR

groupadd multitor
useradd multitor -g multitor -s /bin/false -d $INSTALL_DIR

chmod 700 $INSTALL_DIR
chown -R multitor:multitor $INSTALL_DIR
chmod +x $INSTALL_DIR/bin/multitor
chmod +x $INSTALL_DIR/start.sh

VAR_DIR=/var/lib/multitor
mkdir $VAR_DIR
chown -R multitor:multitor $VAR_DIR

cp etc/systemd/system/multitor.service /etc/systemd/system/
systemctl daemon-reload
systemctl start multitor
```

check:
```
systemctl status multitor
ps aux | grep tor
curl -vx socks5://127.0.0.1:9000 ident.me; echo
curl -vx socks5://127.0.0.1:9001 ident.me; echo
```
