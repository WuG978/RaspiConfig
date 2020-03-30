#!/bin/bash
 
# check network availability
while true
do
  TIMEOUT=5
  SITE_TO_CHECK="www.baidu.com"
  RET_CODE=`curl -I -s --connect-timeout $TIMEOUT $SITE_TO_CHECK -w %{http_code} | tail -n1`
  if [ "x$RET_CODE" = "x200" ]; then
  echo "Network OK, Start Frp..."
  break
  else
  echo "Network not ready, wait..."
  sleep 1s
  fi
done
 
# Start Frp
sudo /bin/frpc -c /bin/frpc.ini &
