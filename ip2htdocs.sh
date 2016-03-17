#!/bin/bash
ipv4=`/sbin/ifconfig eth0 | grep 'inet Adresse:' | cut -d: -f2 | awk '{ print $1}'`
ipv6arr=$`/sbin/ifconfig eth0 | awk '/inet6/{print $2}'`
readarray -t y <<<"$ipv6raw"
printf "<html>\n<head>\n<title>\n</title>\n</head>\n<body><p>v4: $ipv4</p>" > /srv/customers/default/htdocs/index.html 2>&1;
for ipv6 in ${ipv6arr[*]}
do
    printf "v6: %s<br>" $ipv6 >> /srv/customers/default/htdocs/index.html 2>&1;
done
printf "</body>\n</html>\n" >> /srv/customers/default/htdocs/index.html 2>&1;
