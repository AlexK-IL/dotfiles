#!/bin/bash

# Prints usage message
BASENAME="$0"
usage ()
{
    echo "Usage : (basename "$BASENAME") [options]"
    echo ""
    echo "Description: Downloads artifacts from maven central repository with sources and javadocs"
    echo ""
    echo "Options:"
    echo "-d,--dest <arg>        Destination for downloaded artifacts which should be relative to"
    echo "                       current directory, defaults to 'whiten'"
    echo "-a,--artifact <arg>    Artifact's identifier, should be groupId:artifactName:version"
    echo "-f,--file <arg>        Get artifact identifiers list from file"
    echo "-h,--help              Display help information"
}

download_artifact()
{
    # Download artifact with sources and javadocs
    mvn dependency:get -Dmaven.repo.local="$1" -Dartifact="$2:jar"
    mvn dependency:get -Dmaven.repo.local="$1" -Dartifact="$2:jar:sources"
    mvn dependency:get -Dmaven.repo.local="$1" -Dartifact="$2:jar:javadoc"

    # Download artifact's dependencies' sources and javadocs
    download_artifact_dependencies_sources_and_javadocs $1 $2
}

download_artifact_dependencies_sources_and_javadocs()
{
   # Save current working directory path
   WORKING_DIR=$(pwd)

   # Split artifact id to array of groupId, artifactName and version
   IFS=':' read -r -a ARTIFACT_PARTS <<< "$2"

   # Move to downloaded directory
   cd "$1/${ARTIFACT_PARTS[0]//\./\/}/${ARTIFACT_PARTS[1]}/${ARTIFACT_PARTS[2]}"

   # Copy artifact's POM file to pom.xml
   cp "${ARTIFACT_PARTS[1]}-${ARTIFACT_PARTS[2]}.pom" pom.xml

   # Run sources and resolve for sources and javadocs of dependencies
   mvn dependency:sources -Dmaven.repo.local="$WORKING_DIR/$1" -DincludeParents=true
   mvn dependency:resolve -Dmaven.repo.local="$WORKING_DIR/$1" -Dclassifier=javadoc -DincludeParents=true

   # Remove pom.xml file
   rm pom.xml

   # Return to working directory
   cd $WORKING_DIR
}

# Get arguments
DEST='whiten'
while [ "$1" != "" ]; do
    case $1 in
        -a | --artifact ) shift
                          ARTIFACT=$1
                          ;;
        -f | --file )     shift
                          FILE=$1
                          ;;
        -d | --dest )     shift
                          DEST=$1
                          ;;
        -h | --help )     usage
                          exit
                          ;;
        * )               usage
                          exit 1
    esac
    shift
done

# Validate arguments
if [ "$DEST" = "" ]; then
    usage
    exit 1
fi
if [ "$ARTIFACT" = "" ]; then
    if [ "$FILE" = "" ]; then
        usage
        exit 1
    else
        while read -r line || [[ -n "$line" ]]; do
            download_artifact $DEST $line
        done < "$FILE"
    fi
else
    download_artifact $DEST $ARTIFACT
fi
