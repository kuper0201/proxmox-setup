#!/bin/bash

while true; do
    clear
    echo "Thermal Zone Temperatures (Updated every 2 seconds)"
    echo "---------------------------------------------"
    for i in 0 1 2; do
        TYPE_PATH="/sys/class/thermal/thermal_zone$i/type"
        TEMP_PATH="/sys/class/thermal/thermal_zone$i/temp"
        
        if [[ -f "$TYPE_PATH" && -f "$TEMP_PATH" ]]; then
            TYPE=$(cat "$TYPE_PATH")
            TEMP=$(cat "$TEMP_PATH")
            TEMP_C=$(echo "scale=1; $TEMP / 1000" | bc)
            echo "$TYPE: ${TEMP_C}°C"
        fi
    done
    sleep 2
done
