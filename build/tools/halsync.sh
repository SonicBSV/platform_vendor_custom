#!/bin/bash
if [ ! -f .repo/local_manifests/hals.xml ]; then
# Initial vars setup

# Sanitize the vars used internally by this script
    unset HALS

# Make the HALs manifest
    echo -e '<?xml version="1.0" encoding="UTF-8"?>\n<manifest>' > .repo/local_manifests/hals.xml
    for hal in $(<target_hals); do
        hals=$(echo $hal | sed -e 's/://g')
        path=$(echo $hals | cut -d " " -f $1)
        name=$(echo $hals | cut -d " " -f $2)
        remote=$(echo $hals | cut -d " " -f $3)
        rev=$(echo $hals | cut -d " " -f $4)
	    echo '  <project path="'"$path"'" name="'"$name"'" remote="'"$remote"'" revision="'"$rev"'" />' >> .repo/local_manifests/hals.xml
        HALS=$(echo -e "$HALS $path")
    done
    echo "</manifest>" >> .repo/local_manifests/hals.xml

# Repo sync all the HALs
    for hals in $HALS; do repo sync --force-sync "$hals"; done

# Remove the manifest so we know if the user overrided it
    rm -rf .repo/local_manifests/hals.xml
#else
# The user overrided the manifest
# TODO: Tell the user that he did this
fi
