#!/bin/bash
#
GROUP=legonxt

if [ "${ACTION}" = "add" ] && [ -f "${DEVICE}" ]
then
    chmod o-rwx "${DEVICE}"
    chgrp "${GROUP}" "${DEVICE}"
    chmod g+rw "${DEVICE}"
fi 

