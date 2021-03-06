#!/bin/bash

LYCHEEJS_ROOT="/opt/lycheejs";
LYCHEEJS_FERTILIZER=`which lycheejs-fertilizer`;
LYCHEEJS_HELPER=`which lycheejs-helper`;


# XXX: Allow /tmp/lycheejs usage
if [ "$(basename $PWD)" == "lycheejs" ] && [ "$PWD" != "$LYCHEEJS_ROOT" ]; then
	LYCHEEJS_ROOT="$PWD";
	LYCHEEJS_FERTILIZER="$PWD/libraries/fertilizer/bin/fertilizer.sh";
	LYCHEEJS_HELPER="$PWD/bin/helper/helper.sh";
fi;


if [ "$LYCHEEJS_HELPER" != "" ] && [ "$LYCHEEJS_FERTILIZER" != "" ]; then

	cd $LYCHEEJS_ROOT;

	bash $LYCHEEJS_FERTILIZER /libraries/studio html-nwjs/main;
	bash $LYCHEEJS_HELPER run:html-nwjs/main /libraries/studio "$1" "$2" "$3" "$4";

	exit $?;

else

	exit 1;

fi;

