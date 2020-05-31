sleep 9
PATH=/opt/sbin:/opt/bin:/opt/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin


rm /opt/tmp/block.hosts
touch /opt/tmp/block.hosts
sleep 8


# 0.0.0.0 is defined as a non-routable meta-address used to designate an invalid, unknown, or non applicable target. Using 0.0.0.0 is empirically faster, possibly because there's no wait for a timeout resolution
ENDPOINT_IP4="0.0.0.0"
ENDPOINT_IP6="::"
TMPDIR="/opt/tmp/block.build.list"
STGDIR="/opt/tmp/block.build.before"
TARGET="/opt/tmp/block.hosts"
BLIST="/opt/tmp/adblock_black.list"
WLIST="/opt/tmp/adblock_white.list"

# Download and process the files needed to make the lists (enable/add more, if you want)

#youtube ads blacklist
 logger "download youtube ads blacklist..." && wget -qO- "https://raw.githubusercontent.com/anudeepND/youtubeadsblacklist/master/hosts.txt" | awk -v r="$ENDPOINT_IP4" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#youtube ads blacklist
 logger "download youtube ads blacklist 1..." && wget -qO- "https://raw.githubusercontent.com/HenningVanRaumle/pihole-ytadblock/master/ytadblock.txt" | awk -v r="$ENDPOINT_IP4" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#youtube ads blacklist
 logger "download youtube ads blacklist 2..." && wget -qO- "https://jasonhill.co.uk/pfsense/ytadblock.txt" | awk -v r="$ENDPOINT_IP4" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#youtube ads blacklist
 logger "download youtube ads blacklist 3..." && wget -qO- "https://raw.githubusercontent.com/kboghdady/youTube_ads_4_pi-hole/master/black.list" | awk -v r="$ENDPOINT_IP4" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Spark
# logger "download Energyzed Protection Spark..." && wget -qO- "https://block.energized.pro/spark/formats/hosts" | awk -v r="$ENDPOINT_IP4" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Spark IPV6
# logger "download Energyzed Protection Spark IPV6..." && wget -qO- "https://block.energized.pro/spark/formats/hosts-ipv6.txt" | awk -v r="$ENDPOINT_IP6" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Blu Go
# logger "download Energyzed Protection Blu Go..." && wget -qO- "https://block.energized.pro/bluGo/formats/hosts" | awk -v r="$ENDPOINT_IP4" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Blu Go IPV6
# logger "download Energyzed Protection Blu Go IPV6..." && wget -qO- "https://block.energized.pro/bluGo/formats/hosts-ipv6.txt" | awk -v r="$ENDPOINT_IP6" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Blu
 logger "download Energyzed Protection Blu..." && wget -qO- "https://block.energized.pro/blu/formats/hosts" | awk -v r="$ENDPOINT_IP4" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Blu IPV6
# logger "download Energyzed Protection Blu IPV6..." && wget -qO- "https://block.energized.pro/blu/formats/hosts-ipv6.txt" | awk -v r="$ENDPOINT_IP6" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Basic
# logger "download Energyzed Protection Basic..." && wget -qO- "https://block.energized.pro/basic/formats/hosts" | awk -v r="$ENDPOINT_IP4" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Basic IPV6
# logger "download Energyzed Protection Basic IPV6..." && wget -qO- "https://block.energized.pro/basic/formats/hosts-ipv6.txt" | awk -v r="$ENDPOINT_IP6" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Porn
# logger "download Energyzed Protection Porn..." && wget -qO- "https://block.energized.pro/porn/formats/hosts" | awk -v r="$ENDPOINT_IP4" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Porn IPV6
# logger "download Energyzed Protection Porn IPV6..." && wget -qO- "https://block.energized.pro/porn/formats/hosts-ipv6.txt" | awk -v r="$ENDPOINT_IP6" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Ultimate
# logger "download Energyzed Protection Ultimate..." && wget -qO- "https://block.energized.pro/ultimate/formats/hosts" | awk -v r="$ENDPOINT_IP4" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Ultimate IPV6
# logger "download Energyzed Protection Ultimate IPV6..." && wget -qO- "https://block.energized.pro/ultimate/formats/hosts-ipv6.txt" | awk -v r="$ENDPOINT_IP6" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Unified
# logger "download Energyzed Protection Unified..." && wget -qO- "https://block.energized.pro/unified/formats/hosts" | awk -v r="$ENDPOINT_IP4" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Unified IPV6
# logger "download Energyzed Protection Unified IPV6..." && wget -qO- "https://block.energized.pro/unified/formats/hosts-ipv6.txt" | awk -v r="$ENDPOINT_IP6" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Xtreme Extension (Note. Xtreme Pack is an enhanced protection pack. May break apps and sites.)
# logger "download Energyzed Protection Xtreme Extension..." && wget -qO-  "https://block.energized.pro/extensions/xtreme/formats/hosts" | awk -v r="$ENDPOINT_IP4" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Xtreme Extension IPV6 (Note. Xtreme Pack is an enhanced protection pack. May break apps and sites.)
# logger "download Energyzed Protection Xtreme Extension IPV6..." && wget -qO-  "https://block.energized.pro/extensions/xtreme/formats/hosts-ipv6.txt" | awk -v r="$ENDPOINT_IP6" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Social Extension
# logger "download Energyzed Protection Social Extension..." && wget -qO-  "https://block.energized.pro/extensions/social/formats/hosts" | awk -v r="$ENDPOINT_IP4" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Social Extension IPV6
# logger "download Energyzed Protection Social Extension IPV6..." && wget -qO-  "https://block.energized.pro/extensions/social/formats/hosts-ipv6.txt" | awk -v r="$ENDPOINT_IP6" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Porn Lite Extension
# logger "download Energyzed Protection Porn Lite Extension..." && wget -qO-  "https://block.energized.pro/extensions/porn-lite/formats/hosts" | awk -v r="$ENDPOINT_IP4" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Porn Lite Extension IPV6
# logger "download Energyzed Protection Porn Lite Extension IPV6..." && wget -qO-  "https://block.energized.pro/extensions/porn-lite/formats/hosts-ipv6.txt" | awk -v r="$ENDPOINT_IP6" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Regional Extension 
 logger "download Energyzed Protection Extension Regional..." && wget -qO-  "https://block.energized.pro/extensions/regional/formats/hosts" | awk -v r="$ENDPOINT_IP4" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection Regional Extension IPV6
# logger "download Energyzed Protection Extension Regional IPV6..." && wget -qO-  "https://block.energized.pro/extensions/regional/formats/hosts-ipv6.txt" | awk -v r="$ENDPOINT_IP6" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"

#Energyzed Protection IPs Extension 
# logger "download Energyzed Protection Extension IPs..." && wget -qO-  "https://block.energized.pro/extensions/ips/formats/list.txt" | awk -v r="$ENDPOINT_IP4" '{sub(/^0.0.0.0/, r)} $0 ~ "^"r' >> "$TMPDIR"


# Add black list, if non-empty
if [ -s "$BLIST" ]
then
    awk -v r="$ENDPOINT_IP4" '/^[^#]/ { print r,$1 }' "$BLIST" >> "$TMPDIR"
fi

# Sort the download/black lists
awk '{sub(/\r$/,"");print $1,$2}' "$TMPDIR" | sort -u > "$STGDIR"


# Filter (if applicable)
if [ -s "$WLIST" ]
then
    # Filter the blacklist, suppressing whitelist matches
    # This is relatively slow
    egrep -v "^[[:space:]]*$" "$WLIST" | awk '/^[^#]/ {sub(/\r$/,"");print $1}' | grep -vf - "$STGDIR" > "$TARGET"
else
    cat "$STGDIR" > "$TARGET"
fi


# Delete files used to build list to free up the limited space
rm -f "$TMPDIR" "$STGDIR"

# Restart dnsmasq
killall -SIGHUP dnsmasq
