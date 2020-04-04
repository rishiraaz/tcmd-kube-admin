#!/bin/bash
mkdir /root/.TRIGGERcmdData

if [[ "${TCMD_COMPUTER}"=="createone" ]]; then
  echo "Computer ID was not set, so we'll create a new computer in your TRIGGERcmd account."
else
  echo "Computer ID ${TCMD_COMPUTER} detected in TCMD_COMPUTER variable."
  echo "Writing computer ID to /root/.TRIGGERcmdData/computerid.cfg"
  printf ${TCMD_COMPUTER} > /root/.TRIGGERcmdData/computerid.cfg
  echo "Writing token to /root/.TRIGGERcmdData/token.tkn"
  printf ${TCMD_TOKEN} > /root/.TRIGGERcmdData/token.tkn
fi

FILE=/tmp/commands/commands.json
if [ -f "$FILE" ]; then
    echo "$FILE exists, copying it to /root/.TRIGGERcmdData/commands.json"
    cp $FILE /root/.TRIGGERcmdData/commands.json
else 
    echo "$FILE does not exist, creating an example at /root/.TRIGGERcmdData/commands.json"
    echo '[ {"trigger":"Example 1","command":"shutdown -r","ground":"foreground","voice":"reboot","allowParams": "false"}, {"trigger":"Example 2","command":"gedit","ground":"foreground","voice":"edit","allowParams": "false"} ]' > /root/.TRIGGERcmdData/commands.json
fi

echo $TCMD_TOKEN | node /usr/lib/triggercmdagent/resources/app/src/agent.js --console