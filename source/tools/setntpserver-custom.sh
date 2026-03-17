#!/bin/bash

NTPSERVER=pool.ntp.org"
TMPCONFIG=/dev/shm/tmpconfig.conf


# timesyncd
CONFIG=/etc/systemd/timesyncd.conf
if [ -f "$CONFIG" ]
then
	cat "$CONFIG" | grep -v -e 'NTP=' > "$TMPCONFIG"
	echo "NTP=$NTPSERVER" >> "$TMPCONFIG"

	sudo chown root:root "$TMPCONFIG"
	sudo chmod 644 "$TMPCONFIG"
	sudo mv "$TMPCONFIG" "$CONFIG"

	# /usr/sbin/ntpd

	sudo service systemd-timesyncd restart > /dev/null 2>&1
fi


for CURSERVICECONFIG in ntp chrony
do
	CONFIG=/etc/${CURSERVICECONFIG}.conf
	if [ -f "$CONFIG" ]
	then
		cat "$CONFIG" | grep -v -e 'pool ' > "$TMPCONFIG"
		#echo "server $NTPSERVER" >> "$TMPCONFIG"
		echo "pool 0.pool.ntp.org iburst" >> "$TMPCONFIG"
		echo "pool 1.pool.ntp.org iburst" >> "$TMPCONFIG"
		echo "pool 2.pool.ntp.org iburst" >> "$TMPCONFIG"
		echo "pool 3.pool.ntp.org iburst" >> "$TMPCONFIG"

		sudo chown root:root "$TMPCONFIG"
		sudo chmod 644 "$TMPCONFIG"
		sudo mv "$TMPCONFIG" "$CONFIG"

		sudo service ${CURSERVICECONFIG} restart > /dev/null 2>&1
	fi
done
