#!/bin/bash

Control()
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
systemctl enable shadowsocks
}
