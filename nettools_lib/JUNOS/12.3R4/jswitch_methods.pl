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
# FILE: jswitch_methods.pl -- generated automagikally; DO NOT EDIT
#

%jswitch_methods = (
    ## Method : <get-analyzer-information>
    ## Returns: <analyzer-information>
    ## Command: "show analyzer"
    get_analyzer_information => {
	analyzer_name => $STRING,
    },

    ## Method : <get-dhcp-snoop-binding>
    ## Returns: <dhcp-snooping>
    ## Command: "show dhcp snooping binding"
    get_dhcp_snoop_binding => {
	interface => $STRING,
	vlan => $STRING,
    },

    ## Method : <get-dhcp-snooping-statistics>
    ## Returns: <dhcp-snooping>
    ## Command: "show dhcp snooping statistics"
    get_dhcp_snooping_statistics => $NO_ARGS,

    ## Method : <get-arp-inspection-statistics>
    ## Returns: <arp-inspection>
    ## Command: "show arp inspection statistics"
    get_arp_inspection_statistics => $NO_ARGS,

    ## Method : <get-ip-source-guard-information>
    ## Returns: <ip-source-guard>
    ## Command: "show ip-source-guard"
    get_ip_source_guard_information => $NO_ARGS,

    ## Method : <get-fip-snooping>
    ## Returns: <fip-snooping-information>
    ## Command: "show fip snooping"
    get_fip_snooping => {
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-fip-snooping-vlan>
    ## Returns: <fip-snooping-information>
    ## Command: "show fip snooping vlan"
    get_fip_snooping_vlan => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	vlan_name => $STRING,
    },

    ## Method : <get-fip-snooping-fcf>
    ## Returns: <fip-snooping-fcf-information>
    ## Command: "show fip snooping fcf"
    get_fip_snooping_fcf => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	mac => $STRING,
	vlan => $STRING,
    },

    ## Method : <get-fip-snooping-enode>
    ## Returns: <fip-snooping-enode-information>
    ## Command: "show fip snooping enode"
    get_fip_snooping_enode => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	mac => $STRING,
	vlan => $STRING,
    },

    ## Method : <get-fip-snooping-interface-information>
    ## Returns: <fip-snooping-interface-information>
    ## Command: "show fip snooping interface"
    get_fip_snooping_interface_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface_name => $STRING,
	vlan => $STRING,
    },

    ## Method : <get-fip-snooping-statistics>
    ## Returns: <fip-snooping-statistics>
    ## Command: "show fip snooping statistics"
    get_fip_snooping_statistics => {
	vlan => $STRING,
    },

    ## Method : <get-fip-snooping-vlandiscovery-enodes>
    ## Returns: <fip-snooping-vlandiscovery-enodes>
    ## Command: "show fip vlan-discovery enodes"
    get_fip_snooping_vlandiscovery_enodes => $NO_ARGS,

    ## Method : <get-fip-snooping-vlandiscovery-statistics>
    ## Returns: <fip-snooping-vlandiscovery-statistics>
    ## Command: "show fip vlan-discovery statistics"
    get_fip_snooping_vlandiscovery_statistics => $NO_ARGS,

    ## Method : <get-cfm-adjacency-information>
    ## Returns: <cfm-adjacency-information>
    ## Command: "show oam ethernet connectivity-fault-management adjacencies"
    get_cfm_adjacency_information => {
	interface_name => $STRING,
    },

    ## Method : <get-cfm-bridge-routes>
    ## Returns: <cfm-route-table>
    ## Command: "show oam ethernet connectivity-fault-management routes"
    get_cfm_bridge_routes => {
	all => $TOGGLE,
    },

    ## Method : <get-cfm-interface>
    ## Returns: <cfm-interface>
    ## Command: "show oam ethernet connectivity-fault-management interfaces"
    get_cfm_interface => {
	interface_name => $STRING,
	vlan => $STRING,
	level => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-cfm-mep-database-information>
    ## Returns: <cfm-mep-database>
    ## Command: "show oam ethernet connectivity-fault-management mep-database"
    get_cfm_mep_database_information => {
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	local_mep => $STRING,
	remote_mep => $STRING,
    },

    ## Method : <get-cfm-flood-interface-information>
    ## Returns: <cfm-flood-interface-information>
    ## Command: "show oam ethernet connectivity-fault-management forwarding-state interface"
    get_cfm_flood_interface_information => {
	interface_name => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-cfm-linktrace-path-databases>
    ## Returns: <cfm-linktrace-path-database>
    ## Command: "show oam ethernet connectivity-fault-management path-database"
    get_cfm_linktrace_path_databases => {
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	host => $STRING,
    },

    ## Method : <get-cfm-MIP-information>
    ## Returns: <cfm-MIP-information>
    ## Command: "show oam ethernet connectivity-fault-management mip"
    get_cfm_MIP_information => {
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
    },

    ## Method : <get-captive-portal-interface-information>
    ## Returns: <captive-portal-interface-information>
    ## Command: "show captive-portal interface"
    get_captive_portal_interface_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-captive-portal-authentication-failed-users>
    ## Returns: <dot1x-authentication-failed-users>
    ## Command: "show captive-portal authentication-failed-users"
    get_captive_portal_authentication_failed_users => $NO_ARGS,

    ## Method : <get-captive-portal-firewall-interface>
    ## Returns: <captive-portal-firewall-interface>
    ## Command: "show captive-portal firewall"
    get_captive_portal_firewall_interface => {
	interface_name => $STRING,
    },

    ## Method : <get-dcbx-information>
    ## Returns: <dcbx-information>
    ## Command: "show dcbx"
    get_dcbx_information => $NO_ARGS,

    ## Method : <get-dcbx-neighbor-information>
    ## Returns: <dcbx-neighbor-information>
    ## Command: "show dcbx neighbors"
    get_dcbx_neighbor_information => $NO_ARGS,

    ## Method : <get-dcbx-neighbor-interface-information>
    ## Returns: <dcbx-neighbor-interface-information>
    ## Command: "show dcbx neighbors interface"
    get_dcbx_neighbor_interface_information => {
	interface_name => $STRING,
    },

    ## Method : <get-dcbx-neighbor-information-terse>
    ## Returns: <dcbx-neighbor-information-terse>
    ## Command: "show dcbx neighbors terse"
    get_dcbx_neighbor_information_terse => $NO_ARGS,

    ## Method : <get-dhcp-binding-information>
    ## Returns: <dhcp-binding-information>
    ## Command: "show system services dhcp binding"
    get_dhcp_binding_information => {
	detail => $TOGGLE,
	address => $STRING,
    },

    ## Method : <get-dhcp-conflict-information>
    ## Returns: <dhcp-conflict-information>
    ## Command: "show system services dhcp conflict"
    get_dhcp_conflict_information => $NO_ARGS,

    ## Method : <get-dhcp-global-information>
    ## Returns: <dhcp-global-information>
    ## Command: "show system services dhcp global"
    get_dhcp_global_information => $NO_ARGS,

    ## Method : <get-dhcp-pool-information>
    ## Returns: <dhcp-pool-information>
    ## Command: "show system services dhcp pool"
    get_dhcp_pool_information => {
	detail => $TOGGLE,
	subnet_address => $STRING,
    },

    ## Method : <get-dhcp-statistics-information>
    ## Returns: <dhcp-statistics-information>
    ## Command: "show system services dhcp statistics"
    get_dhcp_statistics_information => $NO_ARGS,

    ## Method : <get-dhcp-client-information>
    ## Returns: <dhcp-client-information>
    ## Command: "show system services dhcp client"
    get_dhcp_client_information => {
	statistics => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-dhcp-helper-statistics>
    ## Returns: <dhcp-helper-statistics>
    ## Command: "show system services dhcp relay-statistics"
    get_dhcp_helper_statistics => $NO_ARGS,

    ## Method : <get-initialsetup-status-information>
    ## Returns: <initialsetup-status-information>
    ## Command: "show system initialsetup status"
    get_initialsetup_status_information => $NO_ARGS,

    ## Method : <get-helper-statistics>
    ## Returns: <helper-statistics>
    ## Command: "show helper statistics"
    get_helper_statistics => $NO_ARGS,

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

    ## Method : <get-static-mac-bypassed-users>
    ## Returns: <dot1x-static-mac-bypassed-users>
    ## Command: "show dot1x authentication-bypassed-users"
    get_static_mac_bypassed_users => $NO_ARGS,

    ## Method : <get-dot1x-statistics>
    ## Returns: <dot1x-statistics>
    ## Command: "show dot1x statistics"
    get_dot1x_statistics => $NO_ARGS,

    ## Method : <get-dot1x-statistics-interface>
    ## Returns: <dot1x-statistics-interface>
    ## Command: "show dot1x statistics interface"
    get_dot1x_statistics_interface => {
	interface_name => $STRING,
    },

    ## Method : <get-dot1x-firewall-interface>
    ## Returns: <dot1x-firewall-interface>
    ## Command: "show dot1x firewall"
    get_dot1x_firewall_interface => {
	interface_name => $STRING,
    },

    ## Method : <get-ethernet-switching-interface-information>
    ## Returns: <switching-interface-information>
    ## Command: "show ethernet-switching interfaces"
    get_ethernet_switching_interface_information => {
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-ethernet-switching-log-information>
    ## Returns: <ethernet-switching-mac-log-information>
    ## Command: "show ethernet-switching mac-learning-log"
    get_ethernet_switching_log_information => $NO_ARGS,

    ## Method : <get-ethernet-switching-table-information>
    ## Returns: <ethernet-switching-table-information>
    ## Command: "show ethernet-switching table"
    get_ethernet_switching_table_information => {
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	sort_by => $STRING,
    },

    ## Method : <get-interface-ethernet-switching-table>
    ## Returns: <ethernet-switching-table-information>
    ## Command: "show ethernet-switching table interface"
    get_interface_ethernet_switching_table => {
	interface_name => $STRING,
    },

    ## Method : <get-vlan-ethernet-switching-table>
    ## Returns: <ethernet-switching-table-information>
    ## Command: "show ethernet-switching table vlan"
    get_vlan_ethernet_switching_table => {
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	vlan_name => $STRING,
    },

    ## Method : <get-ethernet-switching-persistent-information>
    ## Returns: <ethernet-switching-persistent-information>
    ## Command: "show ethernet-switching table persistent-mac"
    get_ethernet_switching_persistent_information => {
	interface => $STRING,
    },

    ## Method : <get-management-vlan-ethernet-switching-table>
    ## Returns: <ethernet-switching-table-information>
    ## Command: "show ethernet-switching table management-vlan"
    get_management_vlan_ethernet_switching_table => $NO_ARGS,

    ## Method : <get-ethernet-switching-mac-notification-information>
    ## Returns: <ethernet-switching-mac-notification-information>
    ## Command: "show ethernet-switching mac-notification"
    get_ethernet_switching_mac_notification_information => $NO_ARGS,

    ## Method : <get-ethernet-switching-mac-learning-statistics>
    ## Returns: <ethernet-switching-statistics>
    ## Command: "show ethernet-switching statistics mac-learning"
    get_ethernet_switching_mac_learning_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface => $STRING,
    },

    ## Method : <get-ethernet-switching-aging-statistics>
    ## Returns: <ethernet-switching-statistics>
    ## Command: "show ethernet-switching statistics aging"
    get_ethernet_switching_aging_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-l2pt-interface-information>
    ## Returns: <layer2-protocol-tunneling-interface-information>
    ## Command: "show ethernet-switching layer2-protocol-tunneling interface"
    get_l2pt_interface_information => {
	interface_name => $STRING,
    },

    ## Method : <get-l2pt-vlan-information>
    ## Returns: <layer2-protocol-tunneling-vlan-information>
    ## Command: "show ethernet-switching layer2-protocol-tunneling vlan"
    get_l2pt_vlan_information => {
	vlan_name => $STRING,
    },

    ## Method : <get-l2pt-statistics>
    ## Returns: <layer2-protocol-tunneling-statistics>
    ## Command: "show ethernet-switching layer2-protocol-tunneling statistics"
    get_l2pt_statistics => $NO_ARGS,

    ## Method : <get-l2pt-interface-statistics>
    ## Returns: <layer2-protocol-tunneling-statistics>
    ## Command: "show ethernet-switching layer2-protocol-tunneling statistics interface"
    get_l2pt_interface_statistics => {
	interface_name => $STRING,
    },

    ## Method : <get-l2pt-vlan-statistics>
    ## Returns: <layer2-protocol-tunneling-statistics>
    ## Command: "show ethernet-switching layer2-protocol-tunneling statistics vlan"
    get_l2pt_vlan_statistics => {
	vlan_name => $STRING,
    },

    ## Method : <get-ethernet-switching-next-hop-information>
    ## Returns: <ethernet-switching-next-hop-information>
    ## Command: "show ethernet-switching next-hops"
    get_ethernet_switching_next_hop_information => {
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface_index => $STRING,
    },

    ## Method : <get-ethernet-switching-filters>
    ## Returns: <get-ethernet-switching-filters>
    ## Command: "show ethernet-switching filters"
    get_ethernet_switching_filters => $NO_ARGS,

    ## Method : <get-vlan-information>
    ## Returns: <vlan-information>
    ## Command: "show vlans"
    get_vlan_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	summary => $TOGGLE,
	sort_by => $STRING,
	vlan_name => $STRING,
    },

    ## Method : <get-management-vlan-information>
    ## Returns: <vlan-information>
    ## Command: "show vlans management-vlan"
    get_management_vlan_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-vlans-dot1q-tunneling-information>
    ## Returns: <vlan-information>
    ## Command: "show vlans dot1q-tunneling"
    get_vlans_dot1q_tunneling_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	summary => $TOGGLE,
	sort_by => $STRING,
    },

    ## Method : <get-rtg-information>
    ## Returns: <rtg-information>
    ## Command: "show redundant-trunk-group"
    get_rtg_information => $NO_ARGS,

    ## Method : <get-rtg-information-pergrp>
    ## Returns: <rtg-information-pergrp>
    ## Command: "show redundant-trunk-group group-name"
    get_rtg_information_pergrp => {
	rtg_name => $STRING,
    },

    ## Method : <get-stp-bridge-information>
    ## Returns: <stp-bridge-information>
    ## Command: "show spanning-tree bridge"
    get_stp_bridge_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	msti => $STRING,
	vlan_id => $STRING,
    },

    ## Method : <get-stp-bridge-interface-information>
    ## Returns: <stp-bridge-interface-information>
    ## Command: "show spanning-tree interface"
    get_stp_bridge_interface_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface_name => $STRING,
	msti => $STRING,
	vlan_id => $STRING,
    },

    ## Method : <get-mstp-bridge-configuration-information>
    ## Returns: <mstp-bridge-configuration-information>
    ## Command: "show spanning-tree mstp configuration"
    get_mstp_bridge_configuration_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-stp-statistics-interface-information>
    ## Returns: <stp-statistics-interface-information>
    ## Command: "show spanning-tree statistics interface"
    get_stp_statistics_interface_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-stp-vlan-interface-statistics>
    ## Returns: <stp-vlan-interface-statistics>
    ## Command: "show spanning-tree statistics vlan"
    get_stp_vlan_interface_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	vlan_id => $STRING,
    },

    ## Method : <get-ethernet-switching-authentication-whitelist-mac>
    ## Returns: <ethernet-switching-authentication-whitelist-mac>
    ## Command: "show authentication-whitelist"
    get_ethernet_switching_authentication_whitelist_mac => $NO_ARGS,

    ## Method : <get-ethernet-switching-interface-mac-addresses>
    ## Returns: <ethernet-switching-interface-mac-addresses>
    ## Command: "show authentication-whitelist interface"
    get_ethernet_switching_interface_mac_addresses => {
	interface_name => $STRING,
    },

    ## Method : <get-authentication-whitelist-mac-bypassed-users>
    ## Returns: <dot1x-authentication-whitelist-mac-bypassed-users>
    ## Command: "show authentication-whitelist authentication-bypassed-users"
    get_authentication_whitelist_mac_bypassed_users => $NO_ARGS,

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

    ## Method : <get-erp-statistics-interface-information>
    ## Returns: <erp-statistics-interface-information>
    ## Command: "show protection-group ethernet-ring statistics interface"
    get_erp_statistics_interface_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface_name => $STRING,
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

    ## Method : <get-ring-configuration>
    ## Returns: <erp-pg-configuration>
    ## Command: "show protection-group ethernet-ring configuration"
    get_ring_configuration => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	group_name => $STRING,
    },

    ## Method : <get-edge-virtual-bridging-information>
    ## Returns: <edge-virtual-bridging-information>
    ## Command: "show edge-virtual-bridging"
    get_edge_virtual_bridging_information => {
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-edge-virtual-bridging-interface-information>
    ## Returns: <edge-virtual-bridging-interface-information>
    ## Command: "show edge-virtual-bridging interface"
    get_edge_virtual_bridging_interface_information => {
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-edge-virtual-bridging-ecp-statistics>
    ## Returns: <edge-control-protocol-statistics>
    ## Command: "show edge-virtual-bridging edge-control-protocol statistics"
    get_edge_virtual_bridging_ecp_statistics => $NO_ARGS,

    ## Method : <get-edge-virtual-bridging-ecp-interface-statistics>
    ## Returns: <edge-control-protocol-interface-statistics>
    ## Command: "show edge-virtual-bridging edge-control-protocol statistics interface"
    get_edge_virtual_bridging_ecp_interface_statistics => {
	interface_name => $STRING,
    },

    ## Method : <get-edge-virtual-bridging-vsi-profiles>
    ## Returns: <edge-virtual-bridging-information>
    ## Command: "show edge-virtual-bridging vsi-profiles"
    get_edge_virtual_bridging_vsi_profiles => $NO_ARGS,

    ## Method : <get-edge-virtual-bridging-vsi-interface-profiles>
    ## Returns: <edge-virtual-bridging-interface-vsi-profiles-information>
    ## Command: "show edge-virtual-bridging vsi-profiles interface"
    get_edge_virtual_bridging_vsi_interface_profiles => {
	interface_name => $STRING,
    },

    ## Method : <get-edge-virtual-bridging-firewall-information>
    ## Returns: <edge-virtual-bridging-firewall-information>
    ## Command: "show edge-virtual-bridging firewall"
    get_edge_virtual_bridging_firewall_information => $NO_ARGS,

    ## Method : <get-edge-virtual-bridging-interface-firewall-information>
    ## Returns: <edge-virtual-bridging-firewall-information>
    ## Command: "show edge-virtual-bridging firewall interface"
    get_edge_virtual_bridging_interface_firewall_information => {
	interface_name => $STRING,
    },

    ## Method : <get-lcd-information>
    ## Returns: <craft-lcd-led-information>
    ## Command: "show chassis lcd"
    get_lcd_information => $NO_ARGS,

    ## Method : <get-lcd-fpc-information>
    ## Returns: <craft-lcd-led-information>
    ## Command: "show chassis lcd fpc-slot"
    get_lcd_fpc_information => {
	fpc_slot => $STRING,
    },

    ## Method : <get-lcd-menu-information>
    ## Returns: <lcd-information>
    ## Command: "show chassis lcd menu"
    get_lcd_menu_information => $NO_ARGS,

    ## Method : <get-led-information>
    ## Returns: <craft-lcd-led-information>
    ## Command: "show chassis led"
    get_led_information => $NO_ARGS,

    ## Method : <get-led-fpc-information>
    ## Returns: <craft-lcd-led-information>
    ## Command: "show chassis led fpc-slot"
    get_led_fpc_information => {
	fpc_slot => $STRING,
    },

    ## Method : <get-chassis-pic-mode-information>
    ## Returns: <chassis-pic-mode-information>
    ## Command: "show chassis pic-mode"
    get_chassis_pic_mode_information => $NO_ARGS,

    ## Method : <get-gvrp-information>
    ## Returns: <gvrp-information>
    ## Command: "show gvrp"
    get_gvrp_information => $NO_ARGS,

    ## Method : <get-gvrp-timers>
    ## Returns: <gvrp-timers>
    ## Command: "show gvrp timers"
    get_gvrp_timers => $NO_ARGS,

    ## Method : <get-gvrp-statistics>
    ## Returns: <gvrp-statistics>
    ## Command: "show gvrp statistics"
    get_gvrp_statistics => $NO_ARGS,

    ## Method : <get-lldp-information>
    ## Returns: <lldp-information>
    ## Command: "show lldp"
    get_lldp_information => $NO_ARGS,

    ## Method : <get-lldp-information-detail>
    ## Returns: <lldp-information-detail>
    ## Command: "show lldp detail"
    get_lldp_information_detail => $NO_ARGS,

    ## Method : <get-lldp-neighbors-information>
    ## Returns: <lldp-neighbors-information>
    ## Command: "show lldp neighbors"
    get_lldp_neighbors_information => $NO_ARGS,

    ## Method : <get-lldp-interface-neighbors-information>
    ## Returns: <lldp-neighbors-information>
    ## Command: "show lldp neighbors interface"
    get_lldp_interface_neighbors_information => {
	interface_name => $STRING,
    },

    ## Method : <get-lldp-statistics-information>
    ## Returns: <lldp-statistics-information>
    ## Command: "show lldp statistics"
    get_lldp_statistics_information => $NO_ARGS,

    ## Method : <get-lldp-interface-statistics>
    ## Returns: <lldp-stats>
    ## Command: "show lldp statistics interface"
    get_lldp_interface_statistics => {
	interface_name => $STRING,
    },

    ## Method : <get-lldp-local-info>
    ## Returns: <lldp-local-info>
    ## Command: "show lldp local-information"
    get_lldp_local_info => $NO_ARGS,

    ## Method : <get-lldp-remote-global-statistics>
    ## Returns: <lldp-remote-global-statistics>
    ## Command: "show lldp remote-global-statistics"
    get_lldp_remote_global_statistics => $NO_ARGS,

    ## Method : <get-mvrp-information>
    ## Returns: <mvrp-information>
    ## Command: "show mvrp"
    get_mvrp_information => $NO_ARGS,

    ## Method : <get-mvrp-stats>
    ## Returns: <mvrp-stats>
    ## Command: "show mvrp statistics"
    get_mvrp_stats => $NO_ARGS,

    ## Method : <get-mvrp-stats-intf>
    ## Returns: <mvrp-stats-intf>
    ## Command: "show mvrp statistics interface"
    get_mvrp_stats_intf => {
	interface_name => $STRING,
    },

    ## Method : <get-mvrp-dynamic-vlan-memberships>
    ## Returns: <mvrp-dynamic-vlan-memberships>
    ## Command: "show mvrp dynamic-vlan-memberships"
    get_mvrp_dynamic_vlan_memberships => $NO_ARGS,

    ## Method : <get-poe-interface-information>
    ## Returns: <interface-information>
    ## Command: "show poe interface"
    get_poe_interface_information => {
	interface_name => $STRING,
    },

    ## Method : <get-poe-interface-fpc-information>
    ## Returns: <poe-interface-information>
    ## Command: "show poe interface fpc-slot"
    get_poe_interface_fpc_information => {
	fpc_slot => $STRING,
    },

    ## Method : <get-telemetries-information>
    ## Returns: <telemetries-information>
    ## Command: "show poe telemetries"
    get_telemetries_information => {
	interface => $STRING,
	count => $STRING,
    },

    ## Method : <get-poe-controller-information>
    ## Returns: <poe-controller-information>
    ## Command: "show poe controller"
    get_poe_controller_information => $NO_ARGS,

    ## Method : <get-poe-notifications>
    ## Returns: <poe-notification-information>
    ## Command: "show poe notification-control"
    get_poe_notifications => $NO_ARGS,

    ## Method : <get-sflow-information>
    ## Returns: <sflow>
    ## Command: "show sflow"
    get_sflow_information => $NO_ARGS,

    ## Method : <get-sflow-collector>
    ## Returns: <sflow>
    ## Command: "show sflow collector"
    get_sflow_collector => $NO_ARGS,

    ## Method : <get-sflow-interface>
    ## Returns: <sflow>
    ## Command: "show sflow interface"
    get_sflow_interface => $NO_ARGS,

    ## Method : <get-uplink-failure-detection-information>
    ## Returns: <uplink-failure-detection-information>
    ## Command: "show uplink-failure-detection"
    get_uplink_failure_detection_information => $NO_ARGS,

    ## Method : <get-uplink-failure-detection-group-information>
    ## Returns: <uplink-failure-detection-group-information>
    ## Command: "show uplink-failure-detection group"
    get_uplink_failure_detection_group_information => {
	group_name => $STRING,
    },

    ## Method : <get-virtual-chassis-information>
    ## Returns: <virtual-chassis-information>
    ## Command: "show virtual-chassis status"
    get_virtual_chassis_information => {
	fabric => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-virtual-chassis-login>
    ## Returns: <run-command>
    ## Command: "show virtual-chassis login"
    get_virtual_chassis_login => $NO_ARGS,

    ## Method : <get-virtual-chassis-device-topology>
    ## Returns: <virtual-chassis-device-information>
    ## Command: "show virtual-chassis device-topology"
    get_virtual_chassis_device_topology => $NO_ARGS,

    ## Method : <get-virtual-chassis-packet-path>
    ## Returns: <virtual-chassis-packet-path>
    ## Command: "show virtual-chassis vc-path"
    get_virtual_chassis_packet_path => {
	source_interface => $STRING,
	destination_interface => $STRING,
    },

    ## Method : <get-virtual-chassis-active-topology>
    ## Returns: <virtual-chassis-active-topology>
    ## Command: "show virtual-chassis active-topology"
    get_virtual_chassis_active_topology => {
	fabric => $TOGGLE,
    },

    ## Method : <get-virtual-chassis-port-information>
    ## Returns: <virtual-chassis-port-information>
    ## Command: "show virtual-chassis vc-port"
    get_virtual_chassis_port_information => $NO_ARGS,

    ## Method : <get-virtual-chassis-port-lag-hash-information>
    ## Returns: <virtual-chassis-port-lag-hash-information>
    ## Command: "show virtual-chassis vc-port lag-hash"
    get_virtual_chassis_port_lag_hash_information => $NO_ARGS,

    ## Method : <get-virtual-chassis-port-statistics>
    ## Returns: <virtual-chassis-port-statistics>
    ## Command: "show virtual-chassis vc-port statistics"
    get_virtual_chassis_port_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-virtual-chassis-optics-diagnostics>
    ## Returns: <virtual-chassis-optics-diagnostics>
    ## Command: "show virtual-chassis vc-port diagnostics optics"
    get_virtual_chassis_optics_diagnostics => {
	interface_name => $STRING,
    },

    ## Method : <get-virtual-chassis-adjacency-information>
    ## Returns: <virtual-chassis-adjacency-information>
    ## Command: "show virtual-chassis protocol adjacency"
    get_virtual_chassis_adjacency_information => {
	fabric => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	provisioning => $TOGGLE,
	system_id => $STRING,
    },

    ## Method : <get-virtual-chassis-database-information>
    ## Returns: <virtual-chassis-database-information>
    ## Command: "show virtual-chassis protocol database"
    get_virtual_chassis_database_information => {
	fabric => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	provisioning => $TOGGLE,
	system_id => $STRING,
    },

    ## Method : <get-virtual-chassis-interface-information>
    ## Returns: <virtual-chassis-interface-information>
    ## Command: "show virtual-chassis protocol interface"
    get_virtual_chassis_interface_information => {
	fabric => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	provisioning => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-virtual-chassis-route-information>
    ## Returns: <virtual-chassis-route-information>
    ## Command: "show virtual-chassis protocol route"
    get_virtual_chassis_route_information => {
	provisioning => $TOGGLE,
	destination => $STRING,
    },

    ## Method : <get-virtual-chassis-statistics-information>
    ## Returns: <virtual-chassis-statistics-information>
    ## Command: "show virtual-chassis protocol statistics"
    get_virtual_chassis_statistics_information => {
	fabric => $TOGGLE,
	provisioning => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-virtual-chassis-fast-failover>
    ## Returns: <virtual-chassis-fast-failover>
    ## Command: "show virtual-chassis fast-failover"
    get_virtual_chassis_fast_failover => $NO_ARGS,

    ## Method : <get-virtual-chassis-mode-information>
    ## Returns: <virtual-chassis-mode-information>
    ## Command: "show virtual-chassis mode"
    get_virtual_chassis_mode_information => $NO_ARGS,

    ## Method : <get-logical-fabrics-inventory-device>
    ## Returns: <logical-fabrics-device-inventory>
    ## Command: "show logical-fabrics inventory device"
    get_logical_fabrics_inventory_device => {
	physical_id => $STRING,
    },

    ## Method : <get-logical-fabrics-inventory-device-vdcf>
    ## Returns: <logical-fabrics-vdcf-device-inventory>
    ## Command: "show logical-fabrics inventory device vdcf"
    get_logical_fabrics_inventory_device_vdcf => {
	vdcf_name => $STRING,
    },

    ## Method : <get-logical-fabrics-inventory-line-card-group>
    ## Returns: <line-card-group-inventory>
    ## Command: "show logical-fabrics inventory line-card-group"
    get_logical_fabrics_inventory_line_card_group => {
	vdcf => $STRING,
	line_card_group => $STRING,
    },

    ## Method : <get-logical-fabrics-inventory-local-device>
    ## Returns: <logical-fabrics-inventory-local-device-information>
    ## Command: "show logical-fabrics inventory local-device"
    get_logical_fabrics_inventory_local_device => $NO_ARGS,

    ## Method : <get-logical-fabrics-route>
    ## Returns: <logical-fabrics-route>
    ## Command: "show logical-fabrics route"
    get_logical_fabrics_route => $NO_ARGS,

    ## Method : <get-logical-fabric-device-state>
    ## Returns: <logical-fabric-device-state-information>
    ## Command: "show logical-fabrics device-state"
    get_logical_fabric_device_state => {
	physical_id => $STRING,
    },

    ## Method : <get-line-card-group-state>
    ## Returns: <line-card-group-state-information>
    ## Command: "show logical-fabrics line-card-group-state"
    get_line_card_group_state => {
	vdcf => $STRING,
	line_card_group => $STRING,
    },

    ## Method : <get-logical-fabrics-line-card-group-state-identifier>
    ## Returns: <line-card-group-state-information>
    ## Command: "show logical-fabrics line-card-group-state identifier"
    get_logical_fabrics_line_card_group_state_identifier => {
	line_card_group_id => $STRING,
    },

    ## Method : <clear-fip-snooping-vlan>
    ## Returns: <none>
    ## Command: "clear fip snooping vlan"
    clear_fip_snooping_vlan => {
	vlan => $STRING,
    },

    ## Method : <clear-fip-snooping-enode>
    ## Returns: <none>
    ## Command: "clear fip snooping enode"
    clear_fip_snooping_enode => {
	mac => $STRING,
	vlan => $STRING,
    },

    ## Method : <clear-fip-snooping-statistics>
    ## Returns: <none>
    ## Command: "clear fip snooping statistics"
    clear_fip_snooping_statistics => {
	vlan => $STRING,
    },

    ## Method : <clear-fip-snooping-vlandiscovery-statistics>
    ## Returns: <none>
    ## Command: "clear fip vlan-discovery statistics"
    clear_fip_snooping_vlandiscovery_statistics => $NO_ARGS,

    ## Method : <clear-dhcp-snooping>
    ## Returns: <none>
    ## Command: "clear dhcp snooping binding"
    clear_dhcp_snooping => {
	vlan => $STRING,
	mac => $STRING,
    },

    ## Method : <clear-dhcp-snooping-statistics>
    ## Returns: <none>
    ## Command: "clear dhcp snooping statistics"
    clear_dhcp_snooping_statistics => $NO_ARGS,

    ## Method : <clear-arp-inspection-statistics>
    ## Returns: <none>
    ## Command: "clear arp inspection statistics"
    clear_arp_inspection_statistics => {
	interface => $STRING,
    },

    ## Method : <clear-cfm-delay-statistics>
    ## Returns: <cfm-clear-delay-statistics>
    ## Command: "clear oam ethernet connectivity-fault-management delay-statistics"
    clear_cfm_delay_statistics => {
	one_way => $TOGGLE,
	two_way => $TOGGLE,
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
    },

    ## Method : <cfm-clear-statistics>
    ## Returns: <none>
    ## Command: "clear oam ethernet connectivity-fault-management statistics"
    cfm_clear_statistics => {
	interface => $STRING,
	level => $STRING,
    },

    ## Method : <clear-cfm-linktrace-path-database>
    ## Returns: <none>
    ## Command: "clear oam ethernet connectivity-fault-management path-database"
    clear_cfm_linktrace_path_database => {
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	host => $STRING,
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
    },

    ## Method : <clear-captive-portal-interface-session>
    ## Returns: <captive-portal-interface-session>
    ## Command: "clear captive-portal interface"
    clear_captive_portal_interface_session => {
	interface_name => $STRING,
    },

    ## Method : <clear-captive-portal-firewall>
    ## Returns: <captive-portal-firewall>
    ## Command: "clear captive-portal firewall"
    clear_captive_portal_firewall => {
	counter_name => $STRING,
    },

    ## Method : <clear-captive-portal-firewall-interface>
    ## Returns: <none>
    ## Command: "clear captive-portal firewall interface"
    clear_captive_portal_firewall_interface => {
	interface_name => $STRING,
    },

    ## Method : <clear-captive-portal-mac-session>
    ## Returns: <captive-portal-mac-session>
    ## Command: "clear captive-portal mac-address"
    clear_captive_portal_mac_session => {
	session_mac_addr => $STRING,
    },

    ## Method : <clear-dhcp-binding-information>
    ## Returns: <none>
    ## Command: "clear system services dhcp binding"
    clear_dhcp_binding_information => {
	address => $STRING,
    },

    ## Method : <clear-dhcp-conflict-information>
    ## Returns: <none>
    ## Command: "clear system services dhcp conflict"
    clear_dhcp_conflict_information => {
	address => $STRING,
    },

    ## Method : <clear-dhcp-statistics-information>
    ## Returns: <none>
    ## Command: "clear system services dhcp statistics"
    clear_dhcp_statistics_information => $NO_ARGS,

    ## Method : <clear-helper-statistics>
    ## Returns: <none>
    ## Command: "clear helper statistics"
    clear_helper_statistics => $NO_ARGS,

    ## Method : <clear-dot1x-interface-session>
    ## Returns: <dot1x-interface-session>
    ## Command: "clear dot1x interface"
    clear_dot1x_interface_session => {
	interface_name => $STRING,
    },

    ## Method : <clear-dot1x-firewall>
    ## Returns: <dot1x-firewall>
    ## Command: "clear dot1x firewall"
    clear_dot1x_firewall => {
	counter_name => $STRING,
    },

    ## Method : <clear-dot1x-firewall-interface>
    ## Returns: <dot1x-firewall-interface>
    ## Command: "clear dot1x firewall interface"
    clear_dot1x_firewall_interface => {
	interface_name => $STRING,
    },

    ## Method : <clear-dot1x-mac-session>
    ## Returns: <dot1x-mac-session>
    ## Command: "clear dot1x mac-address"
    clear_dot1x_mac_session => {
	static_mac_addr => $STRING,
    },

    ## Method : <clear-dot1x-statistics>
    ## Returns: <dot1x-statistics>
    ## Command: "clear dot1x statistics"
    clear_dot1x_statistics => $NO_ARGS,

    ## Method : <clear-dot1x-statistics-interface>
    ## Returns: <dot1x-statistics-interface>
    ## Command: "clear dot1x statistics interface"
    clear_dot1x_statistics_interface => {
	interface_name => $STRING,
    },

    ## Method : <clear-ethernet-switching-table>
    ## Returns: <none>
    ## Command: "clear ethernet-switching table"
    clear_ethernet_switching_table => {
	interface => $STRING,
	vlan => $STRING,
	mac => $STRING,
    },

    ## Method : <clear-ethernet-switching-table-persistent-mac>
    ## Returns: <none>
    ## Command: "clear ethernet-switching table persistent-mac"
    clear_ethernet_switching_table_persistent_mac => {
	interface => $STRING,
	mac => $STRING,
    },

    ## Method : <clear-ethernet-switching-table-management-vlan>
    ## Returns: <none>
    ## Command: "clear ethernet-switching table management-vlan"
    clear_ethernet_switching_table_management_vlan => $NO_ARGS,

    ## Method : <clear-ethernet-switching-mac-learning-statistics>
    ## Returns: <none>
    ## Command: "clear ethernet-switching statistics mac-learning"
    clear_ethernet_switching_mac_learning_statistics => {
	interface => $STRING,
    },

    ## Method : <clear-ethernet-switching-statistics-aging>
    ## Returns: <none>
    ## Command: "clear ethernet-switching statistics aging"
    clear_ethernet_switching_statistics_aging => $NO_ARGS,

    ## Method : <clear-l2pt-statistics>
    ## Returns: <none>
    ## Command: "clear ethernet-switching layer2-protocol-tunneling statistics"
    clear_l2pt_statistics => $NO_ARGS,

    ## Method : <clear-l2pt-interface-statistics>
    ## Returns: <none>
    ## Command: "clear ethernet-switching layer2-protocol-tunneling statistics interface"
    clear_l2pt_interface_statistics => {
	interface_name => $STRING,
    },

    ## Method : <clear-l2pt-vlan-statistics>
    ## Returns: <none>
    ## Command: "clear ethernet-switching layer2-protocol-tunneling statistics vlan"
    clear_l2pt_vlan_statistics => {
	vlan_name => $STRING,
    },

    ## Method : <clear-l2pt-error>
    ## Returns: <none>
    ## Command: "clear ethernet-switching layer2-protocol-tunneling error"
    clear_l2pt_error => {
	interface => $STRING,
    },

    ## Method : <clear-ethernet-switching-mac-learning-log>
    ## Returns: <none>
    ## Command: "clear ethernet-switching mac-learning-log"
    clear_ethernet_switching_mac_learning_log => $NO_ARGS,

    ## Method : <clear-ethernet-switching-port-error>
    ## Returns: <none>
    ## Command: "clear ethernet-switching port-error"
    clear_ethernet_switching_port_error => {
	interface => $STRING,
    },

    ## Method : <clear-ethernet-switching-bpdu-error>
    ## Returns: <none>
    ## Command: "clear ethernet-switching bpdu-error"
    clear_ethernet_switching_bpdu_error => {
	interface => $STRING,
    },

    ## Method : <clear-stp-statistics-interface>
    ## Returns: <none>
    ## Command: "clear spanning-tree statistics interface"
    clear_stp_statistics_interface => {
	interface_name => $STRING,
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

    ## Method : <clear-edge-virtual-bridging>
    ## Returns: <none>
    ## Command: "clear edge-virtual-bridging"
    clear_edge_virtual_bridging => {
	interface_name => $STRING,
    },

    ## Method : <clear-edge-virtual-bridging-vsi-profiles>
    ## Returns: <none>
    ## Command: "clear edge-virtual-bridging vsi-profiles"
    clear_edge_virtual_bridging_vsi_profiles => $NO_ARGS,

    ## Method : <clear-edge-virtual-bridging-vsi-profiles-interface>
    ## Returns: <none>
    ## Command: "clear edge-virtual-bridging vsi-profiles interface"
    clear_edge_virtual_bridging_vsi_profiles_interface => {
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <clear-edge-virtual-bridging-ecp-statistics>
    ## Returns: <none>
    ## Command: "clear edge-virtual-bridging edge-control-protocol statistics"
    clear_edge_virtual_bridging_ecp_statistics => {
	interface_name => $STRING,
    },

    ## Method : <clear-edge-virtual-bridging-firewall-information>
    ## Returns: <none>
    ## Command: "clear edge-virtual-bridging firewall"
    clear_edge_virtual_bridging_firewall_information => $NO_ARGS,

    ## Method : <clear-edge-virtual-bridging-firewall-interface>
    ## Returns: <none>
    ## Command: "clear edge-virtual-bridging firewall interface"
    clear_edge_virtual_bridging_firewall_interface => {
	interface_name => $STRING,
    },

    ## Method : <clear-gvrp-statistics>
    ## Returns: <none>
    ## Command: "clear gvrp statistics"
    clear_gvrp_statistics => $NO_ARGS,

    ## Method : <clear-lldp-neighbors>
    ## Returns: <none>
    ## Command: "clear lldp neighbors"
    clear_lldp_neighbors => $NO_ARGS,

    ## Method : <clear-lldp-interface-neighbors>
    ## Returns: <none>
    ## Command: "clear lldp neighbors interface"
    clear_lldp_interface_neighbors => {
	interface_name => $STRING,
    },

    ## Method : <clear-lldp-statistics>
    ## Returns: <none>
    ## Command: "clear lldp statistics"
    clear_lldp_statistics => $NO_ARGS,

    ## Method : <clear-lldp-interface-statistics>
    ## Returns: <none>
    ## Command: "clear lldp statistics interface"
    clear_lldp_interface_statistics => {
	interface_name => $STRING,
    },

    ## Method : <clear-mvrp-statistics>
    ## Returns: <mvrp-statistics>
    ## Command: "clear mvrp statistics"
    clear_mvrp_statistics => $NO_ARGS,

    ## Method : <clear-mvrp-statistics-interface>
    ## Returns: <mvrp-statistics-interface>
    ## Command: "clear mvrp statistics interface"
    clear_mvrp_statistics_interface => {
	interface_name => $STRING,
    },

    ## Method : <clear-poe-telemetries-information>
    ## Returns: <none>
    ## Command: "clear poe telemetries interface"
    clear_poe_telemetries_information => {
	interface_name => $STRING,
    },

    ## Method : <clear-sflow-collector-statistics>
    ## Returns: <none>
    ## Command: "clear sflow collector statistics"
    clear_sflow_collector_statistics => $NO_ARGS,

    ## Method : <clear-virtual-chassis-port-statistics>
    ## Returns: <clear-virtual-chassis-port-statistics>
    ## Command: "clear virtual-chassis vc-port statistics"
    clear_virtual_chassis_port_statistics => {
	interface_name => $STRING,
    },

    ## Method : <clear-virtual-chassis-statistics>
    ## Returns: <clear-virtual-chassis-statistics>
    ## Command: "clear virtual-chassis protocol statistics"
    clear_virtual_chassis_statistics => {
	provisioning => $TOGGLE,
    },

    ## Method : <load-dhcp-snooping>
    ## Returns: <none>
    ## Command: "load dhcp-snooping"
    load_dhcp_snooping => {
	filename => $STRING,
    },

    ## Method : <save-dhcp-snooping>
    ## Returns: <none>
    ## Command: "save dhcp-snooping"
    save_dhcp_snooping => {
	filename => $STRING,
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
    },

    ## Method : <renew-dhcp-client>
    ## Returns: <none>
    ## Command: "request system services dhcp renew"
    renew_dhcp_client => {
	interface_name => $STRING,
    },

    ## Method : <release-dhcp-client>
    ## Returns: <none>
    ## Command: "request system services dhcp release"
    release_dhcp_client => {
	interface_name => $STRING,
    },

    ## Method : <refresh-edge-virtual-bridging-firewall>
    ## Returns: <none>
    ## Command: "request edge-virtual-bridging firewall-refresh"
    refresh_edge_virtual_bridging_firewall => $NO_ARGS,

    ## Method : <refresh-edge-virtual-bridging-firewall-interface>
    ## Returns: <none>
    ## Command: "request edge-virtual-bridging firewall-refresh interface"
    refresh_edge_virtual_bridging_firewall_interface => {
	interface_name => $STRING,
    },

    ## Method : <request-line-card-login>
    ## Returns: <run-command>
    ## Command: "request session"
    request_line_card_login => {
	member => $STRING,
    },

    ## Method : <request-virtual-chassis-reactivate>
    ## Returns: <none>
    ## Command: "request virtual-chassis reactivate"
    request_virtual_chassis_reactivate => $NO_ARGS,

    ## Method : <request-virtual-chassis-renumber>
    ## Returns: <none>
    ## Command: "request virtual-chassis renumber"
    request_virtual_chassis_renumber => {
	member_id => $STRING,
	new_member_id => $STRING,
    },

    ## Method : <request-virtual-chassis-recycle>
    ## Returns: <none>
    ## Command: "request virtual-chassis recycle"
    request_virtual_chassis_recycle => {
	member_id => $STRING,
    },

    ## Method : <request-virtual-chassis-vc-port-set-interface>
    ## Returns: <none>
    ## Command: "request virtual-chassis vc-port set interface"
    request_virtual_chassis_vc_port_set_interface => {
	interface_name => $STRING,
	disable => $TOGGLE,
    },

    ## Method : <request-virtual-chassis-vc-port-set-pic-slot>
    ## Returns: <none>
    ## Command: "request virtual-chassis vc-port set pic-slot"
    request_virtual_chassis_vc_port_set_pic_slot => {
	pic_slot => $STRING,
	port => $STRING,
    },

    ## Method : <request-virtual-chassis-vc-port-set-fpc-slot>
    ## Returns: <none>
    ## Command: "request virtual-chassis vc-port set fpc-slot"
    request_virtual_chassis_vc_port_set_fpc_slot => {
	fpc_slot => $STRING,
	pic_slot => $STRING,
	port => $STRING,
    },

    ## Method : <request-virtual-chassis-vc-port-delete-pic-slot>
    ## Returns: <none>
    ## Command: "request virtual-chassis vc-port delete pic-slot"
    request_virtual_chassis_vc_port_delete_pic_slot => {
	pic_slot => $STRING,
	port => $STRING,
    },

    ## Method : <request-virtual-chassis-vc-port-delete-fpc-slot>
    ## Returns: <none>
    ## Command: "request virtual-chassis vc-port delete fpc-slot"
    request_virtual_chassis_vc_port_delete_fpc_slot => {
	fpc_slot => $STRING,
	pic_slot => $STRING,
	port => $STRING,
    },

    ## Method : <request-virtual-chassis-mode-mixed>
    ## Returns: <none>
    ## Command: "request virtual-chassis mode mixed"
    request_virtual_chassis_mode_mixed => {
	disable => $TOGGLE,
    },

    ## Method : <set-virtual-chassis-member-id>
    ## Returns: <none>
    ## Command: "request virtual-chassis member-id set"
    set_virtual_chassis_member_id => {
	member => $STRING,
    },

    ## Method : <delete-virtual-chassis-member-id>
    ## Returns: <none>
    ## Command: "request virtual-chassis member-id delete"
    delete_virtual_chassis_member_id => $NO_ARGS,

    ## Method : <get-virtual-chassis-diagnostic-information>
    ## Returns: <virtual-chassis-diagnostic-information>
    ## Command: "request virtual-chassis device-reachability"
    get_virtual_chassis_diagnostic_information => {
	test_name => $STRING,
	destination_device => $STRING,
	destination_fpc => $STRING,
	destination_ip_address => $STRING,
	source_fpc => $STRING,
	source_ip_address => $STRING,
	probe_size => $STRING,
	probe_count => $STRING,
	probe_pattern => $STRING,
	probe_interval => $STRING,
	test_interval => $STRING,
	test_count => $STRING,
    },

    ## Method : <set-chassis-pic-mode-to-intraconnect>
    ## Returns: <none>
    ## Command: "request chassis pic-mode intraconnect"
    set_chassis_pic_mode_to_intraconnect => $NO_ARGS,

    ## Method : <set-chassis-pic-mode-to-vc>
    ## Returns: <none>
    ## Command: "request chassis pic-mode virtual-chassis"
    set_chassis_pic_mode_to_vc => $NO_ARGS,

    ## Method : <set-virtual-chassis-mode>
    ## Returns: <none>
    ## Command: "set chassis virtual-chassis"
    set_virtual_chassis_mode => {
	disable => $TOGGLE,
	local => $TOGGLE,
    },

);
1;
