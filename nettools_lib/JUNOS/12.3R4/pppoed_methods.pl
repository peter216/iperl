#
#
# COPYRIGHT AND LICENSE
# Copyright (c) 2001-2013 Juniper Networks, Inc.  All rights reserved.
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 	1.	Redistributions of source code must retain the above
# copyright notice, this list of conditions and the following
# disclaimer. 
# 	2.	Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the
# distribution. 
# 	3.	The name of the copyright owner may not be used to 
# endorse or promote products derived from this software without specific 
# prior written permission. 
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
# STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
# IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# FILE: pppoed_methods.pl -- generated automagikally; DO NOT EDIT
#

%pppoed_methods = (
    ## Method : <pppoe-connect-session>
    ## Returns: <none>
    ## Command: "request pppoe connect"
    pppoe_connect_session => {
	interface => $STRING,
    },

    ## Method : <pppoe-diconnect-session>
    ## Returns: <none>
    ## Command: "request pppoe disconnect"
    pppoe_diconnect_session => {
	interface => $STRING,
    },

    ## Method : <get-pppoe-interface-information>
    ## Returns: <pppoe-interface-information>
    ## Command: "show pppoe interfaces"
    get_pppoe_interface_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-pppoe-lockout-information>
    ## Returns: <pppoe-lockout-information>
    ## Command: "show pppoe lockout"
    get_pppoe_lockout_information => {
	underlying_interface_name => $STRING,
    },

    ## Method : <get-pppoe-service-name-table-information>
    ## Returns: <pppoe-service-name-table-information>
    ## Command: "show pppoe service-name-tables"
    get_pppoe_service_name_table_information => {
	table_name => $STRING,
    },

    ## Method : <get-pppoe-session-information>
    ## Returns: <pppoe-session-information>
    ## Command: "show pppoe sessions"
    get_pppoe_session_information => {
	service => $STRING,
	aci => $STRING,
	ari => $STRING,
    },

    ## Method : <get-pppoe-statistics-information>
    ## Returns: <pppoe-statistics-information>
    ## Command: "show pppoe statistics"
    get_pppoe_statistics_information => {
	underlying_interface_name => $STRING,
    },

    ## Method : <get-pppoe-interface-set-information>
    ## Returns: <pppoe-interface-set-information>
    ## Command: "show pppoe interface-sets"
    get_pppoe_interface_set_information => {
	interface_set_name => $STRING,
    },

    ## Method : <get-pppoe-underlying-interface-information>
    ## Returns: <pppoe-underlying-interface-information>
    ## Command: "show pppoe underlying-interfaces"
    get_pppoe_underlying_interface_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	lockout => $TOGGLE,
	underlying_interface_name => $STRING,
    },

    ## Method : <get-pppoe-version>
    ## Returns: <pppoe-version>
    ## Command: "show pppoe version"
    get_pppoe_version => $NO_ARGS,

    ## Method : <clear-pppoe-lockout-timers>
    ## Returns: <none>
    ## Command: "clear pppoe lockout"
    clear_pppoe_lockout_timers => {
	underlying_interfaces => $STRING,
	mac_address => $STRING,
	aci => $STRING,
    },

    ## Method : <clear-pppoe-sessions-information>
    ## Returns: <pppoe-sessions-information>
    ## Command: "clear pppoe sessions"
    clear_pppoe_sessions_information => {
	interface => $STRING,
    },

    ## Method : <clear-pppoe-statistics-information>
    ## Returns: <pppoe-statistics-information>
    ## Command: "clear pppoe statistics"
    clear_pppoe_statistics_information => {
	underlying_interface_name => $STRING,
    },

    ## Method : <clear-pppoe-statistics-interface-information>
    ## Returns: <none>
    ## Command: "clear pppoe statistics interfaces"
    clear_pppoe_statistics_interface_information => {
	interface_name => $STRING,
    },

);
1;
