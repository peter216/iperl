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
# FILE: stp_methods.pl -- generated automagikally; DO NOT EDIT
#

%stp_methods = (
    ## Method : <clear-stp-interface-statistics>
    ## Returns: <stp-interface-statistics>
    ## Command: "clear spanning-tree statistics interface"
    clear_stp_interface_statistics => {
	logical_system => $STRING,
	interface_name => $STRING,
	routing_instance => $STRING,
    },

    ## Method : <clear-stp-routing-instance-statistics>
    ## Returns: <stp-routing-instance-statistics>
    ## Command: "clear spanning-tree statistics routing-instance"
    clear_stp_routing_instance_statistics => {
	logical_system => $STRING,
	routing_instance_name => $STRING,
    },

    ## Method : <clear-stp-topology-change-counter>
    ## Returns: <stp-topology-change-counter>
    ## Command: "clear spanning-tree topology-change-counter"
    clear_stp_topology_change_counter => {
	logical_system => $STRING,
	vlan_id => $STRING,
	routing_instance => $STRING,
    },

    ## Method : <clear-interface-stp-protocol-migration>
    ## Returns: <interface-stp-protocol-migration>
    ## Command: "clear spanning-tree protocol-migration interface"
    clear_interface_stp_protocol_migration => {
	logical_system => $STRING,
	interface_name => $STRING,
	routing_instance => $STRING,
    },

    ## Method : <clear-bpdu-error>
    ## Returns: <bpdu-error>
    ## Command: "clear error bpdu interface"
    clear_bpdu_error => {
	interface_name => $STRING,
    },

    ## Method : <clear-mac-rewrite-error>
    ## Returns: <mac-rewrite-error>
    ## Command: "clear error mac-rewrite interface"
    clear_mac_rewrite_error => {
	interface_name => $STRING,
    },

    ## Method : <clear-dot1x-interface-session>
    ## Returns: <dot1x-interface-session>
    ## Command: "clear dot1x interface"
    clear_dot1x_interface_session => {
	interface_name => $STRING,
    },

    ## Method : <clear-dot1x-mac-session>
    ## Returns: <dot1x-mac-session>
    ## Command: "clear dot1x mac-address"
    clear_dot1x_mac_session => {
	static_mac_addr => $STRING,
    },

    ## Method : <clear-protection-group-information>
    ## Returns: <none>
    ## Command: "clear protection-group"
    clear_protection_group_information => $NO_ARGS,

    ## Method : <clear-ethernet-ring-information>
    ## Returns: <none>
    ## Command: "clear protection-group ethernet-ring"
    clear_ethernet_ring_information => $NO_ARGS,

    ## Method : <clear-ethernet-ring-statistics>
    ## Returns: <none>
    ## Command: "clear protection-group ethernet-ring statistics"
    clear_ethernet_ring_statistics => {
	group_name => $STRING,
    },

    ## Method : <clear-mvrp-interface-statistics>
    ## Returns: <none>
    ## Command: "clear mvrp statistics"
    clear_mvrp_interface_statistics => {
	logical_system => $STRING,
	routing_instance => $STRING,
	interface => $STRING,
    },

    ## Method : <get-mac-rewrite-interface-information>
    ## Returns: <mac-rewrite-interface-information>
    ## Command: "show mac-rewrite interface"
    get_mac_rewrite_interface_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-stp-bridge-information>
    ## Returns: <stp-bridge-information>
    ## Command: "show spanning-tree bridge"
    get_stp_bridge_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	msti => $STRING,
	vlan_id => $STRING,
	routing_instance => $STRING,
    },

    ## Method : <get-stp-interface-information>
    ## Returns: <stp-interface-information>
    ## Command: "show spanning-tree interface"
    get_stp_interface_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	interface_name => $STRING,
	msti => $STRING,
	vlan_id => $STRING,
	routing_instance => $STRING,
    },

    ## Method : <get-mstp-configuration-information>
    ## Returns: <mstp-configuration-information>
    ## Command: "show spanning-tree mstp configuration"
    get_mstp_configuration_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	routing_instance => $STRING,
    },

    ## Method : <get-stp-interface-statistics>
    ## Returns: <stp-interface-statistics>
    ## Command: "show spanning-tree statistics interface"
    get_stp_interface_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	interface_name => $STRING,
	routing_instance => $STRING,
    },

    ## Method : <get-stp-routing-instance-statistics>
    ## Returns: <stp-routing-instance-statistics>
    ## Command: "show spanning-tree statistics routing-instance"
    get_stp_routing_instance_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	routing_instance_name => $STRING,
    },

    ## Method : <get-l2cpd-task-information>
    ## Returns: <l2cpd-task-information>
    ## Command: "show l2cpd task"
    get_l2cpd_task_information => {
	summary => $TOGGLE,
	task_name => $STRING,
    },

    ## Method : <get-l2cpd-tasks-io-statistics>
    ## Returns: <l2cpd-tasks-io-statistics>
    ## Command: "show l2cpd task io"
    get_l2cpd_tasks_io_statistics => $NO_ARGS,

    ## Method : <get-l2cpd-replication-information>
    ## Returns: <l2cpd-replication-information>
    ## Command: "show l2cpd task replication"
    get_l2cpd_replication_information => $NO_ARGS,

    ## Method : <get-l2cpd-task-memory>
    ## Returns: <l2cpd-task-memory>
    ## Command: "show l2cpd task memory"
    get_l2cpd_task_memory => {
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	history => $TOGGLE,
    },

    ## Method : <get-dot1x-interface-information>
    ## Returns: <dot1x-interface-information>
    ## Command: "show dot1x interface"
    get_dot1x_interface_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-dot1x-static-mac-addresess>
    ## Returns: <dot1x-static-mac-addresses>
    ## Command: "show dot1x static-mac-address"
    get_dot1x_static_mac_addresess => $NO_ARGS,

    ## Method : <get-dot1x-interface-mac-addresses>
    ## Returns: <dot1x-interface-mac-addresses>
    ## Command: "show dot1x static-mac-address interface"
    get_dot1x_interface_mac_addresses => {
	interface_name => $STRING,
    },

    ## Method : <get-dot1x-authentication-failed-users>
    ## Returns: <dot1x-authentication-failed-users>
    ## Command: "show dot1x authentication-failed-users"
    get_dot1x_authentication_failed_users => $NO_ARGS,

    ## Method : <get-raps-pdu-information>
    ## Returns: <erp-rpdu-information>
    ## Command: "show protection-group ethernet-ring aps"
    get_raps_pdu_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	group_name => $STRING,
    },

    ## Method : <get-raps-state-machine-information>
    ## Returns: <erp-raps-information>
    ## Command: "show protection-group ethernet-ring node-state"
    get_raps_state_machine_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	group_name => $STRING,
    },

    ## Method : <get-ring-interface-information>
    ## Returns: <erp-interface-information>
    ## Command: "show protection-group ethernet-ring interface"
    get_ring_interface_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	group_name => $STRING,
    },

    ## Method : <get-ring-tatistics>
    ## Returns: <ethernet-ring-statistics>
    ## Command: "show protection-group ethernet-ring statistics"
    get_ring_tatistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	group_name => $STRING,
    },

    ## Method : <get-ring-data-channel-information>
    ## Returns: <erp-data-channel-information>
    ## Command: "show protection-group ethernet-ring data-channel"
    get_ring_data_channel_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	group_name => $STRING,
    },

    ## Method : <get-ring-vlan-information>
    ## Returns: <erp-ifbd-information>
    ## Command: "show protection-group ethernet-ring vlan"
    get_ring_vlan_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	group_name => $STRING,
    },

    ## Method : <get-mvrp-information>
    ## Returns: <mvrp-information>
    ## Command: "show mvrp"
    get_mvrp_information => {
	logical_system => $STRING,
	routing_instance => $STRING,
    },

    ## Method : <get-mvrp-interface-information>
    ## Returns: <mvrp-interface-information>
    ## Command: "show mvrp interface"
    get_mvrp_interface_information => {
	logical_system => $STRING,
	routing_instance => $STRING,
	interface => $STRING,
    },

    ## Method : <get-mvrp-registration-state>
    ## Returns: <mvrp-registration-information>
    ## Command: "show mvrp registration-state"
    get_mvrp_registration_state => {
	logical_system => $STRING,
	routing_instance => $STRING,
	interface => $STRING,
	vlan => $STRING,
    },

    ## Method : <get-mvrp-applicant-information>
    ## Returns: <mvrp-applicant-state>
    ## Command: "show mvrp applicant-state"
    get_mvrp_applicant_information => {
	logical_system => $STRING,
	routing_instance => $STRING,
	interface => $STRING,
	vlan => $STRING,
    },

    ## Method : <get-mvrp-interface-statistics>
    ## Returns: <mvrp-interface-statistics>
    ## Command: "show mvrp statistics"
    get_mvrp_interface_statistics => {
	logical_system => $STRING,
	routing_instance => $STRING,
	interface => $STRING,
    },

    ## Method : <get-mvrp-dynamic-vlan-memberships>
    ## Returns: <mvrp-vlan-information>
    ## Command: "show mvrp dynamic-vlan-memberships"
    get_mvrp_dynamic_vlan_memberships => {
	logical_system => $STRING,
	routing_instance => $STRING,
	vlan => $STRING,
	interface => $STRING,
    },

    ## Method : <get-fnp-interface-information>
    ## Returns: <fnp-interface-information>
    ## Command: "show oam ethernet fnp interface"
    get_fnp_interface_information => {
	interface => $STRING,
	routing_instance => $STRING,
	vlan => $STRING,
	all => $TOGGLE,
    },

    ## Method : <get-fnp-status>
    ## Returns: <fnp-status-information>
    ## Command: "show oam ethernet fnp status"
    get_fnp_status => {
	interface => $STRING,
	routing_instance => $STRING,
    },

    ## Method : <get-fnp-messages>
    ## Returns: <fnp-messages-information>
    ## Command: "show oam ethernet fnp messages"
    get_fnp_messages => {
	interface => $STRING,
	routing_instance => $STRING,
    },

);
1;
