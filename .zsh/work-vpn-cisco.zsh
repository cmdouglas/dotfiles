export VPN_HOST="dfw-vpn1.csid.com"
export KEEPALIVE_URL="https://build.csid.com";

function vpn_status() {
	/opt/cisco/anyconnect/bin/vpn stats
}

function vpn_connect () {
	/opt/cisco/anyconnect/bin/vpn connect $VPN_HOST
}

function vpn_disconnect() {
	/opt/cisco/anyconnect/bin/vpn disconnect
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
	esac
}
