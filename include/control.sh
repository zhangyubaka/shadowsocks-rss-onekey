#!/bin/bash

Control()
{
cat > /etc/init.d/shadowsocks << EOF
#!/bin/sh
start(){
    bash /root/shadowsocks/run.sh
}
stop(){
    bash /root/shadowsocks/stop.sh
}
status(){
    bash /root/shadowsocks/tail.sh
}
log(){
    cat /root/shadowsocks/ssserver.log
}
clear(){
    rm /root/shadowsocks/ssserver.log
}
update(){
    cd /root/shadowsocks/ && git pull
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