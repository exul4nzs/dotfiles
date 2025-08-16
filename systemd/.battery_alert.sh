#!/bin/bash

# Get battery status
battery_status=$(acpi -b)
battery_percent=$(echo "$battery_status" | grep -P -o '[0-9]+(?=%)')

# Alert if battery <= 11% (critical panic)
if [[ $battery_percent -le 11 && "$battery_status" == *"Discharging"* ]]; then
  notify-send -u critical -t 0 "🪫 BATTERY CRITICAL" "${battery_percent}% LEFT. CHARGE IMMEDIATELY OR TURN THE LAPTOP OFF!" --icon=battery-empty

# Alert if battery <= 25% and discharging
elif [[ $battery_percent -le 25 && "$battery_status" == *"Discharging"* ]]; then
  notify-send -u critical "🔋 Battery Low!" "Battery at ${battery_percent}%. Plug in the charger!"

# Reminder at 80% for device longevity
elif [[ $battery_percent -ge 80 && "$battery_status" == *"Charging"* ]]; then
  notify-send -u normal "🔌 Battery Saver" "80% reached! Unplug to avoid battery stress" --icon=battery-full-charged

# FULLY CHARGED: 100% and charging
elif [[ $battery_percent -eq 100 && "$battery_status" == *"Charging"* ]]; then
  notify-send -u low "⚡ Fully Charged" "Battery at 100%. You can unplug now." --icon=battery-full-charging

# CHARGING: Any other charging state (optional)
elif [[ "$battery_status" == *"Charging"* ]]; then
  notify-send -u low "🔋 Charging" "Battery at ${battery_percent}%." --icon=battery-charging
fi
