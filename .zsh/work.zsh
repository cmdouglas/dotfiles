# CSID specific stuff
export VPN_NAME='Rackspace';
export KEEPALIVE_URL="https://build.csid.com";

# returns a string describing the current vpn status
function vpn_status() {
	scutil --nc status "$VPN_NAME" | sed -n 1p;
}

# returns SUCCESS if the status of the vpn matches the supplied string, FAILURE otherwise
function vpn_has_status () {
    vpn_status | grep -q "$1";
}

# attempts to connect to the vpn.
# will wait until the vpn is done trying to connect, and then return SUCCESS or FAILURE
function vpn_connect () {
	scutil --nc start "$VPN_NAME";
	while vpn_has_status "Connecting" ; do
		sleep 0.1;
	done
	
	vpn_has_status "Connected"
}

function vpn_disconnect() {
	scutil --nc stop "$VPN_NAME";
}

# tests to see if the vpn is connected, and attempts to connect if not
# before executing the supplied command
function with_vpn() {
	if vpn_has_status "Connected"; then
		"$@";
	else
		if vpn_connect; then
			"$@"
		else
			>&2 echo "VPN connection not successful; cancelling command: $@";
			return 1
		fi
	fi
}

function vpn () {
	case $1 in
		status)
			vpn_status
			;;
		connect)
			vpn_connect
			;;
		disconnect)
			vpn_disconnect
			;;
		wrap)
			shift
			with_vpn $@
			;;
		keepalive)
			while true; do 
				if with_vpn curl -sSo /dev/null $KEEPALIVE_URL; then
					sleep 300;
				else
					break;
				fi
			done;
			;;
	esac
}
