#!/bin/bash

binDir=`dirname $0`
dsserver_home=$binDir/..
cd ${dsserver_home}
dsserver_home=`pwd`
export dsserver_home

PATH=${dsserver_home}/jre/bin:${PATH}
export PATH

JAVA_HOME=${dsserver_home}/jre
export JAVA_HOME

. ${dsserver_home}/bin/product.sh

utiljar=${dsserver_home}/dscomponents/CommonWeb/com.ibm.datatools.corehttpservices.util_2.4.0.jar:${dsserver_home}/dsutil/lib/com.ibm.datatools.corehttpservices.util_2.4.0.jar

CLASSPATH=${utiljar}:${CLASSPATH}
export CLASSPATH

if [ -z "$1" ]
then
    echo "Specify '-off' to turn off monitor component or '-on' to turn on monitor component."
    exit 1
fi

config="${dsserver_home}/Config/monitorprofile_bluhelix.properties"

if [ "$1" == "-off" ]
then
  java com.ibm.datatools.corehttpservices.util.PropertiesFileUpdater $config -rtmon_config.default.enabled false -repos_config.mondata.enabled false -repos_config.sqlstmtexedata.enabled false -repos_config.utility_events_data.enabled false -repos_config.sqlstmtexedata.indstmtenabled false -repos_config.lock_events_data.enabled false -repos_config.wlm_data.enabled false -repos_config.wlm_data.collect_data false >/dev/null
  echo "Monitor has been switched off. Please restart console..."
fi

if [ "$1" == "-on" ]
then
  java com.ibm.datatools.corehttpservices.util.PropertiesFileUpdater $config -rtmon_config.default.enabled true -repos_config.mondata.enabled true -repos_config.sqlstmtexedata.enabled true -repos_config.utility_events_data.enabled true -repos_config.sqlstmtexedata.indstmtenabled true -repos_config.lock_events_data.enabled true -repos_config.wlm_data.enabled true -repos_config.wlm_data.collect_data true >/dev/null
  echo "Monitor has been turned on. Please restart console..."
fi

exit 0

