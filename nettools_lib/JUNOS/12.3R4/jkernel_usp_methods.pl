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
# FILE: jkernel_usp_methods.pl -- generated automagikally; DO NOT EDIT
#

%jkernel_usp_methods = (
    ## Method : <clear-alg-h323-counters>
    ## Returns: <none>
    ## Command: "clear security alg h323 counters"
    clear_alg_h323_counters => $NO_ARGS,

    ## Method : <clear-alg-mgcp-counter-information>
    ## Returns: <none>
    ## Command: "clear security alg mgcp counters"
    clear_alg_mgcp_counter_information => $NO_ARGS,

    ## Method : <clear-alg-mgcp-calls-information>
    ## Returns: <none>
    ## Command: "clear security alg mgcp calls"
    clear_alg_mgcp_calls_information => $NO_ARGS,

    ## Method : <clear-alg-sccp-counters>
    ## Returns: <none>
    ## Command: "clear security alg sccp counters"
    clear_alg_sccp_counters => $NO_ARGS,

    ## Method : <clear-alg-sccp-calls-information>
    ## Returns: <none>
    ## Command: "clear security alg sccp calls"
    clear_alg_sccp_calls_information => $NO_ARGS,

    ## Method : <clear-alg-sip-counters>
    ## Returns: <none>
    ## Command: "clear security alg sip counters"
    clear_alg_sip_counters => $NO_ARGS,

    ## Method : <clear-alg-sip-calls>
    ## Returns: <none>
    ## Command: "clear security alg sip calls"
    clear_alg_sip_calls => $NO_ARGS,

    ## Method : <clear-alg-ike-esp-state>
    ## Returns: <alg-ike-esp-clear>
    ## Command: "clear security alg ike-esp-nat"
    clear_alg_ike_esp_state => $NO_ARGS,

    ## Method : <clear-application-firewall-statistics>
    ## Returns: <none>
    ## Command: "clear security application-firewall rule-set statistics"
    clear_application_firewall_statistics => {
	logical_system => $STRING,
    },

    ## Method : <clear-avt-counters>
    ## Returns: <none>
    ## Command: "clear security application-tracking counters"
    clear_avt_counters => $NO_ARGS,

    ## Method : <clear-anti-virus>
    ## Returns: <none>
    ## Command: "clear security utm anti-virus statistics"
    clear_anti_virus => $NO_ARGS,

    ## Method : <clear-anti-spam-clear>
    ## Returns: <none>
    ## Command: "clear security utm anti-spam statistics"
    clear_anti_spam_clear => $NO_ARGS,

    ## Method : <clear-web-filter-clear>
    ## Returns: <none>
    ## Command: "clear security utm web-filtering statistics"
    clear_web_filter_clear => $NO_ARGS,

    ## Method : <clear-content-filter>
    ## Returns: <none>
    ## Command: "clear security utm content-filtering statistics"
    clear_content_filter => $NO_ARGS,

    ## Method : <clear-all-dvpn-user-connections>
    ## Returns: <clear-all-dvpn-user-connection-information>
    ## Command: "clear security dynamic-vpn all"
    clear_all_dvpn_user_connections => $NO_ARGS,

    ## Method : <clear-dvpn-user-connection-by-username>
    ## Returns: <clear-dvpn-user-connection-information>
    ## Command: "clear security dynamic-vpn user"
    clear_dvpn_user_connection_by_username => {
	username => $STRING,
	ike_id => $STRING,
    },

    ## Method : <clear-security-dynamic-policies-statistics>
    ## Returns: <none>
    ## Command: "clear security dynamic-policies statistics"
    clear_security_dynamic_policies_statistics => $NO_ARGS,

    ## Method : <clear-flow-session>
    ## Returns: <clear-flow-session-information>
    ## Command: "clear security flow session"
    clear_flow_session => {
	destination_prefix => $STRING,
	source_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	application => $STRING,
	idp => $TOGGLE,
	tunnel => $TOGGLE,
	nat => $TOGGLE,
	services_offload => $TOGGLE,
	resource_manager => $TOGGLE,
	application_firewall => $TOGGLE,
	application_traffic_control => $TOGGLE,
	interface => $STRING,
	family => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <clear-flow-session-all>
    ## Returns: <clear-flow-session-information>
    ## Command: "clear security flow session all"
    clear_flow_session_all => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <clear-flow-session-by-session-identifier>
    ## Returns: <clear-flow-session-information>
    ## Command: "clear security flow session session-identifier"
    clear_flow_session_by_session_identifier => {
	session_identifier => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <clear-security-flow-ip-action>
    ## Returns: <none>
    ## Command: "clear security flow ip-action"
    clear_security_flow_ip_action => {
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	family => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <clear-flow-ipaction-all>
    ## Returns: <clear-flow-ipaction-information>
    ## Command: "clear security flow ip-action all"
    clear_flow_ipaction_all => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <clear-security-flow-statistics>
    ## Returns: <none>
    ## Command: "clear security flow statistics"
    clear_security_flow_statistics => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <clear-security-firewall-authentication-users>
    ## Returns: <none>
    ## Command: "clear security firewall-authentication users"
    clear_security_firewall_authentication_users => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	identifier => $STRING,
	address => $STRING,
    },

    ## Method : <clear-security-firewall-authentication-history>
    ## Returns: <none>
    ## Command: "clear security firewall-authentication history"
    clear_security_firewall_authentication_history => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	identifier => $STRING,
	address => $STRING,
    },

    ## Method : <clear-screen-statistics>
    ## Returns: <clear-ids-statistics-information>
    ## Command: "clear security screen statistics"
    clear_screen_statistics => {
	zone => $STRING,
	interface => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <clear-incoming-table-information>
    ## Returns: <incoming-table-information>
    ## Command: "clear security nat incoming-table"
    clear_incoming_table_information => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <clear-destination-nat-rule-sets-information>
    ## Returns: <Clear_destination-nat-rule-sets-information>
    ## Command: "clear security nat statistics destination rule"
    clear_destination_nat_rule_sets_information => {
	rule_name => $STRING,
	all => $TOGGLE,
    },

    ## Method : <clear-destination-nat-pool-information>
    ## Returns: <destination-nat-pool-information>
    ## Command: "clear security nat statistics destination pool"
    clear_destination_nat_pool_information => {
	pool_name => $STRING,
	all => $TOGGLE,
    },

    ## Method : <clear-static-nat-rule-sets-information>
    ## Returns: <Clear_static-nat-rule-sets-information>
    ## Command: "clear security nat statistics static rule"
    clear_static_nat_rule_sets_information => {
	rule_name => $STRING,
	all => $TOGGLE,
    },

    ## Method : <clear-source-nat-rule-sets-information>
    ## Returns: <Clear_source-nat-rule-sets-information>
    ## Command: "clear security nat statistics source rule"
    clear_source_nat_rule_sets_information => {
	rule_name => $STRING,
	all => $TOGGLE,
    },

    ## Method : <clear-source-nat-pool-information>
    ## Returns: <source-nat-pool-information>
    ## Command: "clear security nat statistics source pool"
    clear_source_nat_pool_information => {
	pool_name => $STRING,
	all => $TOGGLE,
    },

    ## Method : <clear-persist-nat-all>
    ## Returns: <persist-nat-all>
    ## Command: "clear security nat source persistent-nat-table all"
    clear_persist_nat_all => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <clear-persist-nat-pool-information>
    ## Returns: <persist-nat-pool-information>
    ## Command: "clear security nat source persistent-nat-table pool"
    clear_persist_nat_pool_information => {
	pool_name => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <clear-persist-nat-interface-information>
    ## Returns: <persist-nat-interface-information>
    ## Command: "clear security nat source persistent-nat-table interface"
    clear_persist_nat_interface_information => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <clear-persist-nat-ip-port-information>
    ## Returns: <persist-nat-ip-port-information>
    ## Command: "clear security nat source persistent-nat-table internal-ip"
    clear_persist_nat_ip_port_information => {
	ip => $STRING,
	internal_port => $STRING,
	internal_protocol => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <clear-security-policies-statistics>
    ## Returns: <none>
    ## Command: "clear security policies statistics"
    clear_security_policies_statistics => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <clear-security-policies-hit-count>
    ## Returns: <none>
    ## Command: "clear security policies hit-count"
    clear_security_policies_hit_count => {
	from_zone => $STRING,
	to_zone => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <clear-security-log-hpl-information>
    ## Returns: <clear>
    ## Command: "clear security log file"
    clear_security_log_hpl_information => $NO_ARGS,

    ## Method : <clear-userfw-local-auth-table>
    ## Returns: <none>
    ## Command: "clear security user-identification local-authentication-table"
    clear_userfw_local_auth_table => $NO_ARGS,

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

    ## Method : <clear-wlan-access-points-neighbors>
    ## Returns: <none>
    ## Command: "clear wlan access-point neighbors"
    clear_wlan_access_points_neighbors => {
	wlan_access_point_name => $STRING,
    },

    ## Method : <clear-retag-statistics>
    ## Returns: <clear-vlan-retag-statistics-information>
    ## Command: "clear bridge rewrite statistics"
    clear_retag_statistics => {
	interface => $STRING,
	vlan_id => $STRING,
	clear_all => $TOGGLE,
    },

    ## Method : <get-alg-status>
    ## Returns: <alg-status>
    ## Command: "show security alg status"
    get_alg_status => $NO_ARGS,

    ## Method : <get-alg-h323-counters>
    ## Returns: <alg-h323-counters>
    ## Command: "show security alg h323 counters"
    get_alg_h323_counters => $NO_ARGS,

    ## Method : <get-alg-mgcp-call-information>
    ## Returns: <alg-mgcp-call-information>
    ## Command: "show security alg mgcp calls"
    get_alg_mgcp_call_information => {
	endpoint => $STRING,
    },

    ## Method : <get-alg-mgcp-counter-information>
    ## Returns: <alg-mgcp-counter-information>
    ## Command: "show security alg mgcp counters"
    get_alg_mgcp_counter_information => $NO_ARGS,

    ## Method : <get-alg-mgcp-endpoint-information>
    ## Returns: <alg-mgcp-endpoint-information>
    ## Command: "show security alg mgcp endpoints"
    get_alg_mgcp_endpoint_information => {
	endpoint_name => $STRING,
    },

    ## Method : <get-alg-msrpc-uuid2oid-table>
    ## Returns: <alg-msrpc-uuid2oid-table>
    ## Command: "show security alg msrpc object-id-map"
    get_alg_msrpc_uuid2oid_table => $NO_ARGS,

    ## Method : <get-alg-sccp-calls>
    ## Returns: <alg-sccp-calls>
    ## Command: "show security alg sccp calls"
    get_alg_sccp_calls => {
	detail => $TOGGLE,
	brief => $TOGGLE,
    },

    ## Method : <get-alg-sccp-counters>
    ## Returns: <alg-sccp-counters>
    ## Command: "show security alg sccp counters"
    get_alg_sccp_counters => $NO_ARGS,

    ## Method : <get-alg-sip-call-information>
    ## Returns: <alg-sip-call-information>
    ## Command: "show security alg sip calls"
    get_alg_sip_call_information => {
	detail => $TOGGLE,
	brief => $TOGGLE,
    },

    ## Method : <get-alg-sip-counter-information>
    ## Returns: <alg-sip-counter-information>
    ## Command: "show security alg sip counters"
    get_alg_sip_counter_information => $NO_ARGS,

    ## Method : <get-alg-sip-rate-information>
    ## Returns: <alg-sip-rate-information>
    ## Command: "show security alg sip rate"
    get_alg_sip_rate_information => $NO_ARGS,

    ## Method : <show-alg-ike-esp-state>
    ## Returns: <alg-ike-esp-show>
    ## Command: "show security alg ike-esp-nat"
    show_alg_ike_esp_state => $NO_ARGS,

    ## Method : <show-alg-ike-esp-summary>
    ## Returns: <alg-ike-esp-show-summary>
    ## Command: "show security alg ike-esp-nat summary"
    show_alg_ike_esp_summary => $NO_ARGS,

    ## Method : <get-appfw-rule-set>
    ## Returns: <security-appfw-rule-set>
    ## Command: "show security application-firewall rule-set"
    get_appfw_rule_set => {
	rule_set_name => $STRING,
	all => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <get-avt-counters>
    ## Returns: <avt-counters>
    ## Command: "show security application-tracking counters"
    get_avt_counters => $NO_ARGS,

    ## Method : <show-utmd-status>
    ## Returns: <utmd-status>
    ## Command: "show security utm status"
    show_utmd_status => $NO_ARGS,

    ## Method : <show-utmd-session>
    ## Returns: <utmd-session>
    ## Command: "show security utm session"
    show_utmd_session => $NO_ARGS,

    ## Method : <show-anti-virus>
    ## Returns: nothing
    ## Command: "show security utm anti-virus"
    show_anti_virus => $NO_ARGS,

    ## Method : <show-anti-virus-statistics>
    ## Returns: <anti-virus-statistics>
    ## Command: "show security utm anti-virus statistics"
    show_anti_virus_statistics => $NO_ARGS,

    ## Method : <show-anti-virus-status>
    ## Returns: <anti-virus-status>
    ## Command: "show security utm anti-virus status"
    show_anti_virus_status => $NO_ARGS,

    ## Method : <show-anti-virus-status-detail>
    ## Returns: <anti-virus-status-detail>
    ## Command: "show security utm anti-virus status detail"
    show_anti_virus_status_detail => $NO_ARGS,

    ## Method : <show-web-filtering>
    ## Returns: nothing
    ## Command: "show security utm web-filtering"
    show_web_filtering => $NO_ARGS,

    ## Method : <show-web-filtering-statistics>
    ## Returns: <web-filtering-statistics>
    ## Command: "show security utm web-filtering statistics"
    show_web_filtering_statistics => $NO_ARGS,

    ## Method : <show-web-filtering-status>
    ## Returns: <web-filtering-status>
    ## Command: "show security utm web-filtering status"
    show_web_filtering_status => $NO_ARGS,

    ## Method : <show-content-filtering>
    ## Returns: nothing
    ## Command: "show security utm content-filtering"
    show_content_filtering => $NO_ARGS,

    ## Method : <show-content-filtering-statistics>
    ## Returns: <show-content-filtering-statistics>
    ## Command: "show security utm content-filtering statistics"
    show_content_filtering_statistics => $NO_ARGS,

    ## Method : <show-anti-spam>
    ## Returns: nothing
    ## Command: "show security utm anti-spam"
    show_anti_spam => $NO_ARGS,

    ## Method : <show-anti-spam-statistics>
    ## Returns: <anti-spam-statistics>
    ## Command: "show security utm anti-spam statistics"
    show_anti_spam_statistics => $NO_ARGS,

    ## Method : <show-anti-spam-status>
    ## Returns: <anti-spam-status>
    ## Command: "show security utm anti-spam status"
    show_anti_spam_status => $NO_ARGS,

    ## Method : <show-ds-lite-softwire-sc-infomation>
    ## Returns: <ds-lite-softwire-sc-information>
    ## Command: "show security softwires"
    show_ds_lite_softwire_sc_infomation => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <show-ds-lite-softwire-one-sc-information>
    ## Returns: <ds-lite-softwire-one-sc-information>
    ## Command: "show security softwires softwire-name"
    show_ds_lite_softwire_one_sc_information => {
	softwire_name_str => $STRING,
	start_id => $STRING,
	count => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-user-connection>
    ## Returns: <dvpn-users-information>
    ## Command: "show security dynamic-vpn users"
    get_user_connection => {
	terse => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-client-version>
    ## Returns: <dvpn-client-version>
    ## Command: "show security dynamic-vpn client version"
    get_client_version => $NO_ARGS,

    ## Method : <get-firewall-dynamic-policies>
    ## Returns: <security-dynamic-policies>
    ## Command: "show security dynamic-policies"
    get_firewall_dynamic_policies => {
	from_zone => $STRING,
	to_zone => $STRING,
	detail => $TOGGLE,
	scope_id => $STRING,
    },

    ## Method : <get-flow-statistics-all>
    ## Returns: <flow-statistics-all>
    ## Command: "show security flow statistics"
    get_flow_statistics_all => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-flow-status-all>
    ## Returns: <flow-status-all>
    ## Command: "show security flow status"
    get_flow_status_all => $NO_ARGS,

    ## Method : <get-flow-gate-information>
    ## Returns: <flow-gate-information>
    ## Command: "show security flow gate"
    get_flow_gate_information => {
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	family => $STRING,
	summary => $TOGGLE,
	brief => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-flow-cp-session>
    ## Returns: <flow-cp-session>
    ## Command: "show security flow cp-session"
    get_flow_cp_session => {
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	family => $STRING,
	summary => $TOGGLE,
	terse => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-flow-session-information>
    ## Returns: <flow-session-information>
    ## Command: "show security flow session"
    get_flow_session_information => {
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	summary => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	encrypted => $TOGGLE,
	idp => $TOGGLE,
	tunnel => $TOGGLE,
	nat => $TOGGLE,
	services_offload => $TOGGLE,
	resource_manager => $TOGGLE,
	application_firewall => $TOGGLE,
	application_traffic_control => $TOGGLE,
	application => $STRING,
	family => $STRING,
	interface => $STRING,
	application_firewall_rule_set => $STRING,
	application_traffic_control_rule_set => $STRING,
	dynamic_application => $STRING,
	dynamic_application_group => $STRING,
	start_identifier => $STRING,
	count => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-flow-session-by-identifier>
    ## Returns: <flow-session-information>
    ## Command: "show security flow session session-identifier"
    get_flow_session_by_identifier => {
	session_identifier => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-flow-ipaction-information>
    ## Returns: <flow-ipaction-information>
    ## Command: "show security flow ip-action"
    get_flow_ipaction_information => {
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	family => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
	brief => $TOGGLE,
    },

    ## Method : <get-flow-ipaction-information-all>
    ## Returns: <flow-ipaction-information>
    ## Command: "show security flow ip-action all"
    get_flow_ipaction_information_all => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-firewall-authentication-users>
    ## Returns: <firewall-authentication-users>
    ## Command: "show security firewall-authentication users"
    get_firewall_authentication_users => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	get_firewall_authentication_users_specific => $STRING,
	get_firewall_authentication_users_specific => $STRING,
	from_zone => $STRING,
	to_zone => $STRING,
    },

    ## Method : <get-firewall-authentication-history>
    ## Returns: <firewall-authentication-history>
    ## Command: "show security firewall-authentication history"
    get_firewall_authentication_history => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	get_firewall_authentication_history_specific => $STRING,
	get_firewall_authentication_history_specific => $STRING,
	from_zone => $STRING,
	to_zone => $STRING,
    },

    ## Method : <get-security-screen-ids-status>
    ## Returns: <show-ids-status>
    ## Command: "show security screen ids-option"
    get_security_screen_ids_status => {
	screen_name => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-ids-statistics>
    ## Returns: <ids-statistics>
    ## Command: "show security screen statistics"
    get_ids_statistics => {
	zone => $STRING,
	interface => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-destination-nat-pool-information>
    ## Returns: <destination-nat-pool-information>
    ## Command: "show security nat destination pool"
    get_destination_nat_pool_information => {
	pool_name => $STRING,
	all => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-destination-nat-rule-sets-information>
    ## Returns: <destination-nat-rule-sets>
    ## Command: "show security nat destination rule"
    get_destination_nat_rule_sets_information => {
	rule_name => $STRING,
	all => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <retrieve-destination-nat-summary-information>
    ## Returns: <destination-nat-summary-information>
    ## Command: "show security nat destination summary"
    retrieve_destination_nat_summary_information => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <retrieve-source-nat-pool-information>
    ## Returns: <source-nat-pool-information>
    ## Command: "show security nat source pool"
    retrieve_source_nat_pool_information => {
	pool_name => $STRING,
	all => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-persist-nat-all>
    ## Returns: <persist-nat-all>
    ## Command: "show security nat source persistent-nat-table all"
    get_persist_nat_all => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	family => $STRING,
    },

    ## Method : <get-persist-nat-sum>
    ## Returns: <persist-nat-sum>
    ## Command: "show security nat source persistent-nat-table summary"
    get_persist_nat_sum => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <retrieve-persist-nat-pool-information>
    ## Returns: <persist-nat-pool-information>
    ## Command: "show security nat source persistent-nat-table pool"
    retrieve_persist_nat_pool_information => {
	pool_name => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-persist-nat-interface-information>
    ## Returns: <source-nat-summary>
    ## Command: "show security nat source persistent-nat-table interface"
    get_persist_nat_interface_information => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <retrieve-persist-nat-ip-port-information>
    ## Returns: <persist-nat-ip-port-information>
    ## Command: "show security nat source persistent-nat-table internal-ip"
    retrieve_persist_nat_ip_port_information => {
	ip => $STRING,
	internal_port => $STRING,
	internal_protocol => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-source-nat-rule-sets-information>
    ## Returns: <source-nat-rule-sets-information>
    ## Command: "show security nat source rule"
    get_source_nat_rule_sets_information => {
	rule_name => $STRING,
	all => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <retrieve-source-nat-summary>
    ## Returns: <source-nat-summary>
    ## Command: "show security nat source summary"
    retrieve_source_nat_summary => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-static-nat-rule-information>
    ## Returns: <static-nat-rule-information>
    ## Command: "show security nat static rule"
    get_static_nat_rule_information => {
	rule_name => $STRING,
	all => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-interface-nat-ports-information>
    ## Returns: <interface-nat-ports-information>
    ## Command: "show security nat interface-nat-ports"
    get_interface_nat_ports_information => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-firewall-policies>
    ## Returns: <security-policies>
    ## Command: "show security policies"
    get_firewall_policies => {
	from_zone => $STRING,
	to_zone => $STRING,
	policy_name => $STRING,
	detail => $TOGGLE,
	zone_context => $TOGGLE,
	start => $STRING,
	count => $STRING,
	application_firewall => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-security-policies-hit-count>
    ## Returns: <policy-hit-count>
    ## Command: "show security policies hit-count"
    get_security_policies_hit_count => {
	from_zone => $STRING,
	to_zone => $STRING,
	ascending => $TOGGLE,
	descending => $TOGGLE,
	less_than => $STRING,
	greater_than => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-global-firewall-policies>
    ## Returns: <security-global-policies>
    ## Command: "show security policies global"
    get_global_firewall_policies => {
	policy_name => $STRING,
	detail => $TOGGLE,
	zone_context => $TOGGLE,
	start => $STRING,
	count => $STRING,
	application_firewall => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <match-firewall-policies>
    ## Returns: <security-policy-match>
    ## Command: "show security match-policies"
    match_firewall_policies => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	from_zone => $STRING,
	to_zone => $STRING,
	source_identity => $STRING,
	source_ip => $STRING,
	destination_ip => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	result_count => $STRING,
    },

    ## Method : <match-global-policies>
    ## Returns: <global-policy-match>
    ## Command: "show security match-policies global"
    match_global_policies => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	source_ip => $STRING,
	destination_ip => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	result_count => $STRING,
    },

    ## Method : <get-resmgr-group-active>
    ## Returns: <resmgr-group-active>
    ## Command: "show security resource-manager group active"
    get_resmgr_group_active => {
	group_number => $STRING,
    },

    ## Method : <get-resmgr-resource-active>
    ## Returns: <resmgr-resource-active>
    ## Command: "show security resource-manager resource active"
    get_resmgr_resource_active => {
	resource_number => $STRING,
    },

    ## Method : <get-resmgr-settings>
    ## Returns: <resmgr-settings>
    ## Command: "show security resource-manager settings"
    get_resmgr_settings => $NO_ARGS,

    ## Method : <get-resource-manager-summary>
    ## Returns: <resource-manager-summary-information>
    ## Command: "show security resource-manager summary"
    get_resource_manager_summary => $NO_ARGS,

    ## Method : <show-security-hpl-infile>
    ## Returns: <show-hpl-infile>
    ## Command: "show security log file"
    show_security_hpl_infile => {
	file_name => $STRING,
    },

    ## Method : <show-security-hpl-infile-last>
    ## Returns: <show-hpl-infile>
    ## Command: "show security log file last"
    show_security_hpl_infile_last => {
	seconds => $STRING,
    },

    ## Method : <get-spu-monitoring-information>
    ## Returns: <spu-monitroing-information>
    ## Command: "show security monitoring fpc"
    get_spu_monitoring_information => {
	fpc_slot => $STRING,
    },

    ## Method : <get-performance-spu-information>
    ## Returns: <performance-spu-information>
    ## Command: "show security monitoring performance spu"
    get_performance_spu_information => {
	fpc => $STRING,
	pic => $STRING,
    },

    ## Method : <get-performance-session-information>
    ## Returns: <performance-session-information>
    ## Command: "show security monitoring performance session"
    get_performance_session_information => {
	fpc => $STRING,
	pic => $STRING,
    },

    ## Method : <get-userfw-local-auth-table-all>
    ## Returns: <user-identification>
    ## Command: "show security user-identification local-authentication-table all"
    get_userfw_local_auth_table_all => {
	brief => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-userfw-local-auth-table-ip>
    ## Returns: <user-identification>
    ## Command: "show security user-identification local-authentication-table ip-address"
    get_userfw_local_auth_table_ip => {
	ip_address => $STRING,
    },

    ## Method : <get-userfw-local-auth-table-user>
    ## Returns: <user-identification>
    ## Command: "show security user-identification local-authentication-table user"
    get_userfw_local_auth_table_user => {
	user_name => $STRING,
    },

    ## Method : <get-userfw-local-auth-table-role>
    ## Returns: <user-identification>
    ## Command: "show security user-identification local-authentication-table role"
    get_userfw_local_auth_table_role => {
	role_name => $STRING,
    },

    ## Method : <get-userfw-local-auth-table-start>
    ## Returns: <user-identification>
    ## Command: "show security user-identification local-authentication-table start"
    get_userfw_local_auth_table_start => {
	start => $STRING,
	count => $STRING,
    },

    ## Method : <get-userfw-role-info>
    ## Returns: <userfw-role-info>
    ## Command: "show security user-identification role-provision"
    get_userfw_role_info => {
	all => $TOGGLE,
    },

    ## Method : <get-zones-information>
    ## Returns: <zones-information>
    ## Command: "show security zones"
    get_zones_information => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	get_zones_named_information => $STRING,
	type => $STRING,
	terse => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-system-autorecovery>
    ## Returns: <autorecovery-information>
    ## Command: "show system autorecovery"
    get_system_autorecovery => $NO_ARGS,

    ## Method : <get-system-autorecovery-state>
    ## Returns: <autorecovery>
    ## Command: "show system autorecovery state"
    get_system_autorecovery_state => $NO_ARGS,

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

    ## Method : <get-download-information>
    ## Returns: <download-information>
    ## Command: "show system download"
    get_download_information => {
	download_id => $STRING,
    },

    ## Method : <get-lsys-license-status>
    ## Returns: <lsys-license-status>
    ## Command: "show system license status"
    get_lsys_license_status => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-security-profile-all-resource-information>
    ## Returns: <security-profile-all-resource-information>
    ## Command: "show system security-profile all-resource"
    get_security_profile_all_resource_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-auth-entry-information>
    ## Returns: <security-profile-auth-entry-information>
    ## Command: "show system security-profile auth-entry"
    get_security_profile_auth_entry_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-zone-information>
    ## Returns: <security-profile-zone-information>
    ## Command: "show system security-profile zone"
    get_security_profile_zone_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-policy-information>
    ## Returns: <security-profile-policy-information>
    ## Command: "show system security-profile policy"
    get_security_profile_policy_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-policy-with-count-information>
    ## Returns: <security-profile-policy-with-count-information>
    ## Command: "show system security-profile policy-with-count"
    get_security_profile_policy_with_count_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-appfw-rule-set-information>
    ## Returns: <security-profile-appfw-rule-set-information>
    ## Command: "show system security-profile appfw-rule-set"
    get_security_profile_appfw_rule_set_information => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
	terse => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-security-profile-appfw-rule-information>
    ## Returns: <security-profile-appfw-rule-information>
    ## Command: "show system security-profile appfw-rule"
    get_security_profile_appfw_rule_information => {
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
	terse => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-security-profile-scheduler-information>
    ## Returns: <security-profile-scheduler-information>
    ## Command: "show system security-profile scheduler"
    get_security_profile_scheduler_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-nat-source-pool-information>
    ## Returns: <security-profile-nat-source-pool-information>
    ## Command: "show system security-profile nat-source-pool"
    get_security_profile_nat_source_pool_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-nat-destination-pool-information>
    ## Returns: <security-profile-nat-destination-pool-information>
    ## Command: "show system security-profile nat-destination-pool"
    get_security_profile_nat_destination_pool_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-nat-pat-address-information>
    ## Returns: <security-profile-nat-pat-address-information>
    ## Command: "show system security-profile nat-pat-address"
    get_security_profile_nat_pat_address_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-nat-nopat-address-information>
    ## Returns: <security-profile-nat-nopat-address-information>
    ## Command: "show system security-profile nat-nopat-address"
    get_security_profile_nat_nopat_address_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-nat-pat-portnum-information>
    ## Returns: <security-profile-nat-pat-portnum-information>
    ## Command: "show system security-profile nat-pat-portnum"
    get_security_profile_nat_pat_portnum_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-nat-source-rule-information>
    ## Returns: <security-profile-nat-source-rule-information>
    ## Command: "show system security-profile nat-source-rule"
    get_security_profile_nat_source_rule_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-nat-destination-rule-information>
    ## Returns: <security-profile-nat-destination-rule-information>
    ## Command: "show system security-profile nat-destination-rule"
    get_security_profile_nat_destination_rule_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-nat-static-rule-information>
    ## Returns: <security-profile-nat-static-rule-information>
    ## Command: "show system security-profile nat-static-rule"
    get_security_profile_nat_static_rule_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-nat-rule-referenced-prefix-information>
    ## Returns: <security-profile-nat-rule-referenced-prefix-information>
    ## Command: "show system security-profile nat-rule-referenced-prefix"
    get_security_profile_nat_rule_referenced_prefix_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-nat-cone-binding-information>
    ## Returns: <security-profile-nat-cone-binding-information>
    ## Command: "show system security-profile nat-cone-binding"
    get_security_profile_nat_cone_binding_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-nat-port-ol-ipnumber-information>
    ## Returns: <security-profile-nat-port-ol-ipnumber-information>
    ## Command: "show system security-profile nat-port-ol-ipnumber"
    get_security_profile_nat_port_ol_ipnumber_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-flow-session-information>
    ## Returns: <security-profile-flow-session-information>
    ## Command: "show system security-profile flow-session"
    get_security_profile_flow_session_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-flow-gate-information>
    ## Returns: <security-profile-flow-gate-information>
    ## Command: "show system security-profile flow-gate"
    get_security_profile_flow_gate_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-cpu-information>
    ## Returns: <security-profile-cpu-information>
    ## Command: "show system security-profile cpu"
    get_security_profile_cpu_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-dslite-softwire-initiator-information>
    ## Returns: <security-profile-dslite-softwire-initiator-information>
    ## Command: "show system security-profile dslite-softwire-initiator"
    get_security_profile_dslite_softwire_initiator_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-security-profile-address-book-information>
    ## Returns: <security-profile-address-book-information>
    ## Command: "show system security-profile address-book"
    get_security_profile_address_book_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-schedulers>
    ## Returns: <schedulers>
    ## Command: "show schedulers"
    get_schedulers => {
	scheduler_name => $STRING,
	logical_system => $STRING,
	root_logical_system => $TOGGLE,
    },

    ## Method : <get-smtp-configuration>
    ## Returns: <smtp-configuration>
    ## Command: "show smtp servers"
    get_smtp_configuration => $NO_ARGS,

    ## Method : <get-smtp-statistics>
    ## Returns: <smtp-statistics>
    ## Command: "show smtp statistics"
    get_smtp_statistics => $NO_ARGS,

    ## Method : <get-poe-interface-information>
    ## Returns: <interface-information>
    ## Command: "show poe interface"
    get_poe_interface_information => {
	ifname => $STRING,
    },

    ## Method : <get-telemetries-information>
    ## Returns: <telemetries-information>
    ## Command: "show poe telemetries interface"
    get_telemetries_information => {
	ifname => $STRING,
	all => $TOGGLE,
	entries => $TOGGLE,
    },

    ## Method : <get-poe-controller-information>
    ## Returns: <poe-controller-information>
    ## Command: "show poe controller"
    get_poe_controller_information => $NO_ARGS,

    ## Method : <get-poe-notifications>
    ## Returns: <poe-notification-information>
    ## Command: "show poe notification-control"
    get_poe_notifications => $NO_ARGS,

    ## Method : <get-poe-fpc-information>
    ## Returns: <poe-fpc-information>
    ## Command: "show poe fpc"
    get_poe_fpc_information => {
	fpc_slot => $STRING,
    },

    ## Method : <get-ip-monitoring-status>
    ## Returns: <ip-monitoring>
    ## Command: "show services ip-monitoring status"
    get_ip_monitoring_status => {
	policy => $STRING,
    },

    ## Method : <get-interface-flow-statistics>
    ## Returns: <interface-information>
    ## Command: "show interfaces flow-statistics"
    get_interface_flow_statistics => {
	interface_name => $STRING,
    },

    ## Method : <get-wlan-access-points-list>
    ## Returns: <wlan-access-points-list>
    ## Command: "show wlan access-points"
    get_wlan_access_points_list => {
	wlan_access_point_name => $STRING,
	client_associations => $TOGGLE,
	neighbors => $TOGGLE,
	virtual_access_points => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-modem-wireless-interface>
    ## Returns: <wwan-modem-wireless-interface>
    ## Command: "show modem wireless interface"
    get_modem_wireless_interface => {
	interface_name => $STRING,
	firmware => $TOGGLE,
	network => $TOGGLE,
	rssi => $TOGGLE,
	profiles => $TOGGLE,
    },

    ## Method : <get-wireless-wan-adapter-information>
    ## Returns: nothing
    ## Command: "show wireless-wan adapter"
    get_wireless_wan_adapter_information => {
	adapter_name => $STRING,
	detail => $TOGGLE,
	modem => $STRING,
    },

    ## Method : <get-wx-status>
    ## Returns: <wx-status>
    ## Command: "show wan-acceleration status"
    get_wx_status => $NO_ARGS,

    ## Method : <get-retag-statistics>
    ## Returns: <show-retag-statistics-information>
    ## Command: "show bridge rewrite statistics"
    get_retag_statistics => {
	interface => $STRING,
	vlan_id => $STRING,
    },

    ## Method : <request-system-autorecovery>
    ## Returns: <autorecovery>
    ## Command: "request system autorecovery"
    request_system_autorecovery => $NO_ARGS,

    ## Method : <request-system-autorecovery-state-save>
    ## Returns: <autorecovery>
    ## Command: "request system autorecovery state save"
    request_system_autorecovery_state_save => $NO_ARGS,

    ## Method : <request-system-autorecovery-state-recover>
    ## Returns: <autorecovery>
    ## Command: "request system autorecovery state recover"
    request_system_autorecovery_state_recover => $NO_ARGS,

    ## Method : <request-system-autorecovery-state-clear>
    ## Returns: <autorecovery>
    ## Command: "request system autorecovery state clear"
    request_system_autorecovery_state_clear => $NO_ARGS,

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

    ## Method : <request-system-download-clear>
    ## Returns: <download-information>
    ## Command: "request system download clear"
    request_system_download_clear => $NO_ARGS,

    ## Method : <request-system-download-start>
    ## Returns: <download-information>
    ## Command: "request system download start"
    request_system_download_start => {
	url => $STRING,
	max_rate => $STRING,
	save_as => $STRING,
	login => $STRING,
	delay => $STRING,
    },

    ## Method : <request-system-download-pause>
    ## Returns: <download-information>
    ## Command: "request system download pause"
    request_system_download_pause => {
	download_id => $STRING,
    },

    ## Method : <request-system-download-resume>
    ## Returns: <download-information>
    ## Command: "request system download resume"
    request_system_download_resume => {
	download_id => $STRING,
	max_rate => $STRING,
    },

    ## Method : <request-system-download-abort>
    ## Returns: <download-information>
    ## Command: "request system download abort"
    request_system_download_abort => {
	download_id => $STRING,
    },

    ## Method : <request-anti-virus-request-update-kaspersky>
    ## Returns: <anti-virus-request-update>
    ## Command: "request security utm anti-virus kaspersky-lab-engine"
    request_anti_virus_request_update_kaspersky => {
	pattern_update => $TOGGLE,
	pattern_reload => $TOGGLE,
	pattern_delete => $TOGGLE,
    },

    ## Method : <request-anti-virus-request-update-express>
    ## Returns: <anti-virus-request-update>
    ## Command: "request security utm anti-virus juniper-express-engine"
    request_anti_virus_request_update_express => {
	pattern_update => $TOGGLE,
	pattern_reload => $TOGGLE,
	pattern_delete => $TOGGLE,
    },

    ## Method : <request-anti-virus-update-sophos-patterns>
    ## Returns: <anti-virus-request-update>
    ## Command: "request security utm anti-virus sophos-engine"
    request_anti_virus_update_sophos_patterns => {
	pattern_update => $TOGGLE,
	pattern_reload => $TOGGLE,
	pattern_delete => $TOGGLE,
    },

    ## Method : <request-userfw-local-auth-table-add>
    ## Returns: <userfw-local-auth-table>
    ## Command: "request security user-identification local-authentication-table add"
    request_userfw_local_auth_table_add => {
	user_name => $STRING,
	ip_address => $STRING,
    },

    ## Method : <request-userfw-local-auth-table-delete-ip>
    ## Returns: <none>
    ## Command: "request security user-identification local-authentication-table delete ip-address"
    request_userfw_local_auth_table_delete_ip => {
	ip_address => $STRING,
    },

    ## Method : <request-userfw-local-auth-table-delete-user>
    ## Returns: <none>
    ## Command: "request security user-identification local-authentication-table delete user"
    request_userfw_local_auth_table_delete_user => {
	user_name => $STRING,
    },

    ## Method : <request-services-ip-monitoring>
    ## Returns: <none>
    ## Command: "request services ip-monitoring"
    request_services_ip_monitoring => $NO_ARGS,

    ## Method : <request-wlan-access-point-firmware-upgrade>
    ## Returns: <none>
    ## Command: "request wlan access-point firmware upgrade"
    request_wlan_access_point_firmware_upgrade => {
	name => $TOGGLE,
	all => $TOGGLE,
	file => $STRING,
    },

    ## Method : <request-wlan-access-point-firmware-switch>
    ## Returns: <none>
    ## Command: "request wlan access-point firmware switch-image"
    request_wlan_access_point_firmware_switch => {
	wlan_access_point_name => $STRING,
    },

    ## Method : <request-wlan-access-point-restart>
    ## Returns: <none>
    ## Command: "request wlan access-point restart"
    request_wlan_access_point_restart => {
	wlan_access_point_name => $STRING,
    },

    ## Method : <request-wlan-access-point-packet-capture-start>
    ## Returns: <wlan-access-point-packet-capture-start>
    ## Command: "request wlan access-point packet-capture start"
    request_wlan_access_point_packet_capture_start => {
	wlan_access_point_name => $STRING,
	interface => $STRING,
	duration => $STRING,
	filename => $STRING,
	size => $STRING,
	promiscuous => $TOGGLE,
	disable_beacons => $TOGGLE,
	filter_mac => $STRING,
    },

    ## Method : <request-wlan-access-point-packet-capture-stop>
    ## Returns: <wlan-access-point-packet-capture-stop>
    ## Command: "request wlan access-point packet-capture stop"
    request_wlan_access_point_packet_capture_stop => {
	wlan_access_point_name => $STRING,
    },

    ## Method : <activate-wireless-modem>
    ## Returns: <none>
    ## Command: "request modem wireless activate"
    activate_wireless_modem => $NO_ARGS,

    ## Method : <request-modem-wireless-activate-iota>
    ## Returns: <none>
    ## Command: "request modem wireless activate iota"
    request_modem_wireless_activate_iota => {
	interface_name => $STRING,
    },

    ## Method : <request-modem-wireless-activate-otasp>
    ## Returns: <none>
    ## Command: "request modem wireless activate otasp"
    request_modem_wireless_activate_otasp => {
	interface_name => $STRING,
	dial_string => $STRING,
    },

    ## Method : <request-modem-wireless-activate-manual>
    ## Returns: <none>
    ## Command: "request modem wireless activate manual"
    request_modem_wireless_activate_manual => {
	interface_name => $STRING,
	msl => $STRING,
	mdn => $STRING,
	imsi => $STRING,
	sid => $STRING,
	nid => $STRING,
	sip_user_id => $STRING,
	sip_password => $STRING,
    },

    ## Method : <request-gsm-sim-unlock>
    ## Returns: <none>
    ## Command: "request modem wireless gsm sim-unlock"
    request_gsm_sim_unlock => {
	interface_name => $STRING,
	pin => $STRING,
    },

    ## Method : <request-gsm-sim-unblock>
    ## Returns: <none>
    ## Command: "request modem wireless gsm sim-unblock"
    request_gsm_sim_unblock => {
	interface_name => $STRING,
	puk => $STRING,
	pin => $STRING,
    },

    ## Method : <request-gsm-sim-lock>
    ## Returns: <none>
    ## Command: "request modem wireless gsm sim-lock"
    request_gsm_sim_lock => {
	interface_name => $STRING,
	pin => $STRING,
	enable => $TOGGLE,
	disable => $TOGGLE,
    },

    ## Method : <request-gsm-change-pin>
    ## Returns: <none>
    ## Command: "request modem wireless gsm change-pin"
    request_gsm_change_pin => {
	interface_name => $STRING,
	old_pin => $STRING,
	new_pin => $STRING,
    },

    ## Method : <request-gsm-create-profile>
    ## Returns: <none>
    ## Command: "request modem wireless gsm create-profile"
    request_gsm_create_profile => {
	interface_name => $STRING,
	profile_id => $STRING,
	sip_user_id => $STRING,
	sip_password => $STRING,
	access_point_name => $STRING,
	authentication_method => $STRING,
    },

    ## Method : <request-gsm-delete-profile>
    ## Returns: <none>
    ## Command: "request modem wireless gsm delete-profile"
    request_gsm_delete_profile => {
	interface_name => $STRING,
	profile_id => $STRING,
    },

    ## Method : <request-wireless-wan-adapter-firmware-upgrade-auto>
    ## Returns: <none>
    ## Command: "request wireless-wan adapter firmware upgrade auto"
    request_wireless_wan_adapter_firmware_upgrade_auto => {
	apdapter_name => $STRING,
    },

    ## Method : <request-wireless-wan-adapter-firmware-upgrade-manual>
    ## Returns: <none>
    ## Command: "request wireless-wan adapter firmware upgrade manual"
    request_wireless_wan_adapter_firmware_upgrade_manual => {
	apdapter_name => $STRING,
	url => $STRING,
    },

    ## Method : <request-wan-acceleration-login-fpc>
    ## Returns: <none>
    ## Command: "request wan-acceleration login fpc"
    request_wan_acceleration_login_fpc => {
	slot => $STRING,
    },

    ## Method : <test-web-filtering-profile>
    ## Returns: <web-filtering-test>
    ## Command: "test security utm web-filtering"
    test_web_filtering_profile => {
	profile => $STRING,
	test_string => $STRING,
    },

    ## Method : <test-anti-virus-profile>
    ## Returns: <anti-virus-test>
    ## Command: "test security utm anti-virus"
    test_anti_virus_profile => {
	profile => $STRING,
	test_string => $STRING,
    },

    ## Method : <test-anti-spam-profile>
    ## Returns: <anti-spam-test>
    ## Command: "test security utm anti-spam"
    test_anti_spam_profile => {
	profile => $STRING,
	test_string => $STRING,
    },

);
1;
