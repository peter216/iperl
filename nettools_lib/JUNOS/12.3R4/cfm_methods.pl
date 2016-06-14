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
# FILE: cfm_methods.pl -- generated automagikally; DO NOT EDIT
#

%cfm_methods = (
    ## Method : <clear-cfm-continuity-measurement>
    ## Returns: <cfmd-clear-continuity-measurement>
    ## Command: "clear oam ethernet connectivity-fault-management continuity-measurement"
    clear_cfm_continuity_measurement => {
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	local_mep => $STRING,
	remote_mep => $STRING,
    },

    ## Method : <clear-cfm-delay-statistics>
    ## Returns: <cfmd-clear-delay-statistics>
    ## Command: "clear oam ethernet connectivity-fault-management delay-statistics"
    clear_cfm_delay_statistics => {
	one_way => $TOGGLE,
	two_way => $TOGGLE,
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-cfm-loss-statistics>
    ## Returns: <cfmd-clear-loss-statistics>
    ## Command: "clear oam ethernet connectivity-fault-management loss-statistics"
    clear_cfm_loss_statistics => {
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
    },

    ## Method : <clear-cfm-slm-statistics>
    ## Returns: <cfmd-clear-slm-statistics>
    ## Command: "clear oam ethernet connectivity-fault-management synthetic-loss-statistics"
    clear_cfm_slm_statistics => {
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
    },

    ## Method : <clear-cfm-statistics>
    ## Returns: <none>
    ## Command: "clear oam ethernet connectivity-fault-management statistics"
    clear_cfm_statistics => {
	interface => $STRING,
	level => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-cfm-linktrace-path-database>
    ## Returns: <none>
    ## Command: "clear oam ethernet connectivity-fault-management path-database"
    clear_cfm_linktrace_path_database => {
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	host => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-cfm-policer-statistics>
    ## Returns: <none>
    ## Command: "clear oam ethernet connectivity-fault-management policer"
    clear_cfm_policer_statistics => {
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-cfm-iterator-statistics>
    ## Returns: <none>
    ## Command: "clear oam ethernet connectivity-fault-management sla-iterator-statistics"
    clear_cfm_iterator_statistics => {
	sla_iterator => $STRING,
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	local_mep => $STRING,
	remote_mep => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-cfm-interfaces-information>
    ## Returns: <cfm-interface>
    ## Command: "show oam ethernet connectivity-fault-management interfaces"
    get_cfm_interfaces_information => {
	interface_name => $STRING,
	vlan => $STRING,
	level => $STRING,
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-cfm-mep-database>
    ## Returns: <cfm-mep-database>
    ## Command: "show oam ethernet connectivity-fault-management mep-database"
    get_cfm_mep_database => {
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	local_mep => $STRING,
	remote_mep => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-cfm-forwarding-state-instance-information>
    ## Returns: <cfm-flood-instance-information>
    ## Command: "show oam ethernet connectivity-fault-management forwarding-state instance"
    get_cfm_forwarding_state_instance_information => {
	instance_name => $STRING,
	bridge_domain => $STRING,
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-cfm-forwarding-state-interface-information>
    ## Returns: <cfm-flood-interface-information>
    ## Command: "show oam ethernet connectivity-fault-management forwarding-state interface"
    get_cfm_forwarding_state_interface_information => {
	interface_name => $STRING,
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-cfm-linktrace-path-database>
    ## Returns: <cfm-linktrace-path-database>
    ## Command: "show oam ethernet connectivity-fault-management path-database"
    get_cfm_linktrace_path_database => {
	logical_system => $STRING,
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	host => $STRING,
    },

    ## Method : <get-cfm-mip-information>
    ## Returns: <cfm-mip-information>
    ## Command: "show oam ethernet connectivity-fault-management mip"
    get_cfm_mip_information => {
	logical_system => $STRING,
	instance_name => $STRING,
	bridge_domain => $STRING,
	interface_name => $STRING,
	vlan => $STRING,
    },

    ## Method : <get-cfm-mep-statistics>
    ## Returns: <cfm-mep-statistics>
    ## Command: "show oam ethernet connectivity-fault-management mep-statistics"
    get_cfm_mep_statistics => {
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	local_mep => $STRING,
	remote_mep => $STRING,
	count => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-cfm-delay-statistics>
    ## Returns: <cfm-delay-statistics>
    ## Command: "show oam ethernet connectivity-fault-management delay-statistics"
    get_cfm_delay_statistics => {
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	local_mep => $STRING,
	remote_mep => $STRING,
	count => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-cfm-loss-statistics>
    ## Returns: <cfm-loss-statistics>
    ## Command: "show oam ethernet connectivity-fault-management loss-statistics"
    get_cfm_loss_statistics => {
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	local_mep => $STRING,
	remote_mep => $STRING,
	count => $STRING,
	session_id => $STRING,
    },

    ## Method : <get-cfm-slm-statistics>
    ## Returns: <cfm-slm-statistics>
    ## Command: "show oam ethernet connectivity-fault-management synthetic-loss-statistics"
    get_cfm_slm_statistics => {
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	count => $STRING,
	local_mep => $STRING,
	remote_mep => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-cfm-policer-information>
    ## Returns: <cfm-policer>
    ## Command: "show oam ethernet connectivity-fault-management policer"
    get_cfm_policer_information => {
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-cfm-iterator-statistics>
    ## Returns: <cfm-iterator-statistics>
    ## Command: "show oam ethernet connectivity-fault-management sla-iterator-statistics"
    get_cfm_iterator_statistics => {
	sla_iterator => $STRING,
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	local_mep => $STRING,
	remote_mep => $STRING,
	logical_system => $STRING,
    },

    ## Method : <request-traceroute-ethernet>
    ## Returns: <ethtraceroute-results>
    ## Command: "traceroute ethernet"
    request_traceroute_ethernet => {
	ttl => $STRING,
	wait => $STRING,
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	host => $STRING,
	mep => $STRING,
	logical_system => $STRING,
    },

    ## Method : <request-ping-ethernet>
    ## Returns: <ethping-results>
    ## Command: "ping ethernet"
    request_ping_ethernet => {
	wait => $STRING,
	size => $STRING,
	count => $STRING,
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	host => $STRING,
	mep => $STRING,
	logical_system => $STRING,
    },

    ## Method : <request-monitor-ethernet-delay-measurement>
    ## Returns: <ethdm-results>
    ## Command: "monitor ethernet delay-measurement"
    request_monitor_ethernet_delay_measurement => {
	one_way => $TOGGLE,
	two_way => $TOGGLE,
	wait => $STRING,
	count => $STRING,
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	remote_mac_address => $STRING,
	mep => $STRING,
	priority => $STRING,
	size => $STRING,
	no_session_id_tlv => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <request-monitor-ethernet-loss-measurement>
    ## Returns: <ethlm-results>
    ## Command: "monitor ethernet loss-measurement"
    request_monitor_ethernet_loss_measurement => {
	wait => $STRING,
	count => $STRING,
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	remote_mac_address => $STRING,
	mep => $STRING,
	priority => $STRING,
	no_session_id_tlv => $TOGGLE,
    },

    ## Method : <request-monitor-ethernet-synthetic-loss-measurement>
    ## Returns: <ethslm-results>
    ## Command: "monitor ethernet synthetic-loss-measurement"
    request_monitor_ethernet_synthetic_loss_measurement => {
	wait => $STRING,
	count => $STRING,
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	remote_mac_address => $STRING,
	mep => $STRING,
	priority => $STRING,
	size => $STRING,
	logical_system => $STRING,
    },

);
1;
