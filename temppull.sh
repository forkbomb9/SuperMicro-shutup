#!/bin/bash
#the IP address of your target iDrac
IPMIHOST=10.0.0.10

#IPMI user
IPMIUSER=ADMIN

#IPMI password (calvin is the default password)
IPMIPW=ADMIN

#Side note: you shouldn't ever store credentials in a script. Period. Here it's an example. 
#I suggest you give a look at tools like https://github.com/plyint/encpass.sh 

ipmitool -I lanplus -H $IPMIHOST -U $IPMIUSER -P $IPMIPW sdr type temperature

# Should return something like that:
#CPU1 Temp        | 01h | ok  |  3.1 | 52 degrees C
#CPU2 Temp        | 02h | ok  |  3.2 | 44 degrees C
#PCH Temp         | 0Ah | ok  |  7.1 | 50 degrees C
#System Temp      | 0Bh | ok  |  7.2 | 33 degrees C

#It lets you know the "id" to grep for in the fancontrol.sh script.
