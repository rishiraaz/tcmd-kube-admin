#!/bin/bash
PODCOUNT=$(kubectl -n default get deploy demo -o=jsonpath='{.spec.replicas}')
echo $PODCOUNT pods in demo deployment
. ~/.TRIGGERcmdData/sendresult.sh $PODCOUNT