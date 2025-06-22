#!/bin/bash

install_date=1750631508
current_date=$(date +%s)

elapsed=$(( $current_date - $install_date ))
elapsed_days=$(( $elapsed / 86400 ))

echo "$elapsed_days"
