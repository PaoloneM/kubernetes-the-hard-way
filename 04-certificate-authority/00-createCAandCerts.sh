#!/bin/bash
./01-createCA.sh
./02-createKubeAdminCerts.sh
./03-createClientCerts.sh
./04-createKubeControllerManagerCerts.sh
./05-createKubeProxyCerts.sh
./06-createKubeSchedulerCerts.sh
./07-createKubeApiServerCerts.sh
./08-createKubeServiceAccountCerts.sh