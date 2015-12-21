#!/bin/bash

Control_Systemd()
{
cat > /etc/systemd/system/shadowsocks << EOF
#!/bin/sh
start(){
    bash ~/shadowsocks/run.sh
}
stop(){
    bash ~/shadowsocks/stop.sh
}
status(){
    bash ~/shadowsocks/tail.sh
}
log(){
    cat ~/shadowsocks/ssserver.log
}
clear(){
    rm ~/shadowsocks/ssserver.log
}
update(){
    cd ~/shadowsocks/ && git pull
}
case "$1" in
start)
    start
    ;;
stop)
    stop
    ;;
status)
    status
    ;;
log)
    log
    ;;
clear)
    clear
    ;;
update)
    update
    ;;
restart)
    stop
    start
    ;;
*)
    echo "Usage: $0 {start|restart|stop|status|log|clear|update}"
    exit 1
    ;;
esac"
EOF
chmod +x /etc/systemd/system/shadowsocks
systemctl enable shadowsocks
}

Control_Upstart()
{
cat > /etc/init.d/shadowsocks << EOF
#!/bin/sh
start(){
    bash ~/shadowsocks/run.sh
}
stop(){
    bash ~/shadowsocks/stop.sh
}
status(){
    bash ~/shadowsocks/tail.sh
}
log(){
    cat ~/shadowsocks/ssserver.log
}
clear(){
    rm ~/shadowsocks/ssserver.log
}
update(){
    cd ~/shadowsocks/ && git pull
}
case "$1" in
start)
    start
    ;;
stop)
    stop
    ;;
status)
    status
    ;;
log)
    log
    ;;
clear)
    clear
    ;;
update)
    update
    ;;
restart)
    stop
    start
    ;;
*)
    echo "Usage: $0 {start|restart|stop|status|log|clear|update}"
    exit 1
    ;;
esac"
EOF
chmod +x /etc/init.d/shadowsocks
update-rc.d shadowsocks defaults
}

Init_Choice()
{
echo "Please choose your system init type"
echo "1: Systemd"
echo "2: Upstart"
read -p "Enter your choice (1 or 2): " InitType
case "${InitType}" in
1)
    Control_Systemd
    ;;
2)
    Control_Upstart
    ;;
*)
    echo "Choice invalid, cannot identity your init type"
    exit 1
esac
}