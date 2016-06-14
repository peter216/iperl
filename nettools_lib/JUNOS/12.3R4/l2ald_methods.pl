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
# FILE: l2ald_methods.pl -- generated automagikally; DO NOT EDIT
#

%l2ald_methods = (
    ## Method : <get-l2-learning-interface-information>
    ## Returns: <l2ald-iff-information>
    ## Command: "show l2-learning interface"
    get_l2_learning_interface_information => $NO_ARGS,

    ## Method : <get-l2-learning-global-mac-count>
    ## Returns: <l2ald-global-macdb-count>
    ## Command: "show l2-learning global-mac-count"
    get_l2_learning_global_mac_count => $NO_ARGS,

    ## Method : <get-l2-learning-global-information>
    ## Returns: <l2ald-process-information>
    ## Command: "show l2-learning global-information"
    get_l2_learning_global_information => $NO_ARGS,

    ## Method : <get-l2-learning-routing-instances>
    ## Returns: <l2ald-routing-table-information>
    ## Command: "show l2-learning instance"
    get_l2_learning_routing_instances => {
	instance_name => $STRING,
	bridge_domain => $STRING,
	ifbd => $STRING,
    },

    ## Method : <get-l2-learning-provider-instance>
    ## Returns: <get-l2ald-pbn>
    ## Command: "show l2-learning provider-instance"
    get_l2_learning_provider_instance => {
	instance => $STRING,
	bridge_domain_name => $STRING,
	logical_system => $STRING,
	isid => $STRING,
    },

    ## Method : <get-l2-learning-backbone-instance>
    ## Returns: <l2ald-pbn>
    ## Command: "show l2-learning backbone-instance"
    get_l2_learning_backbone_instance => {
	instance => $STRING,
	bridge_domain_name => $STRING,
	logical_system => $STRING,
	isid => $STRING,
    },

    ## Method : <get-l2-learning-remote-backbone-edge-bridges>
    ## Returns: <l2ald-rbeb-information>
    ## Command: "show l2-learning remote-backbone-edge-bridges"
    get_l2_learning_remote_backbone_edge_bridges => {
	remote_beb_mac_address => $STRING,
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-l2-learning-redundancy-groups>
    ## Returns: <l2ald-mc-ae-rg-entry>
    ## Command: "show l2-learning redundancy-groups"
    get_l2_learning_redundancy_groups => {
	redundancy_group_id => $STRING,
	remote_macs => $TOGGLE,
	arp_statistics => $TOGGLE,
    },

    ## Method : <get-l2-learning-mac-move-buffer-information>
    ## Returns: <l2ald-mac-move-buffer>
    ## Command: "show l2-learning mac-move-buffer"
    get_l2_learning_mac_move_buffer_information => {
	detail => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-bridge-instance-information>
    ## Returns: <l2ald-bridge-instance-information>
    ## Command: "show bridge domain"
    get_bridge_instance_information => {
	instance => $STRING,
	bridge_domain_name => $STRING,
	logical_system => $STRING,
	interface => $STRING,
	detail => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-operational-bridge-instance-information>
    ## Returns: <l2ald-bridge-instance-information>
    ## Command: "show bridge domain operational"
    get_operational_bridge_instance_information => $NO_ARGS,

    ## Method : <get-bridge-statistics-information>
    ## Returns: <bridge-statistics-information>
    ## Command: "show bridge statistics"
    get_bridge_statistics_information => {
	logical_system => $STRING,
	instance => $STRING,
	bridge_domain => $STRING,
    },

    ## Method : <get-bridge-mac-table>
    ## Returns: <l2ald-rtb-macdb>
    ## Command: "show bridge mac-table"
    get_bridge_mac_table => {
	instance => $STRING,
	bridge_domain => $STRING,
	logical_system => $STRING,
	vlan_id => $STRING,
	isid => $STRING,
	address => $STRING,
	detail => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	count => $TOGGLE,
    },

    ## Method : <get-bridge-interface-mac-table>
    ## Returns: <l2ald-interface-macdb>
    ## Command: "show bridge mac-table interface"
    get_bridge_interface_mac_table => {
	interface_name => $STRING,
	all => $TOGGLE,
	remote_beb_mac_address => $STRING,
	vlan_id => $STRING,
	isid => $STRING,
	detail => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	count => $TOGGLE,
    },

    ## Method : <get-bridge-flood-information>
    ## Returns: <l2ald-vpls-flood-instance>
    ## Command: "show bridge flood"
    get_bridge_flood_information => {
	logical_system => $STRING,
	instance => $STRING,
	bridge_domain => $STRING,
	detail => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-bridge-domain-bd-flood-route-information>
    ## Returns: <l2ald-bridge-domain-flood-route-information>
    ## Command: "show bridge flood route bd-flood"
    get_bridge_domain_bd_flood_route_information => {
	logical_system => $STRING,
	instance => $STRING,
	bridge_domain => $STRING,
    },

    ## Method : <get-show-bridge-domain-all-ce-flood-route-information>
    ## Returns: <l2ald-bridge-domain-flood-route-information>
    ## Command: "show bridge flood route all-ce-flood"
    get_show_bridge_domain_all_ce_flood_route_information => {
	logical_system => $STRING,
	instance => $STRING,
	bridge_domain => $STRING,
    },

    ## Method : <get-show-bridge-domain-ve-flood-route-information>
    ## Returns: <l2ald-bridge-domain-flood-route-information>
    ## Command: "show bridge flood route all-ve-flood"
    get_show_bridge_domain_ve_flood_route_information => {
	logical_system => $STRING,
	instance => $STRING,
	bridge_domain => $STRING,
    },

    ## Method : <get-bridge-domain-re-flood-route-information>
    ## Returns: <l2ald-bridge-domain-flood-route-information>
    ## Command: "show bridge flood route re-flood"
    get_bridge_domain_re_flood_route_information => {
	logical_system => $STRING,
	instance => $STRING,
	bridge_domain => $STRING,
    },

    ## Method : <get-bridge-domain-mlp-flood-route-information>
    ## Returns: <l2ald-bridge-domain-flood-route-information>
    ## Command: "show bridge flood route mlp-flood"
    get_bridge_domain_mlp_flood_route_information => {
	logical_system => $STRING,
	instance => $STRING,
	bridge_domain => $STRING,
    },

    ## Method : <get-bridge-domain-alt-root-flood-route-information>
    ## Returns: <l2ald-bridge-domain-flood-route-information>
    ## Command: "show bridge flood route alt-root-flood"
    get_bridge_domain_alt_root_flood_route_information => {
	interface => $STRING,
    },

    ## Method : <get-bridge-domain-event-queue-information>
    ## Returns: <l2ald-bridge-domain-flood-event-queue>
    ## Command: "show bridge flood event-queue"
    get_bridge_domain_event_queue_information => $NO_ARGS,

    ## Method : <get-vlan-information>
    ## Returns: <vlan-information>
    ## Command: "show vlans"
    get_vlan_information => {
	instance => $STRING,
	vlan_name => $STRING,
	logical_system => $STRING,
	interface => $STRING,
	detail => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-operational-vlan-instance-information>
    ## Returns: <l2ald-vlan-instance-information>
    ## Command: "show vlans operational"
    get_operational_vlan_instance_information => $NO_ARGS,

    ## Method : <get-ethernet-switching-table-information>
    ## Returns: <l2ald-ethernet-switching-table-instance>
    ## Command: "show ethernet-switching table"
    get_ethernet_switching_table_information => {
	instance => $STRING,
	vlan_name => $STRING,
	logical_system => $STRING,
	vlan_id => $STRING,
	isid => $STRING,
	address => $STRING,
	detail => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	count => $TOGGLE,
    },

    ## Method : <get-ethernet-switching-table-interface-information>
    ## Returns: <l2ald-ethernet-switching-table-interface-instance>
    ## Command: "show ethernet-switching table interface"
    get_ethernet_switching_table_interface_information => {
	interface_name => $STRING,
	all => $TOGGLE,
	remote_beb_mac_address => $STRING,
	vlan_id => $STRING,
	isid => $STRING,
	detail => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	count => $TOGGLE,
    },

    ## Method : <get-ethernet-switching-flood-information>
    ## Returns: <l2ald-ethernet-switching-flood-instance>
    ## Command: "show ethernet-switching flood"
    get_ethernet_switching_flood_information => {
	logical_system => $STRING,
	instance => $STRING,
	vlan_name => $STRING,
	detail => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-ethernet-switching-bd-flood-route-information>
    ## Returns: <l2ald-ethernet-switching-flood-route-information>
    ## Command: "show ethernet-switching flood route bd-flood"
    get_ethernet_switching_bd_flood_route_information => {
	logical_system => $STRING,
	instance => $STRING,
	bridge_domain => $STRING,
    },

    ## Method : <get-show-ethernet-switching-all-ce-flood-route-information>
    ## Returns: <l2ald-ethernet-switching-flood-route-information>
    ## Command: "show ethernet-switching flood route all-ce-flood"
    get_show_ethernet_switching_all_ce_flood_route_information => {
	logical_system => $STRING,
	instance => $STRING,
	bridge_domain => $STRING,
    },

    ## Method : <get-show-ethernet-switching-ve-flood-route-information>
    ## Returns: <l2ald-ethernet-switching-flood-route-information>
    ## Command: "show ethernet-switching flood route all-ve-flood"
    get_show_ethernet_switching_ve_flood_route_information => {
	logical_system => $STRING,
	instance => $STRING,
	bridge_domain => $STRING,
    },

    ## Method : <get-ethernet-switchingre-flood-route-information>
    ## Returns: <l2ald-ethernet-switching-flood-route-information>
    ## Command: "show ethernet-switching flood route re-flood"
    get_ethernet_switchingre_flood_route_information => {
	logical_system => $STRING,
	instance => $STRING,
	bridge_domain => $STRING,
    },

    ## Method : <get-ethernet-switching-mlp-flood-route-information>
    ## Returns: <l2ald-ethernet-switching-flood-route-information>
    ## Command: "show ethernet-switching flood route mlp-flood"
    get_ethernet_switching_mlp_flood_route_information => {
	logical_system => $STRING,
	instance => $STRING,
	bridge_domain => $STRING,
    },

    ## Method : <get-ethernet-switching-domain-alt-root-flood-route-information>
    ## Returns: <l2ald-ethernet-switching-flood-route-information>
    ## Command: "show ethernet-switching flood route alt-root-flood"
    get_ethernet_switching_domain_alt_root_flood_route_information => {
	interface => $STRING,
    },

    ## Method : <get-ethernet-switching-event-queue-information>
    ## Returns: <l2ald-ethernet-switching-flood-event-queue>
    ## Command: "show ethernet-switching flood event-queue"
    get_ethernet_switching_event_queue_information => $NO_ARGS,

    ## Method : <get-ethernet-switching-interface-information>
    ## Returns: <switching-interface-information>
    ## Command: "show ethernet-switching interface"
    get_ethernet_switching_interface_information => {
	detail => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-ethernet-switching-statistics-information>
    ## Returns: <ethernet-switching-statistics-information>
    ## Command: "show ethernet-switching statistics"
    get_ethernet_switching_statistics_information => {
	logical_system => $STRING,
	instance => $STRING,
	vlan_name => $STRING,
    },

    ## Method : <get-vpls-mac-table>
    ## Returns: <l2ald-rtb-macdb>
    ## Command: "show vpls mac-table"
    get_vpls_mac_table => {
	instance => $STRING,
	logical_system => $STRING,
	vlan_id => $STRING,
	isid => $STRING,
	address => $STRING,
	detail => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	count => $TOGGLE,
    },

    ## Method : <get-vpls-interface-mac-table>
    ## Returns: <l2ald-interface-macdb>
    ## Command: "show vpls mac-table interface"
    get_vpls_interface_mac_table => {
	interface_name => $STRING,
	all => $TOGGLE,
	detail => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	count => $TOGGLE,
    },

    ## Method : <get-vpls-flood-information>
    ## Returns: <l2ald-vpls-flood-instance>
    ## Command: "show vpls flood"
    get_vpls_flood_information => {
	logical_system => $STRING,
	instance => $STRING,
	detail => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-vpls-ce-flood-route-information>
    ## Returns: <l2ald-vpls-flood-route-information>
    ## Command: "show vpls flood route ce-flood"
    get_vpls_ce_flood_route_information => {
	interface => $STRING,
    },

    ## Method : <get-vpls-all-flood-route-information>
    ## Returns: <l2ald-vpls-flood-route-information>
    ## Command: "show vpls flood route all-flood"
    get_vpls_all_flood_route_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-vpls-all-ce-flood-route-information>
    ## Returns: <l2ald-vpls-flood-route-information>
    ## Command: "show vpls flood route all-ce-flood"
    get_vpls_all_ce_flood_route_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-vpls-re-flood-route-information>
    ## Returns: <l2ald-vpls-flood-route-information>
    ## Command: "show vpls flood route re-flood"
    get_vpls_re_flood_route_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-vpls-mlp-flood-route-information>
    ## Returns: <l2ald-vpls-flood-route-information>
    ## Command: "show vpls flood route mlp-flood"
    get_vpls_mlp_flood_route_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-vpls-alt-root-flood-route-information>
    ## Returns: <l2ald-vpls-flood-route-information>
    ## Command: "show vpls flood route alt-root-flood"
    get_vpls_alt_root_flood_route_information => {
	interface => $STRING,
    },

    ## Method : <get-vpls-event-queue-information>
    ## Returns: <l2ald-vpls-flood-event-queue>
    ## Command: "show vpls flood event-queue"
    get_vpls_event_queue_information => $NO_ARGS,

    ## Method : <clear-vpls-mac-table>
    ## Returns: <none>
    ## Command: "clear vpls mac-table"
    clear_vpls_mac_table => {
	instance => $STRING,
	logical_system => $STRING,
	vlan_id => $STRING,
	isid => $STRING,
	address => $STRING,
    },

    ## Method : <clear-vpls-interface-mac-table>
    ## Returns: <none>
    ## Command: "clear vpls mac-table interface"
    clear_vpls_interface_mac_table => {
	interface_name => $STRING,
	vlan_id => $STRING,
    },

    ## Method : <clear-l2-learning-mac-move-buffer>
    ## Returns: <none>
    ## Command: "clear l2-learning mac-move-buffer"
    clear_l2_learning_mac_move_buffer => $NO_ARGS,

    ## Method : <clear-l2-learning-remote-backbone-edge-bridges>
    ## Returns: <none>
    ## Command: "clear l2-learning remote-backbone-edge-bridges"
    clear_l2_learning_remote_backbone_edge_bridges => {
	remote_beb_mac_address => $STRING,
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-l2-learning-redundancy-group-statistics>
    ## Returns: <none>
    ## Command: "clear l2-learning redundancy-group"
    clear_l2_learning_redundancy_group_statistics => {
	redundancy_group_id => $STRING,
	arp_statistics => $TOGGLE,
    },

    ## Method : <clear-bridge-mac-table>
    ## Returns: <none>
    ## Command: "clear bridge mac-table"
    clear_bridge_mac_table => {
	instance => $STRING,
	bridge_domain => $STRING,
	logical_system => $STRING,
	vlan_id => $STRING,
	isid => $STRING,
	address => $STRING,
    },

    ## Method : <clear-bridge-interface-mac-table>
    ## Returns: <none>
    ## Command: "clear bridge mac-table interface"
    clear_bridge_interface_mac_table => {
	interface_name => $STRING,
	remote_beb_mac_address => $STRING,
	vlan_id => $STRING,
	isid => $STRING,
    },

    ## Method : <clear-ethernet-switching-table>
    ## Returns: <none>
    ## Command: "clear ethernet-switching table"
    clear_ethernet_switching_table => {
	instance => $STRING,
	vlan_name => $STRING,
	logical_system => $STRING,
	vlan_id => $STRING,
	isid => $STRING,
	address => $STRING,
    },

    ## Method : <clear-ethernet-switching-interface-table>
    ## Returns: <none>
    ## Command: "clear ethernet-switching table interface"
    clear_ethernet_switching_interface_table => {
	interface_name => $STRING,
	remote_beb_mac_address => $STRING,
	vlan_id => $STRING,
	isid => $STRING,
    },

);
1;
