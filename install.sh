#!/bin/bash
read -p 'Enter your TRIGGERcmd token: ' TOKEN
read -p 'Enter an existing computer ID, or leave blank to create a new computer: ' COMPUTER_ID

if [[ -z "${TOKEN}" ]]; then
  echo "You didn't enter a token.  Exiting."
  exit 1
fi

if [[ -z "${COMPUTER_ID}" ]]; then
  export COMPUTER_ID=createone
fi

kubectl -n kube-system create secret generic triggercmd-token --from-literal=computerid.cfg=${COMPUTER_ID} --from-literal=token.tkn=${TOKEN}
kubectl -n kube-system create secret generic triggercmd-commands --from-file=./commands.json
kubectl -n kube-system create secret generic triggercmd-scripts --from-file=./scripts/count.sh --from-file=./scripts/demo.sh
kubectl -n kube-system create -f ./yaml

echo "Installed."