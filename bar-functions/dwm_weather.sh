#!/bin/sh

# A dwm_bar function to print the weather from wttr.in
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: curl

# Change the value of LOCATION to match your city
dwm_weather() {
    LOCATION=Sandnes

    if [ "$IDENTIFIER" = "unicode" ]; then

      DATA=$(curl -s wttr.in/$LOCATION?format="%C+%t+%w")
      #DATA=$(curl -s wttr.in/$LOCATION?format=4)
      printf " ⛅ %s" "$DATA"

        #export __DWM_BAR_WEATHER__="${SEP1} ${DATA} ${SEP2}"
        
        #export __DWM_BAR_WEATHER__="$SEP1 $DATA $SEP2"
        #export __DWM_BAR_WEATHER__="[ $(curl -s wttr.in/$LOCATION?format=4) ]"
    else
        DATA=$(curl -s wttr.in/$LOCATION?format=1 | grep -o ".[0-9].*")
        export __DWM_BAR_WEATHER__="${SEP1} WEA ${DATA} ${SEP2}"
    fi
}

dwm_weather
