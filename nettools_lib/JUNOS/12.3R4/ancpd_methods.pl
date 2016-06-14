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
# FILE: ancpd_methods.pl -- generated automagikally; DO NOT EDIT
#

%ancpd_methods = (
    ## Method : <get-ancp-cos-information>
    ## Returns: <ancp-cos-information>
    ## Command: "show ancp cos"
    get_ancp_cos_information => {
	identifier => $STRING,
    },

    ## Method : <get-ancp-cos-pending-information>
    ## Returns: <ancp-cos-information>
    ## Command: "show ancp cos pending-update"
    get_ancp_cos_pending_information => $NO_ARGS,

    ## Method : <get-ancp-cos-last-update-information>
    ## Returns: <ancp-cos-information>
    ## Command: "show ancp cos last-update"
    get_ancp_cos_last_update_information => $NO_ARGS,

    ## Method : <get-ancp-neighbor-information>
    ## Returns: <ancp-neighbor-information>
    ## Command: "show ancp neighbor"
    get_ancp_neighbor_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	ip_address => $STRING,
	system_name => $STRING,
    },

    ## Method : <get-ancp-subscriber-information>
    ## Returns: <ancp-subscriber-information>
    ## Command: "show ancp subscriber"
    get_ancp_subscriber_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-ancp-subscriber-identifier-information>
    ## Returns: <ancp-subscriber-information>
    ## Command: "show ancp subscriber identifier"
    get_ancp_subscriber_identifier_information => {
	identifier_name => $STRING,
	neighbor => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-ancp-subscriber-neighbor-information>
    ## Returns: <ancp-subscriber-information>
    ## Command: "show ancp subscriber neighbor"
    get_ancp_subscriber_neighbor_information => {
	neighbor_ipaddress => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <clear-ancp-neighbor-connection>
    ## Returns: <ancp-neighbor-information>
    ## Command: "clear ancp neighbor"
    clear_ancp_neighbor_connection => {
	system_name => $STRING,
	ip_address => $STRING,
    },

    ## Method : <clear-ancp-subscriber-connection>
    ## Returns: <ancp-subscriber-information>
    ## Command: "clear ancp subscriber"
    clear_ancp_subscriber_connection => {
	identifier => $STRING,
	system_name => $STRING,
	ip_address => $STRING,
    },

    ## Method : <request-ancp-oam-information>
    ## Returns: <ancp-oam-information>
    ## Command: "request ancp oam"
    request_ancp_oam_information => $NO_ARGS,

    ## Method : <request-ancp-oam-neighbor-information>
    ## Returns: <ancp-oam-information>
    ## Command: "request ancp oam neighbor"
    request_ancp_oam_neighbor_information => {
	system_name => $STRING,
	ip_address => $STRING,
	subscriber => $STRING,
	count => $STRING,
	timeout => $STRING,
    },

    ## Method : <request-ancp-oam-interface-information>
    ## Returns: <ancp-oam-information>
    ## Command: "request ancp oam interface"
    request_ancp_oam_interface_information => {
	interface_name => $STRING,
	interface_set => $STRING,
	count => $STRING,
	timeout => $STRING,
    },

);
1;
