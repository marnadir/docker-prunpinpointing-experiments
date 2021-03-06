#!/bin/bash

TIMEOUT=$1
shift
GLOBAL_TIMEOUT=$1
shift
QUERY_FILE=$1
shift
ENCODING_DIR=$1
shift
SCRIPTS_DIR=$1
shift
OUTPUT_DIR=$1
shift
ONTOLOGIES_DIR=$1
shift
ENUMERATION_JUSTIFICATIONS_OPTIONS=$1
shift

PRUNETYPE=ESSCYC_PRUNE


java $JAVA_MEMORY_OPTIONS -Dlog4j.configurationFile=log4j2-paramfiles.xml -Dlog.file.out=$OUTPUT_DIR/out.log -Dlog.file.err=$OUTPUT_DIR/err.log -cp "$CLASSPATH" org.liveontologies.pinpointing.RunProofExperiments -t "$TIMEOUT"000 -g "$GLOBAL_TIMEOUT"000 --progress $OUTPUT_DIR/record.csv $QUERY_FILE org.liveontologies.pinpointing.proofs.experiments.ElkResolutionProofExperiment -j $ENUMERATION_JUSTIFICATIONS_OPTIONS -- $ONTOLOGIES_DIR $PRUNETYPE
