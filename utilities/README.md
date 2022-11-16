Steps to switch off monitoring in Db2W console:

1. Copy the `monitor_switch.sh` file to container path /opt/ibm/dsserver/scripts

2. Make /opt/ibm/dsserver/scripts/monitor_switch.sh script executable

3. Switch off monitoring with the following command
```
/opt/ibm/dsserver/scripts/monitor_switch.sh -off
```

4. Restart console with the following command
```
su - dsadm -c "/opt/ibm/dsserver/bin/restart.sh"
```

----
Steps to switch on monitoring in Db2W console:


1. Remove the connection profile to the Db2W database in DMC

2. Switch on monitoring with the following command
```
/opt/ibm/dsserver/scripts/monitor_switch.sh -on
```

3. Restart console with the following command
```
su - dsadm -c "/opt/ibm/dsserver/bin/restart.sh"
```
