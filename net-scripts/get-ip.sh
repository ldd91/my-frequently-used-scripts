export NODEIP=`ifconfig ib0 |grep "inet "|awk -F " " '{print $2}'|awk '{print $1}'`
