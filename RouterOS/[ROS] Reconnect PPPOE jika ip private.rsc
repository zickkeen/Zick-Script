:local WANINTERFACE
:set WANINTERFACE pppoe-indihome
 
:local WANIP [/ip address get [find where interface=$WANINTERFACE] address];
:set WANIP [:pick $WANIP 0 ([:len $WANIP]-3) ];
 
:if ($WANIP ~"^10.") do={
	:log warning "Private ip address found !!!"
	
	/interface pppoe-client enable $WANINTERFACE 
	:delay 1
} else={
 
	:if ($WANIP ~"^172.") do={
	:log warning "Private ip address found !!!"
	 
	/interface pppoe-client enable $WANINTERFACE 
	:delay 1
	} else={
		
		:if ($WANIP ~"^192.") do={
			:log warning "Private ip address found !!!"
			 
			/interface pppoe-client enable $WANINTERFACE 
			:delay 1
			} else={
				:log warning "Public IP - $WANIP - Found, OK ! No action required"
			}
		}
}
