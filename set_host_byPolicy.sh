#!/bin/bash

# Script Parameters:
# $4: IP Address
# $5: Hostname

# Check if both IP address and hostname are provided
if [ -z "$4" ] || [ -z "$5" ]; then
    echo "Error: IP address or hostname not provided."
    exit 1
fi

# Validate IP address format
if ! echo "$4" | grep -Eqo '^([0-9]{1,3}\.){3}[0-9]{1,3}$'; then
    echo "Error: Invalid IP address format."
    exit 1
fi

# Add entry to /etc/hosts
echo "Adding entry to /etc/hosts..."
echo -e "$4\t$5" >> /etc/hosts

# Check if the entry was added
if grep -Eq "^$4\\s+$5$" /etc/hosts; then
    echo "Entry added successfully: $4 $5"
else
    echo "Error: Failed to add entry to /etc/hosts."
    exit 1
fi
