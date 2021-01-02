# DNTK
Advanced Padavan adblock
This adblock model includes Black list and Withe list making it easy for those who need or face blocking a specific site, just add it to the White list and update the Adblock that the site will be released, the same goes for some site that you want it to be blocked just by adding the blacklisted domain and updating the adblock. Tutorial taken from the 4PDA and made some changes per min.
The hosts file and blacklists will be stored on the HD for ease of editing the lists and the size of the hosts file.

You need to understand that blocking ads using domain blocking will never be as effective a way to combat advertising as AdblockPlus / uBlock on a browser. Sometimes the ads are downloaded from the same domain as the useful content. Or the addresses of advertising domains change so often that it is impossible to block them all (YouTube). 
Browser add-ons address this by hiding this ad immediately before rendering on the screen, which the router cannot, for obvious reasons. However, blocking ads using domain blocking makes sense - for example, if the client device displays ads in a game or mobile app where you cannot install Adblock. 
Ie out of the browser. You don't have to wait for this block to feel so good

For everything to work correctly you need to have an external hard drive or pendrive on your router, and the entware needs to be enabled in the padavan settings.

1)Insert the adblock_update.sh file in the following folder: /etc/storage (access to /etc/storage folder can be done with WINSCP. Requires SSH enabled on padavan)

2) Make it executable: (Type in the Putty or Router console)
chmod +x /etc/storage/adblock_update.sh

3) Insert the adblock_black.list and adblock_white.list files in the following folder: /opt/tmp/ (where to insert the domains that you want to block further (adblock_black.list) or unblock (adblock_white.list). Domains fit in one column, no IP addresses need to be recorded, only domains.)

4) In Advanced Settings → Customization → Scripts → Run After Router Started, add the line:
/etc/storage/adblock_update.sh

5) In Advanced Settings → LAN → DHCP Server → Custom Configuration File "dnsmasq.conf", add the line:
addn-hosts=/opt/tmp/block.hosts

6) In Advanced Settings → Administration → Services enable Cron Daemon (Scheduler)

7) In Advanced Settings → Administration → Services → Scheduler tasks (Crontab):
00 05 * * 0,2,4,6 /etc/storage/adblock_update.sh
(Run the command alternating the days of the week at 5 am, or change it to your preference, you don't need to update every day.)

8) Restart the router or run with Putty SSH: /etc/storage/adblock_update.sh


To block or unblock any site just insert the domain in the desired list adblock_black.list to block or adblock_white.list to unblock, like this: example.com or example.com.br
then just update the adblock with the command in Putty: /etc/storage/adblock_update.sh

Subscriptions are obtained from the entire Internet and only those updated regularly enough. Don't get carried away with the number of signatures (to add a signature, remove the # symbol in front of the logger on the corresponding line).
Currently working well, I recommend not using very large lists as it takes time to update and it takes time to read the domains through the router.
Thanks to ENERGIZED for existing, making this job much easier.
