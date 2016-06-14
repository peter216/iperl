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
# FILE: jroute_methods.pl -- generated automagikally; DO NOT EDIT
#

%jroute_methods = (
    ## Method : <request-end-session>
    ## Returns: <end-session>
    ## Command: "quit"
    request_end_session => $NO_ARGS,

    ## Method : <clear-cli-logical-system>
    ## Returns: <none>
    ## Command: "clear cli logical-system"
    clear_cli_logical_system => $NO_ARGS,

    ## Method : <clear-log>
    ## Returns: <none>
    ## Command: "clear log"
    clear_log => {
	filename => $STRING,
	all => $TOGGLE,
    },

    ## Method : <clear-system-commit>
    ## Returns: <none>
    ## Command: "clear system commit"
    clear_system_commit => $NO_ARGS,

    ## Method : <clear-system-login-lockout>
    ## Returns: <clear-system-login-lockout>
    ## Command: "clear system login lockout"
    clear_system_login_lockout => {
	all => $TOGGLE,
	user => $STRING,
    },

    ## Method : <clear-fabric>
    ## Returns: <none>
    ## Command: "clear fabric"
    clear_fabric => $NO_ARGS,

    ## Method : <clear-fabric-statistics>
    ## Returns: <none>
    ## Command: "clear fabric statistics"
    clear_fabric_statistics => $NO_ARGS,

    ## Method : <clear-fabric-logging>
    ## Returns: <none>
    ## Command: "clear fabric logging"
    clear_fabric_logging => $NO_ARGS,

    ## Method : <clear-bgp-damping>
    ## Returns: <none>
    ## Command: "clear bgp damping"
    clear_bgp_damping => {
	logical_system => $STRING,
	fabric => $TOGGLE,
	prefix => $STRING,
    },

    ## Method : <clear-bgp-neighbor>
    ## Returns: <none>
    ## Command: "clear bgp neighbor"
    clear_bgp_neighbor => {
	logical_system => $STRING,
	fabric => $TOGGLE,
	soft => $TOGGLE,
	soft_minimum_igp => $TOGGLE,
	soft_inbound => $TOGGLE,
	instance => $STRING,
	as => $STRING,
	neighbor => $STRING,
    },

    ## Method : <clear-bgp-table>
    ## Returns: <none>
    ## Command: "clear bgp table"
    clear_bgp_table => {
	logical_system => $STRING,
	fabric => $TOGGLE,
	table => $STRING,
    },

    ## Method : <clear-ipv6-nd-information>
    ## Returns: <ipv6-modify-nd>
    ## Command: "clear ipv6 neighbors"
    clear_ipv6_nd_information => {
	host => $STRING,
    },

    ## Method : <clear-ipv6-all-neighbors>
    ## Returns: <ipv6-modify-nd>
    ## Command: "clear ipv6 neighbors all"
    clear_ipv6_all_neighbors => $NO_ARGS,

    ## Method : <clear-ipv6-router-advertisement-information>
    ## Returns: <none>
    ## Command: "clear ipv6 router-advertisement"
    clear_ipv6_router_advertisement_information => {
	logical_system => $STRING,
	interface => $STRING,
    },

    ## Method : <clear-isis-adjacency-information>
    ## Returns: <none>
    ## Command: "clear isis adjacency"
    clear_isis_adjacency_information => {
	logical_system => $STRING,
	instance => $STRING,
	interface => $STRING,
	neighbor => $STRING,
    },

    ## Method : <clear-isis-database-information>
    ## Returns: <none>
    ## Command: "clear isis database"
    clear_isis_database_information => {
	logical_system => $STRING,
	instance => $STRING,
	purge => $TOGGLE,
	entries => $STRING,
    },

    ## Method : <clear-isis-overload-information>
    ## Returns: <none>
    ## Command: "clear isis overload"
    clear_isis_overload_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-isis-statistics-information>
    ## Returns: <none>
    ## Command: "clear isis statistics"
    clear_isis_statistics_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-esis-adjacency>
    ## Returns: <none>
    ## Command: "clear esis adjacency"
    clear_esis_adjacency => {
	logical_system => $STRING,
	instance => $STRING,
	interface => $STRING,
	neighbor => $STRING,
    },

    ## Method : <clear-esis-statistics>
    ## Returns: <none>
    ## Command: "clear esis statistics"
    clear_esis_statistics => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-mpls-lsp-information>
    ## Returns: <none>
    ## Command: "clear mpls lsp"
    clear_mpls_lsp_information => {
	logical_system => $STRING,
	optimize => $TOGGLE,
	optimize_aggressive => $TOGGLE,
	statistics => $TOGGLE,
	autobandwidth => $TOGGLE,
	regex => $STRING,
	path => $STRING,
    },

    ## Method : <clear-mpls-static-lsp-information>
    ## Returns: <none>
    ## Command: "clear mpls static-lsp"
    clear_mpls_static_lsp_information => {
	logical_system => $STRING,
	statistics => $TOGGLE,
	regex => $STRING,
    },

    ## Method : <clear-mpls-traceroute-database-ldp>
    ## Returns: <none>
    ## Command: "clear mpls traceroute database ldp"
    clear_mpls_traceroute_database_ldp => {
	logical_system => $STRING,
	fec => $STRING,
	routing_instance => $STRING,
    },

    ## Method : <clear-rsvp-session-information>
    ## Returns: <none>
    ## Command: "clear rsvp session"
    clear_rsvp_session_information => {
	logical_system => $STRING,
	session_name => $STRING,
	lsp_id => $STRING,
	tunnel_id => $STRING,
	gracefully => $TOGGLE,
	connection_source => $STRING,
	connection_destination => $STRING,
	optimize_fast_reroute => $TOGGLE,
    },

    ## Method : <clear-rsvp-counters-information>
    ## Returns: <none>
    ## Command: "clear rsvp statistics"
    clear_rsvp_counters_information => {
	logical_system => $STRING,
    },

    ## Method : <clear-igmp-statistics>
    ## Returns: <none>
    ## Command: "clear igmp statistics"
    clear_igmp_statistics => {
	logical_system => $STRING,
	interface => $STRING,
    },

    ## Method : <clear-igmp-membership>
    ## Returns: <none>
    ## Command: "clear igmp membership"
    clear_igmp_membership => {
	logical_system => $STRING,
	interface => $STRING,
	group => $STRING,
    },

    ## Method : <clear-mld-statistics>
    ## Returns: <none>
    ## Command: "clear mld statistics"
    clear_mld_statistics => {
	logical_system => $STRING,
	interface => $STRING,
    },

    ## Method : <clear-mld-membership>
    ## Returns: <none>
    ## Command: "clear mld membership"
    clear_mld_membership => {
	logical_system => $STRING,
	interface => $STRING,
	group => $STRING,
    },

    ## Method : <clear-msdp-statistics>
    ## Returns: <none>
    ## Command: "clear msdp statistics"
    clear_msdp_statistics => {
	logical_system => $STRING,
	instance => $STRING,
	peer => $STRING,
    },

    ## Method : <clear-msdp-cache>
    ## Returns: <none>
    ## Command: "clear msdp cache"
    clear_msdp_cache => {
	logical_system => $STRING,
	instance => $STRING,
	peer => $STRING,
    },

    ## Method : <clear-multicast-sessions>
    ## Returns: <none>
    ## Command: "clear multicast sessions"
    clear_multicast_sessions => {
	logical_system => $STRING,
	regexp => $STRING,
    },

    ## Method : <clear-multicast-statistics>
    ## Returns: <none>
    ## Command: "clear multicast statistics"
    clear_multicast_statistics => {
	logical_system => $STRING,
	instance => $STRING,
	interface => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <clear-multicast-forwarding-cache>
    ## Returns: <none>
    ## Command: "clear multicast forwarding-cache"
    clear_multicast_forwarding_cache => {
	logical_system => $STRING,
	instance => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <clear-multicast-scope-statistics>
    ## Returns: <none>
    ## Command: "clear multicast scope"
    clear_multicast_scope_statistics => {
	logical_system => $STRING,
	interface => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <clear-multicast-bandwidth-admission>
    ## Returns: <none>
    ## Command: "clear multicast bandwidth-admission"
    clear_multicast_bandwidth_admission => {
	logical_system => $STRING,
	instance => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
	group => $STRING,
	source => $STRING,
	interface => $STRING,
    },

    ## Method : <clear-pim-statistics>
    ## Returns: <none>
    ## Command: "clear pim statistics"
    clear_pim_statistics => {
	logical_system => $STRING,
	instance => $STRING,
	interface => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <clear-pim-join-state>
    ## Returns: <none>
    ## Command: "clear pim join"
    clear_pim_join_state => {
	logical_system => $STRING,
	instance => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
	range => $STRING,
    },

    ## Method : <clear-pim-register-state>
    ## Returns: <none>
    ## Command: "clear pim register"
    clear_pim_register_state => {
	logical_system => $STRING,
	instance => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <clear-pim-join-distribution>
    ## Returns: <none>
    ## Command: "clear pim join-distribution"
    clear_pim_join_distribution => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-ospf-neighbor-information>
    ## Returns: <none>
    ## Command: "clear ospf neighbor"
    clear_ospf_neighbor_information => {
	logical_system => $STRING,
	interface => $STRING,
	neighbor => $STRING,
	area => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-ospf-database-information>
    ## Returns: <none>
    ## Command: "clear ospf database"
    clear_ospf_database_information => {
	logical_system => $STRING,
	purge => $TOGGLE,
	router => $TOGGLE,
	network => $TOGGLE,
	netsummary => $TOGGLE,
	asbrsummary => $TOGGLE,
	external => $TOGGLE,
	nssa => $TOGGLE,
	link_local => $TOGGLE,
	opaque_area => $TOGGLE,
	area => $STRING,
	lsa_id => $STRING,
	advertising_router => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-ospf-database-protection>
    ## Returns: <none>
    ## Command: "clear ospf database-protection"
    clear_ospf_database_protection => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-ospf-statistics-information>
    ## Returns: <none>
    ## Command: "clear ospf statistics"
    clear_ospf_statistics_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-ospf-io-statistics-information>
    ## Returns: <none>
    ## Command: "clear ospf io-statistics"
    clear_ospf_io_statistics_information => {
	logical_system => $STRING,
    },

    ## Method : <clear-ospf-overload-information>
    ## Returns: <none>
    ## Command: "clear ospf overload"
    clear_ospf_overload_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-ospf3-neighbor-information>
    ## Returns: <none>
    ## Command: "clear ospf3 neighbor"
    clear_ospf3_neighbor_information => {
	logical_system => $STRING,
	interface => $STRING,
	neighbor => $STRING,
	area => $STRING,
	instance => $STRING,
	realm => $STRING,
    },

    ## Method : <clear-ospf3-database-information>
    ## Returns: <none>
    ## Command: "clear ospf3 database"
    clear_ospf3_database_information => {
	logical_system => $STRING,
	purge => $TOGGLE,
	router => $TOGGLE,
	network => $TOGGLE,
	inter_area_prefix => $TOGGLE,
	inter_area_router => $TOGGLE,
	external => $TOGGLE,
	nssa => $TOGGLE,
	link => $TOGGLE,
	link_local => $TOGGLE,
	intra_area_prefix => $TOGGLE,
	area => $STRING,
	lsa_id => $STRING,
	advertising_router => $STRING,
	instance => $STRING,
	realm => $STRING,
    },

    ## Method : <clear-ospf3-database-protection-information>
    ## Returns: <none>
    ## Command: "clear ospf3 database-protection"
    clear_ospf3_database_protection_information => {
	logical_system => $STRING,
	instance => $STRING,
	realm => $STRING,
    },

    ## Method : <clear-ospf3-statistics-information>
    ## Returns: <none>
    ## Command: "clear ospf3 statistics"
    clear_ospf3_statistics_information => {
	logical_system => $STRING,
	instance => $STRING,
	realm => $STRING,
    },

    ## Method : <clear-ospf3-io-statistics-information>
    ## Returns: <none>
    ## Command: "clear ospf3 io-statistics"
    clear_ospf3_io_statistics_information => {
	logical_system => $STRING,
    },

    ## Method : <clear-ospf3-overload-information>
    ## Returns: <none>
    ## Command: "clear ospf3 overload"
    clear_ospf3_overload_information => {
	logical_system => $STRING,
	instance => $STRING,
	realm => $STRING,
    },

    ## Method : <clear-rip-statistics>
    ## Returns: <none>
    ## Command: "clear rip statistics"
    clear_rip_statistics => {
	logical_system => $STRING,
	neighbor_name => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-rip-peer-statistics>
    ## Returns: <none>
    ## Command: "clear rip statistics peer"
    clear_rip_peer_statistics => {
	logical_system => $STRING,
	address => $STRING,
	all => $TOGGLE,
    },

    ## Method : <clear-rip-general-statistics>
    ## Returns: <none>
    ## Command: "clear rip general-statistics"
    clear_rip_general_statistics => {
	logical_system => $STRING,
    },

    ## Method : <clear-ripng-statistics>
    ## Returns: <none>
    ## Command: "clear ripng statistics"
    clear_ripng_statistics => {
	logical_system => $STRING,
	neighbor_name => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-ripng-general-statistics>
    ## Returns: <none>
    ## Command: "clear ripng general-statistics"
    clear_ripng_general_statistics => {
	logical_system => $STRING,
    },

    ## Method : <clear-ldp-neighbors>
    ## Returns: <none>
    ## Command: "clear ldp neighbor"
    clear_ldp_neighbors => {
	logical_system => $STRING,
	instance => $STRING,
	neighbor => $STRING,
    },

    ## Method : <clear-ldp-sessions>
    ## Returns: <none>
    ## Command: "clear ldp session"
    clear_ldp_sessions => {
	logical_system => $STRING,
	instance => $STRING,
	destination => $STRING,
    },

    ## Method : <clear-ldp-statistics>
    ## Returns: <none>
    ## Command: "clear ldp statistics"
    clear_ldp_statistics => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-ldp-interface-hello-statistics>
    ## Returns: <none>
    ## Command: "clear ldp statistics interface"
    clear_ldp_interface_hello_statistics => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-vpls-mac-address>
    ## Returns: <none>
    ## Command: "clear vpls mac-address"
    clear_vpls_mac_address => {
	logical_system => $STRING,
	instance => $STRING,
	address => $STRING,
    },

    ## Method : <clear-vpls-statistics>
    ## Returns: <none>
    ## Command: "clear vpls statistics"
    clear_vpls_statistics => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-pgm-negative-acknowledgments>
    ## Returns: <none>
    ## Command: "clear pgm negative-acknowledgments"
    clear_pgm_negative_acknowledgments => $NO_ARGS,

    ## Method : <clear-pgm-source-path-messages>
    ## Returns: <none>
    ## Command: "clear pgm source-path-messages"
    clear_pgm_source_path_messages => $NO_ARGS,

    ## Method : <clear-pgm-statistics>
    ## Returns: <none>
    ## Command: "clear pgm statistics"
    clear_pgm_statistics => $NO_ARGS,

    ## Method : <clear-bfd-session-information>
    ## Returns: <none>
    ## Command: "clear bfd session"
    clear_bfd_session_information => {
	logical_system => $STRING,
    },

    ## Method : <clear-bfd-session-discriminator>
    ## Returns: <none>
    ## Command: "clear bfd session discriminator"
    clear_bfd_session_discriminator => {
	discr_number => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-bfd-session-address>
    ## Returns: <none>
    ## Command: "clear bfd session address"
    clear_bfd_session_address => {
	session_addr => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-bfd-adaptation-information>
    ## Returns: <none>
    ## Command: "clear bfd adaptation"
    clear_bfd_adaptation_information => {
	logical_system => $STRING,
    },

    ## Method : <clear-bfd-adaptation-discriminator>
    ## Returns: <none>
    ## Command: "clear bfd adaptation discriminator"
    clear_bfd_adaptation_discriminator => {
	discr_number => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-bfd-adaptation-address>
    ## Returns: <none>
    ## Command: "clear bfd adaptation address"
    clear_bfd_adaptation_address => {
	session_addr => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-security-alarm-information>
    ## Returns: <clear-security-alarm-results>
    ## Command: "clear security alarms"
    clear_security_alarm_information => {
	alarm_id => $STRING,
	newer_than => $STRING,
	older_than => $STRING,
	process => $STRING,
	severity => $STRING,
	all => $TOGGLE,
    },

    ## Method : <clear-security-log-information>
    ## Returns: <clear-security-log-information>
    ## Command: "clear security log"
    clear_security_log_information => {
	destination_address => $STRING,
	destination_port => $STRING,
	event_id => $STRING,
	interface_name => $STRING,
	older_than => $STRING,
	policy_name => $STRING,
	process => $STRING,
	protocol => $STRING,
	newer_than => $STRING,
	failure => $TOGGLE,
	success => $TOGGLE,
	severity => $STRING,
	source_address => $STRING,
	source_port => $STRING,
	username => $STRING,
	all => $TOGGLE,
    },

    ## Method : <clear-amt-tunnel>
    ## Returns: <none>
    ## Command: "clear amt tunnel"
    clear_amt_tunnel => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-amt-tunnel-interface>
    ## Returns: <none>
    ## Command: "clear amt tunnel tunnel-interface"
    clear_amt_tunnel_interface => {
	logical_system => $STRING,
	instance => $STRING,
	interface => $STRING,
    },

    ## Method : <clear-amt-tunnel-gateway-address>
    ## Returns: <none>
    ## Command: "clear amt tunnel gateway-address"
    clear_amt_tunnel_gateway_address => {
	logical_system => $STRING,
	instance => $STRING,
	address => $STRING,
	port => $STRING,
    },

    ## Method : <clear-amt-tunnel-statistics>
    ## Returns: <none>
    ## Command: "clear amt tunnel statistics"
    clear_amt_tunnel_statistics => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-amt-tunnel-interface-statistics>
    ## Returns: <none>
    ## Command: "clear amt tunnel statistics tunnel-interface"
    clear_amt_tunnel_interface_statistics => {
	logical_system => $STRING,
	instance => $STRING,
	interface => $STRING,
    },

    ## Method : <clear-amt-tunnel-gateway-address-statistics>
    ## Returns: <none>
    ## Command: "clear amt tunnel statistics gateway-address"
    clear_amt_tunnel_gateway_address_statistics => {
	logical_system => $STRING,
	instance => $STRING,
	address => $STRING,
	port => $STRING,
    },

    ## Method : <clear-amt-statistics>
    ## Returns: <none>
    ## Command: "clear amt statistics"
    clear_amt_statistics => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-authorization-information>
    ## Returns: <authorization-information>
    ## Command: "show cli authorization"
    get_authorization_information => $NO_ARGS,

    ## Method : <get-system-alarm-information>
    ## Returns: <alarm-information>
    ## Command: "show system alarms"
    get_system_alarm_information => $NO_ARGS,

    ## Method : <get-commit-information>
    ## Returns: <commit-information>
    ## Command: "show system commit"
    get_commit_information => $NO_ARGS,

    ## Method : <get-commit-server-information>
    ## Returns: <commit-server-information>
    ## Command: "show system commit server"
    get_commit_server_information => {
	status => $TOGGLE,
    },

    ## Method : <get-commit-server-queue-information>
    ## Returns: <commit-server-queue-information>
    ## Command: "show system commit server queue"
    get_commit_server_queue_information => {
	id => $STRING,
	job_status => $STRING,
	patch => $TOGGLE,
    },

    ## Method : <get-rescue-information>
    ## Returns: <rescue-information>
    ## Command: "show system configuration rescue"
    get_rescue_information => {
	format => $STRING,
    },

    ## Method : <get-system-archival>
    ## Returns: <directory-list>
    ## Command: "show system configuration archival"
    get_system_archival => $NO_ARGS,

    ## Method : <get-rollback-information>
    ## Returns: <rollback-information>
    ## Command: "show system rollback"
    get_rollback_information => {
	rollback => $STRING,
	compare => $STRING,
	format => $STRING,
    },

    ## Method : <get-system-uptime-information>
    ## Returns: <system-uptime-information>
    ## Command: "show system uptime"
    get_system_uptime_information => {
    },

    ## Method : <get-license-summary-information>
    ## Returns: <license-summary-information>
    ## Command: "show system license"
    get_license_summary_information => $NO_ARGS,

    ## Method : <get-license-information>
    ## Returns: <license-information>
    ## Command: "show system license installed"
    get_license_information => $NO_ARGS,

    ## Method : <get-license-key-information>
    ## Returns: <license-key-information>
    ## Command: "show system license keys"
    get_license_key_information => $NO_ARGS,

    ## Method : <get-license-usage-summary>
    ## Returns: <license-usage-summary>
    ## Command: "show system license usage"
    get_license_usage_summary => $NO_ARGS,

    ## Method : <get-system-login-lockout-information>
    ## Returns: <system-login-lockout-information>
    ## Command: "show system login lockout"
    get_system_login_lockout_information => {
	user => $STRING,
    },

    ## Method : <get-service-deployment-service-information>
    ## Returns: <service-deployment-service-information>
    ## Command: "show system services service-deployment"
    get_service_deployment_service_information => $NO_ARGS,

    ## Method : <get-software-information>
    ## Returns: <software-information>
    ## Command: "show version"
    get_software_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-log>
    ## Returns: <file-content>
    ## Command: "show log"
    get_log => {
	filename => $STRING,
    },

    ## Method : <get-as-path>
    ## Returns: <juniper-routing-aspath>
    ## Command: "show as-path"
    get_as_path => {
	logical_system => $STRING,
	fabric => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-as-path-domain>
    ## Returns: <juniper-routing-aspath>
    ## Command: "show as-path domain"
    get_as_path_domain => {
	logical_system => $STRING,
	fabric => $TOGGLE,
    },

    ## Method : <get-hfrr-information>
    ## Returns: <hfrr-information>
    ## Command: "show hfrr profiles"
    get_hfrr_information => {
	logical_system => $STRING,
	fabric => $TOGGLE,
    },

    ## Method : <get-route-information>
    ## Returns: <route-information>
    ## Command: "show route"
    get_route_information => {
	logical_system => $STRING,
	fabric => $TOGGLE,
	destination => $STRING,
	all => $TOGGLE,
	terse => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	best => $TOGGLE,
	exact => $TOGGLE,
	range => $TOGGLE,
	table => $STRING,
	label => $STRING,
	ccc => $STRING,
	inactive_prefix => $TOGGLE,
	inactive_path => $TOGGLE,
	active_path => $TOGGLE,
	private => $TOGGLE,
	damping => $STRING,
	next_hop => $STRING,
	source_gateway => $STRING,
	protocol => $STRING,
	bgp => $TOGGLE,
	dvmrp => $TOGGLE,
	pim => $TOGGLE,
	rip => $TOGGLE,
	ripng => $TOGGLE,
	msdp => $TOGGLE,
	neighbor => $STRING,
	bgp => $TOGGLE,
	rip => $TOGGLE,
	ripng => $TOGGLE,
	dvmrp => $TOGGLE,
	pim => $TOGGLE,
	msdp => $TOGGLE,
	peer => $STRING,
	rd_prefix => $STRING,
	match_prefix => $STRING,
	aspath_regex => $STRING,
	no_community => $TOGGLE,
	community_name => $STRING,
	label_switched_path => $STRING,
	static_label_switched_path => $STRING,
	hidden => $TOGGLE,
	validation_state => $STRING,
	ne_id => $STRING,
	l2domain_id => $STRING,
	bridge_route_mac_address => $STRING,
	bridge_route_group_id => $STRING,
    },

    ## Method : <get-instance-information>
    ## Returns: <instance-information>
    ## Command: "show route instance"
    get_instance_information => {
	logical_system => $STRING,
	fabric => $TOGGLE,
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	instance_name => $STRING,
    },

    ## Method : <get-operational-routing-instance-information>
    ## Returns: <operational-routing-instance-information>
    ## Command: "show route instance operational"
    get_operational_routing_instance_information => $NO_ARGS,

    ## Method : <get-localize-routing-instance-information>
    ## Returns: <localize-routing-instance-information>
    ## Command: "show route instance localize"
    get_localize_routing_instance_information => $NO_ARGS,

    ## Method : <get-route-resolution-information>
    ## Returns: <route-resolution-information>
    ## Command: "show route resolution"
    get_route_resolution_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	prefix => $STRING,
	table => $STRING,
	index => $STRING,
    },

    ## Method : <get-route-resolution-summary>
    ## Returns: <route-resolution-information>
    ## Command: "show route resolution summary"
    get_route_resolution_summary => {
	logical_system => $STRING,
    },

    ## Method : <get-route-summary-information>
    ## Returns: <route-summary-information>
    ## Command: "show route summary"
    get_route_summary_information => {
	logical_system => $STRING,
	fabric => $TOGGLE,
	table => $STRING,
    },

    ## Method : <get-route-martians>
    ## Returns: <route-information>
    ## Command: "show route martians"
    get_route_martians => {
	logical_system => $STRING,
	fabric => $TOGGLE,
	table => $STRING,
    },

    ## Method : <get-route-rib-groups>
    ## Returns: <route-information>
    ## Command: "show route rib-groups"
    get_route_rib_groups => {
	logical_system => $STRING,
	fabric => $TOGGLE,
    },

    ## Method : <get-route-snooping-information>
    ## Returns: <route-information>
    ## Command: "show route snooping"
    get_route_snooping_information => {
	destination => $STRING,
	all => $TOGGLE,
	terse => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	best => $TOGGLE,
	exact => $TOGGLE,
	range => $TOGGLE,
	table => $STRING,
    },

    ## Method : <get-route-snooping-summary>
    ## Returns: <route-summary-information>
    ## Command: "show route snooping summary"
    get_route_snooping_summary => $NO_ARGS,

    ## Method : <get-rtexport-table-information>
    ## Returns: <rtexport-table-information>
    ## Command: "show route export"
    get_rtexport_table_information => {
	logical_system => $STRING,
	fabric => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	table_name => $STRING,
    },

    ## Method : <get-rtexport-target-information>
    ## Returns: <rtexport-target-information>
    ## Command: "show route export vrf-target"
    get_rtexport_target_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	fabric => $TOGGLE,
    },

    ## Method : <get-rtexport-instance-information>
    ## Returns: <rtexport-instance-information>
    ## Command: "show route export instance"
    get_rtexport_instance_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
	fabric => $TOGGLE,
	instance_name => $STRING,
    },

    ## Method : <get-rtflow-dep-information>
    ## Returns: <rtflow-dep-information>
    ## Command: "show route flow validation"
    get_rtflow_dep_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	table => $STRING,
	destination => $STRING,
    },

    ## Method : <get-routing-task-replication-state>
    ## Returns: <task-replication-state>
    ## Command: "show task replication"
    get_routing_task_replication_state => $NO_ARGS,

    ## Method : <get-task-memory-information>
    ## Returns: <task-memory-information>
    ## Command: "show task memory"
    get_task_memory_information => {
	logical_system => $STRING,
	fabric => $TOGGLE,
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	history => $TOGGLE,
    },

    ## Method : <get-snooping-task-memory-information>
    ## Returns: <task-memory-information>
    ## Command: "show task snooping memory"
    get_snooping_task_memory_information => {
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	history => $TOGGLE,
    },

    ## Method : <get-dynamic-tunnels-database>
    ## Returns: <dynamic-tunnels-information>
    ## Command: "show dynamic-tunnels database"
    get_dynamic_tunnels_database => {
	logical_system => $STRING,
	table => $STRING,
	destination => $STRING,
    },

    ## Method : <get-ingress-replication-information>
    ## Returns: <ingress-replication-information>
    ## Command: "show ingress-replication"
    get_ingress_replication_information => {
	logical_system => $STRING,
	mvpn => $TOGGLE,
	tunnel_name => $STRING,
    },

    ## Method : <get-fabric-summary-information>
    ## Returns: <fabric-summary-information>
    ## Command: "show fabric summary"
    get_fabric_summary_information => $NO_ARGS,

    ## Method : <get-fabric-statistics>
    ## Returns: <fabric-statistics>
    ## Command: "show fabric statistics"
    get_fabric_statistics => $NO_ARGS,

    ## Method : <get-fabric-logging-information>
    ## Returns: <fabric-logging-information>
    ## Command: "show fabric logging"
    get_fabric_logging_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-vlan-domain-map-information>
    ## Returns: <vlan-domain-map-information>
    ## Command: "show fabric vlan-domain-map"
    get_vlan_domain_map_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	vlan => $STRING,
    },

    ## Method : <get-mac-ip-binding-information>
    ## Returns: <mac-ip-binding-information>
    ## Command: "show fabric mac-ip-binding"
    get_mac_ip_binding_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	l2domain => $STRING,
	mac_address => $STRING,
    },

    ## Method : <get-mc-vccpdf-adjacency-database>
    ## Returns: <mc-vccpdf-adjacency-database>
    ## Command: "show fabric multicast vccpdf-adjacency"
    get_mc_vccpdf_adjacency_database => $NO_ARGS,

    ## Method : <get-mc-edge-vg-portmap>
    ## Returns: <mc-edge-vg-portmap>
    ## Command: "show fabric multicast edge vlan-group-port-map"
    get_mc_edge_vg_portmap => $NO_ARGS,

    ## Method : <get-key-vg-binding>
    ## Returns: <mc-key-vg-binding>
    ## Command: "show fabric multicast edge key-vlan-group"
    get_key_vg_binding => $NO_ARGS,

    ## Method : <get-core-key-list>
    ## Returns: <mc-core-key-list>
    ## Command: "show fabric multicast edge core-key-list"
    get_core_key_list => $NO_ARGS,

    ## Method : <get-mc-edge-key-to-map-binding>
    ## Returns: <mc-map-to-key-binding>
    ## Command: "show fabric multicast edge map-to-core-key"
    get_mc_edge_key_to_map_binding => {
	core_key => $STRING,
    },

    ## Method : <get-mc-edge-map-to-key-binding>
    ## Returns: <mc-key-to-map-binding>
    ## Command: "show fabric multicast edge core-key-to-map"
    get_mc_edge_map_to_key_binding => {
	core_key => $STRING,
    },

    ## Method : <get-mc-root-ine-vg-pfemap>
    ## Returns: <mc-root-ine-vg-pfemap>
    ## Command: "show fabric multicast root ine-vlan-group-pfe-map"
    get_mc_root_ine_vg_pfemap => $NO_ARGS,

    ## Method : <get-mc-root-vg-pfemap>
    ## Returns: <mc-root-vg-pfemap>
    ## Command: "show fabric multicast root vlan-group-pfe-map"
    get_mc_root_vg_pfemap => $NO_ARGS,

    ## Method : <get-mc-root-key-to-map-binding>
    ## Returns: <mc-map-to-key-binding>
    ## Command: "show fabric multicast root map-to-core-key"
    get_mc_root_key_to_map_binding => $NO_ARGS,

    ## Method : <get-mc-root-map-to-key-binding>
    ## Returns: <mc-key-to-map-binding>
    ## Command: "show fabric multicast root core-key-to-map"
    get_mc_root_map_to_key_binding => $NO_ARGS,

    ## Method : <get-mc-ccpc-src-mod-filters>
    ## Returns: <mc-ccpc-src-mod-filters>
    ## Command: "show fabric multicast ccpc src-mod-filters"
    get_mc_ccpc_src_mod_filters => $NO_ARGS,

    ## Method : <get-mc-nsf>
    ## Returns: <mc-nsf>
    ## Command: "show fabric multicast nsf"
    get_mc_nsf => $NO_ARGS,

    ## Method : <get-fabric-multicast-summary>
    ## Returns: <fabric-multicast-summary>
    ## Command: "show fabric multicast summary"
    get_fabric_multicast_summary => $NO_ARGS,

    ## Method : <get-bgp-summary-information>
    ## Returns: <bgp-information>
    ## Command: "show bgp summary"
    get_bgp_summary_information => {
	logical_system => $STRING,
	fabric => $TOGGLE,
	group => $STRING,
	exact_instance => $STRING,
	instance => $STRING,
    },

    ## Method : <get-bgp-replication-information>
    ## Returns: <bgp-sync-information>
    ## Command: "show bgp replication"
    get_bgp_replication_information => $NO_ARGS,

    ## Method : <get-bgp-group-information>
    ## Returns: <bgp-group-information>
    ## Command: "show bgp group"
    get_bgp_group_information => {
	logical_system => $STRING,
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	exact_instance => $STRING,
	instance => $STRING,
	group_name => $STRING,
    },

    ## Method : <get-bgp-rtf-information>
    ## Returns: <bgp-rtf-information>
    ## Command: "show bgp group rtf"
    get_bgp_rtf_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	group_name => $STRING,
    },

    ## Method : <get-bgp-traffic-statistics-information>
    ## Returns: <bgp-traffic-statistics-information>
    ## Command: "show bgp group traffic-statistics"
    get_bgp_traffic_statistics_information => {
	logical_system => $STRING,
	fabric => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	group_name => $STRING,
    },

    ## Method : <get-bgp-neighbor-information>
    ## Returns: <bgp-information>
    ## Command: "show bgp neighbor"
    get_bgp_neighbor_information => {
	logical_system => $STRING,
	fabric => $TOGGLE,
	exact_instance => $STRING,
	instance => $STRING,
	neighbor_address => $STRING,
    },

    ## Method : <get-bgp-orf-information>
    ## Returns: <bgp-orf-information>
    ## Command: "show bgp neighbor orf"
    get_bgp_orf_information => {
	logical_system => $STRING,
	fabric => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	instance => $STRING,
	neighbor_address => $STRING,
    },

    ## Method : <get-bgp-monitoring-protocol-statistics>
    ## Returns: <bgp-information>
    ## Command: "show bgp bmp"
    get_bgp_monitoring_protocol_statistics => $NO_ARGS,

    ## Method : <get-ipv6-nd-information>
    ## Returns: <ipv6-nd-information>
    ## Command: "show ipv6 neighbors"
    get_ipv6_nd_information => $NO_ARGS,

    ## Method : <get-ipv6-ra-information>
    ## Returns: <ipv6-ra-information>
    ## Command: "show ipv6 router-advertisement"
    get_ipv6_ra_information => {
	logical_system => $STRING,
	interface => $STRING,
	conflicts => $TOGGLE,
	prefix => $STRING,
	virtual_router => $TOGGLE,
    },

    ## Method : <get-isis-adjacency-information>
    ## Returns: <isis-adjacency-information>
    ## Command: "show isis adjacency"
    get_isis_adjacency_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	instance => $STRING,
	system_id => $STRING,
    },

    ## Method : <get-isis-authentication-information>
    ## Returns: <isis-authentication-information>
    ## Command: "show isis authentication"
    get_isis_authentication_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-isis-backup-lsp-information>
    ## Returns: <isis-backup-lsp-information>
    ## Command: "show isis backup label-switched-path"
    get_isis_backup_lsp_information => {
	logical_system => $STRING,
    },

    ## Method : <get-isis-backup-spf-results-information>
    ## Returns: <isis-backup-spf-results-information>
    ## Command: "show isis backup spf results"
    get_isis_backup_spf_results_information => {
	logical_system => $STRING,
	instance => $STRING,
	level => $STRING,
	no_coverage => $TOGGLE,
	topology => $STRING,
    },

    ## Method : <get-isis-backup-coverage-information>
    ## Returns: <isis-backup-coverage-information>
    ## Command: "show isis backup coverage"
    get_isis_backup_coverage_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-isis-context-identifier-information>
    ## Returns: <isis-context-identifier-information>
    ## Command: "show isis context-identifier"
    get_isis_context_identifier_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	instance => $STRING,
    },

    ## Method : <get-isis-context-identifier-origin-information>
    ## Returns: <isis-context-identifier-origin-information>
    ## Command: "show isis context-identifier identifier"
    get_isis_context_identifier_origin_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	id_addr => $STRING,
	instance => $STRING,
    },

    ## Method : <get-isis-database-information>
    ## Returns: <isis-database-information>
    ## Command: "show isis database"
    get_isis_database_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	instance => $STRING,
	level => $STRING,
	system_id => $STRING,
    },

    ## Method : <get-isis-hostname-information>
    ## Returns: <isis-hostname-information>
    ## Command: "show isis hostname"
    get_isis_hostname_information => {
	logical_system => $STRING,
    },

    ## Method : <get-isis-interface-information>
    ## Returns: <isis-interface-information>
    ## Command: "show isis interface"
    get_isis_interface_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	instance => $STRING,
	interface_name => $STRING,
    },

    ## Method : <get-isis-overview-information>
    ## Returns: <isis-overview-information>
    ## Command: "show isis overview"
    get_isis_overview_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-isis-route-information>
    ## Returns: <isis-route-information>
    ## Command: "show isis route"
    get_isis_route_information => {
	logical_system => $STRING,
	instance => $STRING,
	destination => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
	iso => $TOGGLE,
	topology => $STRING,
    },

    ## Method : <get-isis-spf-log-information>
    ## Returns: <isis-spf-log-information>
    ## Command: "show isis spf log"
    get_isis_spf_log_information => {
	logical_system => $STRING,
	instance => $STRING,
	level => $STRING,
	topology => $STRING,
    },

    ## Method : <get-isis-spf-results-information>
    ## Returns: <isis-spf-results-information>
    ## Command: "show isis spf results"
    get_isis_spf_results_information => {
	logical_system => $STRING,
	instance => $STRING,
	level => $STRING,
	topology => $STRING,
    },

    ## Method : <get-isis-spf-results-brief-information>
    ## Returns: <isis-spf-results-brief-information>
    ## Command: "show isis spf brief"
    get_isis_spf_results_brief_information => {
	logical_system => $STRING,
	instance => $STRING,
	level => $STRING,
	topology => $STRING,
    },

    ## Method : <get-isis-statistics-information>
    ## Returns: <isis-statistics-information>
    ## Command: "show isis statistics"
    get_isis_statistics_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-esis-adjacency-information>
    ## Returns: <esis-adjacency-information>
    ## Command: "show esis adjacency"
    get_esis_adjacency_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	instance => $STRING,
	esis_neighbor_id => $STRING,
    },

    ## Method : <get-esis-interface-information>
    ## Returns: <esis-interface-information>
    ## Command: "show esis interface"
    get_esis_interface_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	instance => $STRING,
	interface_name => $STRING,
    },

    ## Method : <get-esis-statistics-information>
    ## Returns: <esis-statistics-information>
    ## Command: "show esis statistics"
    get_esis_statistics_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-mpls-admin-group-information>
    ## Returns: <mpls-admin-group-information>
    ## Command: "show mpls admin-groups"
    get_mpls_admin_group_information => {
	logical_system => $STRING,
    },

    ## Method : <get-mpls-admin-group-extended-information>
    ## Returns: <mpls-admin-group-extended-information>
    ## Command: "show mpls admin-groups-extended"
    get_mpls_admin_group_extended_information => {
	logical_system => $STRING,
    },

    ## Method : <get-mpls-cspf-information>
    ## Returns: <mpls-cspf-information>
    ## Command: "show mpls cspf"
    get_mpls_cspf_information => {
	logical_system => $STRING,
    },

    ## Method : <get-mpls-path-information>
    ## Returns: <mpls-path-information>
    ## Command: "show mpls path"
    get_mpls_path_information => {
	logical_system => $STRING,
	path => $STRING,
    },

    ## Method : <get-mpls-interface-information>
    ## Returns: <mpls-interface-information>
    ## Command: "show mpls interface"
    get_mpls_interface_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-mpls-diffserv-te-information>
    ## Returns: <mpls-diffserv-te-information>
    ## Command: "show mpls diffserv-te"
    get_mpls_diffserv_te_information => {
	logical_system => $STRING,
    },

    ## Method : <get-mpls-lsp-information>
    ## Returns: <mpls-lsp-information>
    ## Command: "show mpls lsp"
    get_mpls_lsp_information => {
	logical_system => $STRING,
	ingress => $TOGGLE,
	egress => $TOGGLE,
	transit => $TOGGLE,
	terse => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	descriptions => $TOGGLE,
	up => $TOGGLE,
	down => $TOGGLE,
	unidirectional => $TOGGLE,
	bidirectional => $TOGGLE,
	p2mp => $TOGGLE,
	externally_controlled => $TOGGLE,
	statistics => $TOGGLE,
	bypass => $TOGGLE,
	count_active_routes => $TOGGLE,
	regex => $STRING,
    },

    ## Method : <get-mpls-lsp-defaults-information>
    ## Returns: <mpls-lsp-defaults-information>
    ## Command: "show mpls lsp defaults"
    get_mpls_lsp_defaults_information => {
	logical_system => $STRING,
    },

    ## Method : <get-mpls-lsp-autobandwidth>
    ## Returns: <mpls-lsp-information>
    ## Command: "show mpls lsp autobandwidth"
    get_mpls_lsp_autobandwidth => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-mpls-static-lsp-information>
    ## Returns: <mpls-static-lsp-information>
    ## Command: "show mpls static-lsp"
    get_mpls_static_lsp_information => {
	logical_system => $STRING,
	bypass => $TOGGLE,
	ingress => $TOGGLE,
	transit => $TOGGLE,
	terse => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	descriptions => $TOGGLE,
	statistics => $TOGGLE,
	up => $TOGGLE,
	down => $TOGGLE,
	regex => $STRING,
    },

    ## Method : <get-mpls-call-admission-control-information>
    ## Returns: <mpls-call-admission-control-information>
    ## Command: "show mpls call-admission-control"
    get_mpls_call_admission_control_information => {
	logical_system => $STRING,
	lsp_name => $STRING,
    },

    ## Method : <get-mpls-context-identifier-information>
    ## Returns: <mpls-context-identifier-information>
    ## Command: "show mpls context-identifier"
    get_mpls_context_identifier_information => {
	logical_system => $STRING,
	primary => $TOGGLE,
	protector => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	id => $STRING,
    },

    ## Method : <get-mpls-srlg-information>
    ## Returns: <mpls-srlg-information>
    ## Command: "show mpls srlg"
    get_mpls_srlg_information => {
	logical_system => $STRING,
    },

    ## Method : <get-mpls-traceroute-database-ldp>
    ## Returns: <database>
    ## Command: "show mpls traceroute database ldp"
    get_mpls_traceroute_database_ldp => {
	logical_system => $STRING,
	fec => $STRING,
	detail => $TOGGLE,
	no_resolve => $TOGGLE,
	routing_instance => $STRING,
    },

    ## Method : <get-egress-protection-information>
    ## Returns: <egress-protection-information>
    ## Command: "show mpls egress-protection"
    get_egress_protection_information => {
	logical_system => $STRING,
	fabric => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-rsvp-interface-information>
    ## Returns: <rsvp-interface-information>
    ## Command: "show rsvp interface"
    get_rsvp_interface_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	link_management => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-rsvp-neighbor-information>
    ## Returns: <rsvp-neighbor-information>
    ## Command: "show rsvp neighbor"
    get_rsvp_neighbor_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-rsvp-session-information>
    ## Returns: <rsvp-session-information>
    ## Command: "show rsvp session"
    get_rsvp_session_information => {
	logical_system => $STRING,
	ingress => $TOGGLE,
	egress => $TOGGLE,
	transit => $TOGGLE,
	lsp => $TOGGLE,
	nolsp => $TOGGLE,
	up => $TOGGLE,
	down => $TOGGLE,
	unidirectional => $TOGGLE,
	bidirectional => $TOGGLE,
	p2mp => $TOGGLE,
	terse => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	statistics => $TOGGLE,
	bypass => $TOGGLE,
	count_active_routes => $TOGGLE,
	session_name => $STRING,
	interface => $STRING,
	te_link => $STRING,
    },

    ## Method : <get-rsvp-statistics-information>
    ## Returns: <rsvp-statistics-information>
    ## Command: "show rsvp statistics"
    get_rsvp_statistics_information => {
	logical_system => $STRING,
    },

    ## Method : <get-rsvp-version-information>
    ## Returns: <rsvp-version-information>
    ## Command: "show rsvp version"
    get_rsvp_version_information => {
	logical_system => $STRING,
    },

    ## Method : <get-ted-database-information>
    ## Returns: <ted-database-information>
    ## Command: "show ted database"
    get_ted_database_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	system_id => $STRING,
    },

    ## Method : <get-ted-link-information>
    ## Returns: <ted-link-information>
    ## Command: "show ted link"
    get_ted_link_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-ted-protocol-information>
    ## Returns: <ted-protocol-information>
    ## Command: "show ted protocol"
    get_ted_protocol_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-igmp-group-information>
    ## Returns: <igmp-group-information>
    ## Command: "show igmp group"
    get_igmp_group_information => {
	logical_system => $STRING,
	terse => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	group_name => $STRING,
    },

    ## Method : <get-igmp-output-group-information>
    ## Returns: <igmp-output-group-information>
    ## Command: "show igmp output-group"
    get_igmp_output_group_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	group_name => $STRING,
    },

    ## Method : <get-igmp-interface-information>
    ## Returns: <igmp-interface-information>
    ## Command: "show igmp interface"
    get_igmp_interface_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-igmp-statistics-information>
    ## Returns: <igmp-statistics-information>
    ## Command: "show igmp statistics"
    get_igmp_statistics_information => {
	logical_system => $STRING,
	interface => $STRING,
    },

    ## Method : <get-mld-group-information>
    ## Returns: <mld-group-information>
    ## Command: "show mld group"
    get_mld_group_information => {
	logical_system => $STRING,
	terse => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	group_name => $STRING,
    },

    ## Method : <get-mld-output-group-information>
    ## Returns: <mld-output-group-information>
    ## Command: "show mld output-group"
    get_mld_output_group_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	group_name => $STRING,
    },

    ## Method : <get-mld-interface-information>
    ## Returns: <mld-interface-information>
    ## Command: "show mld interface"
    get_mld_interface_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-mld-statistics-information>
    ## Returns: <mld-statistics-information>
    ## Command: "show mld statistics"
    get_mld_statistics_information => {
	logical_system => $STRING,
	interface => $STRING,
    },

    ## Method : <get-dvmrp-neighbors-information>
    ## Returns: <dvmrp-neighbors-information>
    ## Command: "show dvmrp neighbors"
    get_dvmrp_neighbors_information => {
	logical_system => $STRING,
    },

    ## Method : <get-dvmrp-interfaces-information>
    ## Returns: <dvmrp-interfaces-information>
    ## Command: "show dvmrp interfaces"
    get_dvmrp_interfaces_information => {
	logical_system => $STRING,
    },

    ## Method : <get-dvmrp-prunes-information>
    ## Returns: <dvmrp-prunes-information>
    ## Command: "show dvmrp prunes"
    get_dvmrp_prunes_information => {
	logical_system => $STRING,
	all => $TOGGLE,
	rx => $TOGGLE,
	tx => $TOGGLE,
    },

    ## Method : <get-dvmrp-prefix-information>
    ## Returns: <dvmrp-prefix-information>
    ## Command: "show dvmrp prefix"
    get_dvmrp_prefix_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	prefix => $STRING,
    },

    ## Method : <get-mc-fwd-cache-information>
    ## Returns: <mc-fwd-cache-information>
    ## Command: "show multicast forwarding-cache statistics"
    get_mc_fwd_cache_information => {
	logical_system => $STRING,
	instance => $STRING,
	family => $STRING,
    },

    ## Method : <get-multicast-route-information>
    ## Returns: <multicast-route-information>
    ## Command: "show multicast route"
    get_multicast_route_information => {
	logical_system => $STRING,
	instance => $STRING,
	all => $TOGGLE,
	active => $TOGGLE,
	inactive => $TOGGLE,
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
	group => $STRING,
	source_prefix => $STRING,
	regexp => $STRING,
	display_tunnel_name => $TOGGLE,
	display_origin_protocol => $TOGGLE,
    },

    ## Method : <get-multicast-next-hops-information>
    ## Returns: <multicast-next-hops-information>
    ## Command: "show multicast next-hops"
    get_multicast_next_hops_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	identifier => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <get-multicast-rpf-information>
    ## Returns: <multicast-rpf-information>
    ## Command: "show multicast rpf"
    get_multicast_rpf_information => {
	logical_system => $STRING,
	instance => $STRING,
	summary => $TOGGLE,
	prefix => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <get-multicast-scope-information>
    ## Returns: <multicast-scope-information>
    ## Command: "show multicast scope"
    get_multicast_scope_information => {
	logical_system => $STRING,
	instance => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <get-multicast-sessions-information>
    ## Returns: <multicast-sessions-information>
    ## Command: "show multicast sessions"
    get_multicast_sessions_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	regexp => $STRING,
    },

    ## Method : <get-multicast-statistics-information>
    ## Returns: <multicast-statistics-information>
    ## Command: "show multicast statistics"
    get_multicast_statistics_information => {
	logical_system => $STRING,
	instance => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <get-multicast-usage-information>
    ## Returns: <multicast-usage-information>
    ## Command: "show multicast usage"
    get_multicast_usage_information => {
	logical_system => $STRING,
	instance => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <get-multicast-flow-maps-information>
    ## Returns: <multicast-flow-maps-information>
    ## Command: "show multicast flow-map"
    get_multicast_flow_maps_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-multicast-interface-information>
    ## Returns: <multicast-interface-information>
    ## Command: "show multicast interface"
    get_multicast_interface_information => {
	logical_system => $STRING,
    },

    ## Method : <get-multicast-pim-to-igmp-proxy-information>
    ## Returns: <multicast-pim-to-igmp-proxy-information>
    ## Command: "show multicast pim-to-igmp-proxy"
    get_multicast_pim_to_igmp_proxy_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-multicast-pim-to-mld-proxy-information>
    ## Returns: <multicast-pim-to-mld-proxy-information>
    ## Command: "show multicast pim-to-mld-proxy"
    get_multicast_pim_to_mld_proxy_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-multicast-backup-pe-groups-information>
    ## Returns: <multicast-backup-pe-groups-information>
    ## Command: "show multicast backup-pe-groups"
    get_multicast_backup_pe_groups_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-multicast-backup-pe-group-information>
    ## Returns: <multicast-backup-pe-groups-information>
    ## Command: "show multicast backup-pe-groups group"
    get_multicast_backup_pe_group_information => {
	logical_system => $STRING,
	instance => $STRING,
	group_name => $STRING,
    },

    ## Method : <get-multicast-backup-pe-address-information>
    ## Returns: <multicast-backup-pe-address-information>
    ## Command: "show multicast backup-pe-groups address"
    get_multicast_backup_pe_address_information => {
	logical_system => $STRING,
	pe_address => $STRING,
    },

    ## Method : <get-pim-bootstrap-information>
    ## Returns: <pim-bootstrap-information>
    ## Command: "show pim bootstrap"
    get_pim_bootstrap_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-pim-bidir-df-election-information>
    ## Returns: <pim-bidir-df-election-information>
    ## Command: "show pim bidirectional df-election"
    get_pim_bidir_df_election_information => {
	logical_system => $STRING,
	instance => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
	rpa => $STRING,
    },

    ## Method : <get-pim-bidir-df-election-interface-information>
    ## Returns: <pim-bidir-df-election-interface-information>
    ## Command: "show pim bidirectional df-election interface"
    get_pim_bidir_df_election_interface_information => {
	logical_system => $STRING,
	instance => $STRING,
	interface_name => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <get-pim-interfaces-information>
    ## Returns: <pim-interfaces-information>
    ## Command: "show pim interfaces"
    get_pim_interfaces_information => {
	logical_system => $STRING,
	interface_name => $STRING,
	instance => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <get-pim-join-information>
    ## Returns: <pim-join-information>
    ## Command: "show pim join"
    get_pim_join_information => {
	logical_system => $STRING,
	instance => $STRING,
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	range => $STRING,
	resolve_mvpn_neighbor => $TOGGLE,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <get-pim-mvpn-information>
    ## Returns: <pim-mvpn-information>
    ## Command: "show pim mvpn"
    get_pim_mvpn_information => {
	logical_system => $STRING,
    },

    ## Method : <get-pim-neighbors-information>
    ## Returns: <pim-neighbors-information>
    ## Command: "show pim neighbors"
    get_pim_neighbors_information => {
	logical_system => $STRING,
	instance => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <get-pim-rps-information>
    ## Returns: <pim-rps-information>
    ## Command: "show pim rps"
    get_pim_rps_information => {
	logical_system => $STRING,
	instance => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	group_address => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <get-pim-source-information>
    ## Returns: <pim-source-information>
    ## Command: "show pim source"
    get_pim_source_information => {
	logical_system => $STRING,
	instance => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	resolve_mvpn_neighbor => $TOGGLE,
	source => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <get-pim-statistics-information>
    ## Returns: <pim-statistics-information>
    ## Command: "show pim statistics"
    get_pim_statistics_information => {
	logical_system => $STRING,
	instance => $STRING,
	interface => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
    },

    ## Method : <get-pim-mdt-information>
    ## Returns: <pim-mdt-information>
    ## Command: "show pim mdt"
    get_pim_mdt_information => {
	logical_system => $STRING,
	outgoing => $TOGGLE,
	incoming => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	range => $STRING,
	instance => $STRING,
    },

    ## Method : <get-pim-data-mdt-limit>
    ## Returns: <pim-data-mdt-limit>
    ## Command: "show pim mdt data-mdt-limit"
    get_pim_data_mdt_limit => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-pim-data-mdt-join-information>
    ## Returns: <pim-data-mdt-join-information>
    ## Command: "show pim mdt data-mdt-joins"
    get_pim_data_mdt_join_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-sap-listen-information>
    ## Returns: <sap-listen-information>
    ## Command: "show sap listen"
    get_sap_listen_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-msdp-information>
    ## Returns: <msdp-peer-information>
    ## Command: "show msdp"
    get_msdp_information => {
	logical_system => $STRING,
	instance => $STRING,
	peer => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-msdp-statistics-information>
    ## Returns: <pim-msdp-statistics-information>
    ## Command: "show msdp statistics"
    get_msdp_statistics_information => {
	logical_system => $STRING,
	instance => $STRING,
	peer => $STRING,
    },

    ## Method : <get-msdp-source-information>
    ## Returns: <pim-msdp-source-information>
    ## Command: "show msdp source"
    get_msdp_source_information => {
	logical_system => $STRING,
	instance => $STRING,
	source => $STRING,
    },

    ## Method : <get-msdp-source-active-information>
    ## Returns: <pim-msdp-source-active-information>
    ## Command: "show msdp source-active"
    get_msdp_source_active_information => {
	logical_system => $STRING,
	instance => $STRING,
	group => $STRING,
	source => $STRING,
	peer => $STRING,
	local => $TOGGLE,
	originator => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-ospf-overview-information>
    ## Returns: <ospf-overview-information>
    ## Command: "show ospf overview"
    get_ospf_overview_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	instance => $STRING,
    },

    ## Method : <get-ospf-database-information>
    ## Returns: <ospf-database-information>
    ## Command: "show ospf database"
    get_ospf_database_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	summary => $TOGGLE,
	router => $TOGGLE,
	network => $TOGGLE,
	netsummary => $TOGGLE,
	asbrsummary => $TOGGLE,
	external => $TOGGLE,
	nssa => $TOGGLE,
	link_local => $TOGGLE,
	opaque_area => $TOGGLE,
	area => $STRING,
	lsa_id => $STRING,
	advertising_router => $STRING,
	instance => $STRING,
    },

    ## Method : <get-ospf-interface-information>
    ## Returns: <ospf-interface-information>
    ## Command: "show ospf interface"
    get_ospf_interface_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	interface_name => $STRING,
	area => $STRING,
	instance => $STRING,
    },

    ## Method : <get-ospf-context-id-information>
    ## Returns: <ospf-context-id-information>
    ## Command: "show ospf context-identifier"
    get_ospf_context_id_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	context_id => $STRING,
	area => $STRING,
	instance => $STRING,
    },

    ## Method : <get-ospf-neighbor-information>
    ## Returns: <ospf-neighbor-information>
    ## Command: "show ospf neighbor"
    get_ospf_neighbor_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	interface => $STRING,
	area => $STRING,
	neighbor => $STRING,
	instance => $STRING,
    },

    ## Method : <get-ospf-route-information>
    ## Returns: <ospf-route-information>
    ## Command: "show ospf route"
    get_ospf_route_information => {
	logical_system => $STRING,
	instance => $STRING,
	topology => $STRING,
	intra => $TOGGLE,
	inter => $TOGGLE,
	extern => $TOGGLE,
	router => $TOGGLE,
	abr => $TOGGLE,
	asbr => $TOGGLE,
	network => $TOGGLE,
	no_backup_coverage => $TOGGLE,
	destination => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-ospf-statistics-information>
    ## Returns: <ospf-statistics-information>
    ## Command: "show ospf statistics"
    get_ospf_statistics_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-ospf-io-statistics-information>
    ## Returns: <ospf-io-statistics-information>
    ## Command: "show ospf io-statistics"
    get_ospf_io_statistics_information => {
	logical_system => $STRING,
    },

    ## Method : <get-ospf-log-information>
    ## Returns: <ospf-log-information>
    ## Command: "show ospf log"
    get_ospf_log_information => {
	logical_system => $STRING,
	instance => $STRING,
	topology => $STRING,
    },

    ## Method : <get-ospf-backup-spf-information>
    ## Returns: <ospf-backup-spf-information>
    ## Command: "show ospf backup spf"
    get_ospf_backup_spf_information => {
	logical_system => $STRING,
	instance => $STRING,
	topology => $STRING,
	area => $STRING,
	no_coverage => $TOGGLE,
	node_id => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-ospf-backup-lsp-information>
    ## Returns: <ospf-backup-lsp-information>
    ## Command: "show ospf backup lsp"
    get_ospf_backup_lsp_information => {
	logical_system => $STRING,
    },

    ## Method : <get-ospf-backup-coverage-information>
    ## Returns: <ospf-backup-coverage-information>
    ## Command: "show ospf backup coverage"
    get_ospf_backup_coverage_information => {
	logical_system => $STRING,
	instance => $STRING,
	topology => $STRING,
    },

    ## Method : <get-ospf-backup-neighbor-information>
    ## Returns: <ospf-backup-neighbor-information>
    ## Command: "show ospf backup neighbor"
    get_ospf_backup_neighbor_information => {
	logical_system => $STRING,
	instance => $STRING,
	topology => $STRING,
	area => $STRING,
    },

    ## Method : <get-ospf3-overview-information>
    ## Returns: <ospf3-overview-information>
    ## Command: "show ospf3 overview"
    get_ospf3_overview_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	instance => $STRING,
	realm => $STRING,
    },

    ## Method : <get-ospf3-database-information>
    ## Returns: <ospf3-database-information>
    ## Command: "show ospf3 database"
    get_ospf3_database_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	summary => $TOGGLE,
	router => $TOGGLE,
	network => $TOGGLE,
	inter_area_prefix => $TOGGLE,
	inter_area_router => $TOGGLE,
	external => $TOGGLE,
	nssa => $TOGGLE,
	link => $TOGGLE,
	link_local => $TOGGLE,
	intra_area_prefix => $TOGGLE,
	area => $STRING,
	lsa_id => $STRING,
	advertising_router => $STRING,
	instance => $STRING,
	realm => $STRING,
    },

    ## Method : <get-ospf3-interface-information>
    ## Returns: <ospf3-interface-information>
    ## Command: "show ospf3 interface"
    get_ospf3_interface_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	interface_name => $STRING,
	area => $STRING,
	instance => $STRING,
	realm => $STRING,
    },

    ## Method : <get-ospf3-neighbor-information>
    ## Returns: <ospf3-neighbor-information>
    ## Command: "show ospf3 neighbor"
    get_ospf3_neighbor_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	interface => $STRING,
	area => $STRING,
	neighbor => $STRING,
	instance => $STRING,
	realm => $STRING,
    },

    ## Method : <get-ospf3-route-information>
    ## Returns: <ospf3-route-information>
    ## Command: "show ospf3 route"
    get_ospf3_route_information => {
	logical_system => $STRING,
	instance => $STRING,
	realm => $STRING,
	intra => $TOGGLE,
	inter => $TOGGLE,
	extern => $TOGGLE,
	router => $TOGGLE,
	abr => $TOGGLE,
	asbr => $TOGGLE,
	transit => $TOGGLE,
	network => $TOGGLE,
	no_backup_coverage => $TOGGLE,
	destination => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-ospf3-statistics-information>
    ## Returns: <ospf3-statistics-information>
    ## Command: "show ospf3 statistics"
    get_ospf3_statistics_information => {
	logical_system => $STRING,
	instance => $STRING,
	realm => $STRING,
    },

    ## Method : <get-ospf3-io-statistics-information>
    ## Returns: <ospf3-io-statistics-information>
    ## Command: "show ospf3 io-statistics"
    get_ospf3_io_statistics_information => {
	logical_system => $STRING,
    },

    ## Method : <get-ospf3-log-information>
    ## Returns: <ospf3-log-information>
    ## Command: "show ospf3 log"
    get_ospf3_log_information => {
	logical_system => $STRING,
	instance => $STRING,
	realm => $STRING,
    },

    ## Method : <get-ospf3-backup-spf-information>
    ## Returns: <ospf3-backup-spf-information>
    ## Command: "show ospf3 backup spf"
    get_ospf3_backup_spf_information => {
	logical_system => $STRING,
	instance => $STRING,
	realm => $STRING,
	area => $STRING,
	no_coverage => $TOGGLE,
	node_id => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-ospf3-backup-lsp-information>
    ## Returns: <ospf3-backup-lsp-information>
    ## Command: "show ospf3 backup lsp"
    get_ospf3_backup_lsp_information => {
	logical_system => $STRING,
	realm => $STRING,
    },

    ## Method : <get-ospf3-backup-coverage-information>
    ## Returns: <ospf3-backup-coverage-information>
    ## Command: "show ospf3 backup coverage"
    get_ospf3_backup_coverage_information => {
	logical_system => $STRING,
	instance => $STRING,
	realm => $STRING,
    },

    ## Method : <get-ospf3-backup-neighbor-information>
    ## Returns: <ospf3-backup-neighbor-information>
    ## Command: "show ospf3 backup neighbor"
    get_ospf3_backup_neighbor_information => {
	logical_system => $STRING,
	instance => $STRING,
	area => $STRING,
    },

    ## Method : <get-rip-statistics-information>
    ## Returns: <rip-statistics-information>
    ## Command: "show rip statistics"
    get_rip_statistics_information => {
	logical_system => $STRING,
	neighbor_name => $STRING,
	instance => $STRING,
    },

    ## Method : <get-rip-peer-information>
    ## Returns: <rip-peer-information>
    ## Command: "show rip statistics peer"
    get_rip_peer_information => {
	logical_system => $STRING,
	address => $STRING,
	all => $TOGGLE,
    },

    ## Method : <get-rip-general-statistics-information>
    ## Returns: <rip-general-statistics-information>
    ## Command: "show rip general-statistics"
    get_rip_general_statistics_information => {
	logical_system => $STRING,
    },

    ## Method : <get-rip-neighbor-information>
    ## Returns: <rip-neighbor-information>
    ## Command: "show rip neighbor"
    get_rip_neighbor_information => {
	logical_system => $STRING,
	neighbor_name => $STRING,
	instance => $STRING,
    },

    ## Method : <get-ripng-statistics-information>
    ## Returns: <ripng-statistics-information>
    ## Command: "show ripng statistics"
    get_ripng_statistics_information => {
	logical_system => $STRING,
	neighbor_name => $STRING,
	instance => $STRING,
    },

    ## Method : <get-ripng-general-statistics-information>
    ## Returns: <ripng-general-statistics-information>
    ## Command: "show ripng general-statistics"
    get_ripng_general_statistics_information => {
	logical_system => $STRING,
    },

    ## Method : <get-ripng-neighbor-information>
    ## Returns: <ripng-neighbor-information>
    ## Command: "show ripng neighbor"
    get_ripng_neighbor_information => {
	logical_system => $STRING,
	neighbor_name => $STRING,
	instance => $STRING,
    },

    ## Method : <get-ccc-information>
    ## Returns: <ccc-information>
    ## Command: "show connections"
    get_ccc_information => {
	logical_system => $STRING,
	all => $TOGGLE,
	interface_switch => $TOGGLE,
	lsp_switch => $TOGGLE,
	p2mp_receive_switch => $TOGGLE,
	remote_interface_switch => $TOGGLE,
	p2mp_transmit_switch => $TOGGLE,
	down => $TOGGLE,
	up => $TOGGLE,
	up_down => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	history => $TOGGLE,
	labels => $TOGGLE,
	status => $TOGGLE,
	connection_name => $STRING,
    },

    ## Method : <get-ldp-overview-information>
    ## Returns: <ldp-overview-information>
    ## Command: "show ldp overview"
    get_ldp_overview_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-ldp-interface-information>
    ## Returns: <ldp-interface-information>
    ## Command: "show ldp interface"
    get_ldp_interface_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	instance => $STRING,
	interface_name => $STRING,
    },

    ## Method : <get-ldp-neighbor-information>
    ## Returns: <ldp-neighbor-information>
    ## Command: "show ldp neighbor"
    get_ldp_neighbor_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	instance => $STRING,
	neighbor => $STRING,
    },

    ## Method : <get-ldp-session-information>
    ## Returns: <ldp-session-information>
    ## Command: "show ldp session"
    get_ldp_session_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	instance => $STRING,
	destination => $STRING,
    },

    ## Method : <get-ldp-route-information>
    ## Returns: <ldp-route-information>
    ## Command: "show ldp route"
    get_ldp_route_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	instance => $STRING,
	destination => $STRING,
    },

    ## Method : <get-ldp-path-information>
    ## Returns: <ldp-path-information>
    ## Command: "show ldp path"
    get_ldp_path_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	instance => $STRING,
	destination => $STRING,
    },

    ## Method : <get-ldp-database-information>
    ## Returns: <ldp-database-information>
    ## Command: "show ldp database"
    get_ldp_database_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	instance => $STRING,
	session => $STRING,
	inet => $TOGGLE,
	l2circuit => $TOGGLE,
	p2mp => $TOGGLE,
    },

    ## Method : <get-ldp-database-label-requests-information>
    ## Returns: <ldp-database-label-requests-information>
    ## Command: "show ldp database label-requests"
    get_ldp_database_label_requests_information => {
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	instance => $STRING,
	session => $STRING,
	inet => $TOGGLE,
	l2circuit => $TOGGLE,
	p2mp => $TOGGLE,
    },

    ## Method : <get-ldp-statistics-information>
    ## Returns: <ldp-statistics-information>
    ## Command: "show ldp statistics"
    get_ldp_statistics_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-ldp-traffic-statistics-information>
    ## Returns: <ldp-traffic-statistics-information>
    ## Command: "show ldp traffic-statistics"
    get_ldp_traffic_statistics_information => {
	logical_system => $STRING,
	instance => $STRING,
	inet => $TOGGLE,
	p2mp => $TOGGLE,
    },

    ## Method : <get-ldp-fec-filters-information>
    ## Returns: <ldp-fec-filters-information>
    ## Command: "show ldp fec-filters"
    get_ldp_fec_filters_information => {
	logical_system => $STRING,
	instance => $STRING,
	fec => $STRING,
    },

    ## Method : <get-ldp-oam-information>
    ## Returns: <ldp-oam-information>
    ## Command: "show ldp oam"
    get_ldp_oam_information => {
	logical_system => $STRING,
	fec => $STRING,
    },

    ## Method : <get-l2ckt-connection-information>
    ## Returns: <l2ckt-connection-information>
    ## Command: "show l2circuit connections"
    get_l2ckt_connection_information => {
	logical_system => $STRING,
	neighbor => $STRING,
	interface => $STRING,
	down => $TOGGLE,
	up => $TOGGLE,
	up_down => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	history => $TOGGLE,
	instance_history => $TOGGLE,
	status => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-l2vpn-connection-information>
    ## Returns: <l2vpn-connection-information>
    ## Command: "show l2vpn connections"
    get_l2vpn_connection_information => {
	logical_system => $STRING,
	instance => $STRING,
	local_site => $STRING,
	remote_site => $STRING,
	down => $TOGGLE,
	up => $TOGGLE,
	up_down => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	history => $TOGGLE,
	instance_history => $TOGGLE,
	status => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-vpls-connection-information>
    ## Returns: <vpls-connection-information>
    ## Command: "show vpls connections"
    get_vpls_connection_information => {
	logical_system => $STRING,
	instance => $STRING,
	local_site => $STRING,
	remote_site => $STRING,
	down => $TOGGLE,
	up => $TOGGLE,
	up_down => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	history => $TOGGLE,
	instance_history => $TOGGLE,
	status => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-vpls-statistics-information>
    ## Returns: <vpls-statistics-information>
    ## Command: "show vpls statistics"
    get_vpls_statistics_information => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-lm-information>
    ## Returns: <lm-information>
    ## Command: "show link-management"
    get_lm_information => $NO_ARGS,

    ## Method : <get-lm-peer-information>
    ## Returns: <lm-peer-information>
    ## Command: "show link-management peer"
    get_lm_peer_information => {
	peer_name => $STRING,
    },

    ## Method : <get-lm-te-link-information>
    ## Returns: <lm-te-link-information>
    ## Command: "show link-management te-link"
    get_lm_te_link_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	link_name => $STRING,
    },

    ## Method : <get-lm-statistics-information>
    ## Returns: <lm-statistics-information>
    ## Command: "show link-management statistics"
    get_lm_statistics_information => $NO_ARGS,

    ## Method : <get-lm-peer-statistics>
    ## Returns: <lm-peer-statistics>
    ## Command: "show link-management statistics peer"
    get_lm_peer_statistics => {
	peer_name => $STRING,
    },

    ## Method : <get-lm-routing-information>
    ## Returns: <lm-information>
    ## Command: "show link-management routing"
    get_lm_routing_information => $NO_ARGS,

    ## Method : <get-lm-routing-peer-information>
    ## Returns: <lm-peer-information>
    ## Command: "show link-management routing peer"
    get_lm_routing_peer_information => {
	peer_name => $STRING,
    },

    ## Method : <get-lm-routing-te-link-information>
    ## Returns: <lm-te-link-information>
    ## Command: "show link-management routing te-link"
    get_lm_routing_te_link_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	link_name => $STRING,
    },

    ## Method : <get-lm-routing-resource-information>
    ## Returns: <lm-resource>
    ## Command: "show link-management routing resource"
    get_lm_routing_resource_information => {
	resource_name => $STRING,
    },

    ## Method : <get-pgm-nak>
    ## Returns: <pgm-nak>
    ## Command: "show pgm negative-acknowledgments"
    get_pgm_nak => $NO_ARGS,

    ## Method : <get-pgm-source-path-messages>
    ## Returns: <pgm-source-path-messages>
    ## Command: "show pgm source-path-messages"
    get_pgm_source_path_messages => $NO_ARGS,

    ## Method : <get-pgm-statistics>
    ## Returns: <pgm-statistics-information>
    ## Command: "show pgm statistics"
    get_pgm_statistics => $NO_ARGS,

    ## Method : <get-bfd-session-information>
    ## Returns: <bfd-session-information>
    ## Command: "show bfd session"
    get_bfd_session_information => {
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <get-bfd-session-address>
    ## Returns: <bfd-session-address>
    ## Command: "show bfd session address"
    get_bfd_session_address => {
	session_addr => $STRING,
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <get-bfd-session-discriminator>
    ## Returns: <bfd-session-discriminator>
    ## Command: "show bfd session discriminator"
    get_bfd_session_discriminator => {
	discr_number => $STRING,
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <get-bfd-session-client>
    ## Returns: <bfd-session-client>
    ## Command: "show bfd session client"
    get_bfd_session_client => $NO_ARGS,

    ## Method : <get-bfd-session-client-rsvp>
    ## Returns: <bfd-session-client-rsvp>
    ## Command: "show bfd session client rsvp-oam"
    get_bfd_session_client_rsvp => {
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-bfd-session-client-vpls>
    ## Returns: <bfd-session-client-vpls>
    ## Command: "show bfd session client vpls-oam"
    get_bfd_session_client_vpls => {
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-bfd-session-client-vpls-instance>
    ## Returns: <bfd-session-client-vpls-instance>
    ## Command: "show bfd session client vpls-oam instance"
    get_bfd_session_client_vpls_instance => {
	routing_instance => $STRING,
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-bfd-session-prefix>
    ## Returns: <bfd-session-prefix>
    ## Command: "show bfd session prefix"
    get_bfd_session_prefix => {
	prefix_addr => $STRING,
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <get-mvpn-instance-information>
    ## Returns: <mvpn-instance-information>
    ## Command: "show mvpn instance"
    get_mvpn_instance_information => {
	logical_system => $STRING,
	display_tunnel_name => $TOGGLE,
	instance_name => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
	summary => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-mvpn-neighbor-information>
    ## Returns: <mvpn-instance-information>
    ## Command: "show mvpn neighbor"
    get_mvpn_neighbor_information => {
	logical_system => $STRING,
	neighbor_address => $STRING,
	instance_name => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
	summary => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-mvpn-c-multicasti-route>
    ## Returns: <mvpn-instance-information>
    ## Command: "show mvpn c-multicast"
    get_mvpn_c_multicasti_route => {
	logical_system => $STRING,
	display_tunnel_name => $TOGGLE,
	instance_name => $STRING,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
	summary => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-security-alarm-information>
    ## Returns: <security-alarm-information>
    ## Command: "show security alarms"
    get_security_alarm_information => {
	alarm_id => $STRING,
	newer_than => $STRING,
	older_than => $STRING,
	process => $STRING,
	severity => $STRING,
	detail => $TOGGLE,
    },

    ## Method : <get-security-log-information>
    ## Returns: <security-log-information>
    ## Command: "show security log"
    get_security_log_information => {
	destination_address => $STRING,
	destination_port => $STRING,
	event_id => $STRING,
	interface_name => $STRING,
	older_than => $STRING,
	policy_name => $STRING,
	process => $STRING,
	protocol => $STRING,
	newer_than => $STRING,
	failure => $TOGGLE,
	success => $TOGGLE,
	severity => $STRING,
	source_address => $STRING,
	source_port => $STRING,
	username => $STRING,
	sort_by => $STRING,
	ascending => $TOGGLE,
	descending => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-hakr-keychain-information>
    ## Returns: <hakr-keychain-information>
    ## Command: "show security keychain"
    get_hakr_keychain_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-event-scripts-policies>
    ## Returns: <none>
    ## Command: "show event-options event-scripts policies"
    get_event_scripts_policies => $NO_ARGS,

    ## Method : <get-amt-tunnel-information>
    ## Returns: <amt-tunnel-information>
    ## Command: "show amt tunnel"
    get_amt_tunnel_information => {
	logical_system => $STRING,
	instance => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-amt-tunnel-interface>
    ## Returns: <amt-tunnel-information>
    ## Command: "show amt tunnel tunnel-interface"
    get_amt_tunnel_interface => {
	logical_system => $STRING,
	instance => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface => $STRING,
    },

    ## Method : <get-amt-tunnel-gateway-address>
    ## Returns: <amt-tunnel-information>
    ## Command: "show amt tunnel gateway-address"
    get_amt_tunnel_gateway_address => {
	logical_system => $STRING,
	instance => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	address => $STRING,
	port => $STRING,
    },

    ## Method : <get-amt-summary>
    ## Returns: <amt-summary>
    ## Command: "show amt summary"
    get_amt_summary => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <get-amt-statistics>
    ## Returns: <amt-instance-statistics>
    ## Command: "show amt statistics"
    get_amt_statistics => {
	logical_system => $STRING,
	instance => $STRING,
    },

    ## Method : <show-protection-group-ethernet-aps>
    ## Returns: <eaps-profile-information>
    ## Command: "show protection-group ethernet-aps"
    show_protection_group_ethernet_aps => {
	protocol => $STRING,
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	profile => $STRING,
	logical_system => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <set-logical-router>
    ## Returns: <cli>
    ## Command: "set cli logical-system"
    set_logical_router => {
	logical_system => $STRING,
    },

    ## Method : <set-cli-working-directory>
    ## Returns: <cli>
    ## Command: "set cli directory"
    set_cli_working_directory => {
	directory => $STRING,
    },

    ## Method : <test-routing-policy>
    ## Returns: <none>
    ## Command: "test policy"
    test_routing_policy => {
	policy => $STRING,
	prefix => $STRING,
    },

    ## Method : <routing-restart>
    ## Returns: <none>
    ## Command: "restart routing"
    routing_restart => {
	logical_system => $STRING,
	gracefully => $TOGGLE,
	soft => $TOGGLE,
	immediately => $TOGGLE,
    },

    ## Method : <restart-kernel-replication>
    ## Returns: <restart-kernel-replication>
    ## Command: "restart kernel-replication"
    restart_kernel_replication => {
	gracefully => $TOGGLE,
	soft => $TOGGLE,
	immediately => $TOGGLE,
    },

    ## Method : <restart-web-management>
    ## Returns: <none>
    ## Command: "restart web-management"
    restart_web_management => $NO_ARGS,

    ## Method : <restart-named-service>
    ## Returns: <none>
    ## Command: "restart named-service"
    restart_named_service => $NO_ARGS,

    ## Method : <revert-redundancy-interface-to-primary>
    ## Returns: <none>
    ## Command: "request interface revert"
    revert_redundancy_interface_to_primary => {
	interface_name => $STRING,
    },

    ## Method : <switch-redundancy-interface-to-secondary>
    ## Returns: <none>
    ## Command: "request interface switchover"
    switch_redundancy_interface_to_secondary => {
	interface_name => $STRING,
    },

    ## Method : <request-load-balancing-revert>
    ## Returns: <load-balancing-revert>
    ## Command: "request interface load-balancing revert"
    request_load_balancing_revert => {
	interface_name => $STRING,
    },

    ## Method : <request-load-balancing-switchover>
    ## Returns: <none>
    ## Command: "request interface load-balancing switchover"
    request_load_balancing_switchover => {
	interface_name => $STRING,
    },

    ## Method : <request-package-add>
    ## Returns: nothing
    ## Command: "request system software add"
    request_package_add => {
	force => $TOGGLE,
	reboot => $TOGGLE,
	no_auto_reboot => $TOGGLE,
	delay_restart => $TOGGLE,
	no_copy => $TOGGLE,
	no_validate => $TOGGLE,
	validate => $TOGGLE,
	best_effort_load => $TOGGLE,
	unlink => $TOGGLE,
	partition => $TOGGLE,
	re0 => $TOGGLE,
	re1 => $TOGGLE,
	scc => $TOGGLE,
	lcc => $STRING,
	sfc => $TOGGLE,
	member => $STRING,
	dont_forward => $TOGGLE,
	upgrade_with_config_format => $STRING,
	package_name => $STRING,
    },

    ## Method : <abort-in-service-upgrade>
    ## Returns: nothing
    ## Command: "request system software abort in-service-upgrade"
    abort_in_service_upgrade => $NO_ARGS,

    ## Method : <request-package-in-service-upgrade>
    ## Returns: nothing
    ## Command: "request system software in-service-upgrade"
    request_package_in_service_upgrade => {
	reboot => $TOGGLE,
	package_name => $STRING,
	no_old_master_upgrade => $TOGGLE,
	no_copy => $TOGGLE,
	unlink => $TOGGLE,
	no_sync => $TOGGLE,
	no_validate => $TOGGLE,
	no_tcp_syn_check => $STRING,
    },

    ## Method : <request-package-nonstop-upgrade>
    ## Returns: nothing
    ## Command: "request system software nonstop-upgrade"
    request_package_nonstop_upgrade => {
	reboot => $TOGGLE,
	package_name => $STRING,
	no_old_master_upgrade => $TOGGLE,
	no_validate => $TOGGLE,
    },

    ## Method : <request-package-delete>
    ## Returns: nothing
    ## Command: "request system software delete"
    request_package_delete => {
	force => $TOGGLE,
	package_name => $STRING,
	reboot => $TOGGLE,
    },

    ## Method : <request-package-rollback>
    ## Returns: nothing
    ## Command: "request system software rollback"
    request_package_rollback => {
	reboot => $TOGGLE,
    },

    ## Method : <request-package-validate>
    ## Returns: nothing
    ## Command: "request system software validate"
    request_package_validate => {
	upgrade_with_config_format => $STRING,
	package_name => $STRING,
	scc => $TOGGLE,
	lcc => $STRING,
	sfc => $TOGGLE,
	member => $STRING,
	dont_forward => $TOGGLE,
    },

    ## Method : <check-in-service-upgrade>
    ## Returns: nothing
    ## Command: "request system software validate in-service-upgrade"
    check_in_service_upgrade => {
	package_name => $STRING,
    },

    ## Method : <request-package-delete-backup>
    ## Returns: nothing
    ## Command: "request system software delete-backup"
    request_package_delete_backup => $NO_ARGS,

    ## Method : <request-commit-server-cleanup>
    ## Returns: <commit-server-delete-results>
    ## Command: "request system commit server queue cleanup"
    request_commit_server_cleanup => {
	id => $STRING,
	job_status => $STRING,
    },

    ## Method : <request-commit-server-pause>
    ## Returns: <commit-server-information>
    ## Command: "request system commit server pause"
    request_commit_server_pause => $NO_ARGS,

    ## Method : <request-commit-server-start>
    ## Returns: <commit-server-information>
    ## Command: "request system commit server start"
    request_commit_server_start => $NO_ARGS,

    ## Method : <request-logout-user>
    ## Returns: <logout-user>
    ## Command: "request system logout"
    request_logout_user => {
	all => $TOGGLE,
	user => $STRING,
	terminal => $STRING,
	pid => $STRING,
    },

    ## Method : <request-license-delete>
    ## Returns: <none>
    ## Command: "request system license delete"
    request_license_delete => {
	all => $TOGGLE,
	license_identifier => $STRING,
    },

    ## Method : <request-license-update>
    ## Returns: <none>
    ## Command: "request system license update"
    request_license_update => {
	trial => $TOGGLE,
    },

    ## Method : <request-system-zeroize>
    ## Returns: <none>
    ## Command: "request system zeroize"
    request_system_zeroize => {
	media => $TOGGLE,
    },

    ## Method : <request-scripts-package-add>
    ## Returns: <none>
    ## Command: "request system scripts add"
    request_scripts_package_add => {
	no_copy => $TOGGLE,
	unlink => $TOGGLE,
	package_name => $STRING,
	scc => $TOGGLE,
	lcc => $STRING,
	sfc => $TOGGLE,
	member => $STRING,
	dont_forward => $TOGGLE,
    },

    ## Method : <request-scripts-package-delete>
    ## Returns: <none>
    ## Command: "request system scripts delete"
    request_scripts_package_delete => $NO_ARGS,

    ## Method : <request-scripts-package-rollback>
    ## Returns: <none>
    ## Command: "request system scripts rollback"
    request_scripts_package_rollback => $NO_ARGS,

    ## Method : <request-script-refresh-from>
    ## Returns: <none>
    ## Command: "request system scripts refresh-from"
    request_script_refresh_from => {
	commit => $TOGGLE,
	op => $TOGGLE,
	event => $TOGGLE,
	file => $STRING,
	url => $STRING,
    },

    ## Method : <reload-event-scripts>
    ## Returns: <event-scripts-reload>
    ## Command: "request system scripts event-scripts reload"
    reload_event_scripts => $NO_ARGS,

    ## Method : <fips-selftest>
    ## Returns: nothing
    ## Command: "request system fips self-test"
    fips_selftest => $NO_ARGS,

    ## Method : <request-system-routing-core-dump>
    ## Returns: <none>
    ## Command: "request system core-dump routing"
    request_system_routing_core_dump => {
	logical_system => $STRING,
	fabric => $TOGGLE,
    },

    ## Method : <request-system-routing-core-dump-running>
    ## Returns: <none>
    ## Command: "request system core-dump routing running"
    request_system_routing_core_dump_running => {
	logical_system => $STRING,
	fabric => $TOGGLE,
    },

    ## Method : <request-system-routing-core-dump-fatal>
    ## Returns: <none>
    ## Command: "request system core-dump routing fatal"
    request_system_routing_core_dump_fatal => {
	logical_system => $STRING,
	fabric => $TOGGLE,
    },

    ## Method : <request-mpls-lsp-autobandwidth-adjust>
    ## Returns: <none>
    ## Command: "request mpls lsp adjust-autobandwidth"
    request_mpls_lsp_autobandwidth_adjust => {
	logical_system => $STRING,
	regex => $STRING,
    },

    ## Method : <request-protection-group-ethernet-aps>
    ## Returns: <none>
    ## Command: "request protection-group ethernet-aps"
    request_protection_group_ethernet_aps => {
	maintenance_domain => $STRING,
	maintenance_association => $STRING,
	switch_to_working => $TOGGLE,
	switch_to_protect => $TOGGLE,
	lockout => $TOGGLE,
	force_switch => $TOGGLE,
	manual_switch => $TOGGLE,
	exercise => $TOGGLE,
	clear => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <op-script>
    ## Returns: <none>
    ## Command: "op"
    op_script => {
	script => $STRING,
	detail => $TOGGLE,
    },

    ## Method : <op-url>
    ## Returns: nothing
    ## Command: "op url"
    op_url => {
	url_name => $STRING,
	detail => $TOGGLE,
	md5 => $TOGGLE,
	sha1 => $TOGGLE,
	sha_256 => $TOGGLE,
	key_value => $STRING,
    },

    ## Method : <get-syslog-tag-information>
    ## Returns: <syslog-tag-information>
    ## Command: "help syslog"
    get_syslog_tag_information => {
	syslog_tag => $STRING,
    },

    ## Method : <get-syslog-facility-information>
    ## Returns: <syslog-tag-information>
    ## Command: "help syslog facility"
    get_syslog_facility_information => {
	facility_name => $STRING,
    },

    ## Method : <get-cli-tip>
    ## Returns: <tip>
    ## Command: "help tip cli"
    get_cli_tip => {
	number => $STRING,
    },

    ## Method : <get-checksum-information>
    ## Returns: <checksum-information>
    ## Command: "file checksum md5"
    get_checksum_information => {
	path => $STRING,
	method => $STRING,
    },

    ## Method : <get-sha1-checksum-information>
    ## Returns: <checksum-information>
    ## Command: "file checksum sha1"
    get_sha1_checksum_information => {
	path => $STRING,
    },

    ## Method : <get-sha256-checksum-information>
    ## Returns: <checksum-information>
    ## Command: "file checksum sha-256"
    get_sha256_checksum_information => {
	path => $STRING,
    },

    ## Method : <file-list>
    ## Returns: <directory-list>
    ## Command: "file list"
    file_list => {
	detail => $TOGGLE,
	recursive => $TOGGLE,
	path => $STRING,
    },

    ## Method : <file-delete>
    ## Returns: <none>
    ## Command: "file delete"
    file_delete => {
	purge => $TOGGLE,
	path => $STRING,
    },

    ## Method : <file-show>
    ## Returns: <file-content>
    ## Command: "file show"
    file_show => {
	filename => $STRING,
	encoding => $STRING,
    },

    ## Method : <file-compare>
    ## Returns: nothing
    ## Command: "file compare"
    file_compare => {
	context => $TOGGLE,
	unified => $TOGGLE,
	ignore_white_space => $TOGGLE,
	from_file => $STRING,
	to_file => $STRING,
    },

    ## Method : <file-archive>
    ## Returns: <none>
    ## Command: "file archive"
    file_archive => {
	compress => $TOGGLE,
	destination => $STRING,
	source => $STRING,
    },

    ## Method : <request-ping-rsvp-lsp>
    ## Returns: <lsping-results>
    ## Command: "ping mpls rsvp"
    request_ping_rsvp_lsp => {
	lsp_name => $STRING,
	standby => $STRING,
	multipoint => $TOGGLE,
	egress => $STRING,
	count => $STRING,
	source => $STRING,
	destination => $STRING,
	exp => $STRING,
	detail => $TOGGLE,
	size => $STRING,
	sweep => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <request-ping-rsvp-dynamic-bypass-lsp>
    ## Returns: <lsping-results>
    ## Command: "ping mpls rsvp dynamic-bypass"
    request_ping_rsvp_dynamic_bypass_lsp => {
	lsp_name => $STRING,
	count => $STRING,
	source => $STRING,
	destination => $STRING,
	exp => $STRING,
	detail => $TOGGLE,
	size => $STRING,
	sweep => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <request-ping-rsvp-manual-bypass-lsp>
    ## Returns: <lsping-results>
    ## Command: "ping mpls rsvp manual-bypass"
    request_ping_rsvp_manual_bypass_lsp => {
	lsp_name => $STRING,
	interface => $STRING,
	count => $STRING,
	source => $STRING,
	destination => $STRING,
	exp => $STRING,
	detail => $TOGGLE,
	size => $STRING,
	sweep => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <request-ping-ldp-lsp>
    ## Returns: <lsping-results>
    ## Command: "ping mpls ldp"
    request_ping_ldp_lsp => {
	fec => $STRING,
	instance => $STRING,
	count => $STRING,
	source => $STRING,
	destination => $STRING,
	exp => $STRING,
	detail => $TOGGLE,
	size => $STRING,
	sweep => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <request-ping-ldp-p2mp-lsp>
    ## Returns: <lsping-results>
    ## Command: "ping mpls ldp p2mp"
    request_ping_ldp_p2mp_lsp => {
	root_addr => $STRING,
	lsp_id => $STRING,
	egress => $STRING,
	instance => $STRING,
	count => $STRING,
	source => $STRING,
	destination => $STRING,
	exp => $STRING,
	detail => $TOGGLE,
	size => $STRING,
	sweep => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <request-ping-bgp-lsp>
    ## Returns: <lsping-results>
    ## Command: "ping mpls bgp"
    request_ping_bgp_lsp => {
	fec => $STRING,
	bottom_label_ttl => $STRING,
	instance => $STRING,
	count => $STRING,
	source => $STRING,
	destination => $STRING,
	exp => $STRING,
	detail => $TOGGLE,
	size => $STRING,
	sweep => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <request-ping-l3vpn>
    ## Returns: <lsping-results>
    ## Command: "ping mpls l3vpn"
    request_ping_l3vpn => {
	l3vpn_name => $STRING,
	prefix => $STRING,
	bottom_label_ttl => $STRING,
	count => $STRING,
	source => $STRING,
	destination => $STRING,
	exp => $STRING,
	detail => $TOGGLE,
	size => $STRING,
	sweep => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <request-ping-l2vpn-interface>
    ## Returns: <lsping-results>
    ## Command: "ping mpls l2vpn interface"
    request_ping_l2vpn_interface => {
	interface_name => $STRING,
	bottom_label_ttl => $STRING,
	reply_mode => $STRING,
	count => $STRING,
	source => $STRING,
	destination => $STRING,
	exp => $STRING,
	detail => $TOGGLE,
	size => $STRING,
	sweep => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <request-ping-l2vpn-instance>
    ## Returns: <lsping-results>
    ## Command: "ping mpls l2vpn instance"
    request_ping_l2vpn_instance => {
	instance_name => $STRING,
	local_site_id => $STRING,
	remote_site_id => $STRING,
	bottom_label_ttl => $STRING,
	reply_mode => $STRING,
	count => $STRING,
	source => $STRING,
	destination => $STRING,
	exp => $STRING,
	detail => $TOGGLE,
	size => $STRING,
	sweep => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <request-ping-l2vpn-fec129-instance>
    ## Returns: nothing
    ## Command: "ping mpls l2vpn fec129 instance"
    request_ping_l2vpn_fec129_instance => {
	instance_name => $STRING,
	remote_id => $STRING,
	remote_pe_address => $STRING,
	bottom_label_ttl => $STRING,
	reply_mode => $STRING,
	count => $STRING,
	source => $STRING,
	destination => $STRING,
	exp => $STRING,
	detail => $TOGGLE,
	size => $STRING,
	sweep => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <request-ping-l2circuit-interface>
    ## Returns: <lsping-results>
    ## Command: "ping mpls l2circuit interface"
    request_ping_l2circuit_interface => {
	v1 => $TOGGLE,
	interface_name => $STRING,
	reply_mode => $STRING,
	count => $STRING,
	source => $STRING,
	destination => $STRING,
	exp => $STRING,
	detail => $TOGGLE,
	size => $STRING,
	sweep => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <request-ping-l2circuit-virtual-circuit>
    ## Returns: <lsping-results>
    ## Command: "ping mpls l2circuit virtual-circuit"
    request_ping_l2circuit_virtual_circuit => {
	v1 => $TOGGLE,
	neighbor => $STRING,
	virtual_circuit_id => $STRING,
	reply_mode => $STRING,
	count => $STRING,
	source => $STRING,
	destination => $STRING,
	exp => $STRING,
	detail => $TOGGLE,
	size => $STRING,
	sweep => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <request-ping-lsp-end-point>
    ## Returns: <lsping-results>
    ## Command: "ping mpls lsp-end-point"
    request_ping_lsp_end_point => {
	prefix => $STRING,
	instance => $STRING,
	count => $STRING,
	source => $STRING,
	destination => $STRING,
	exp => $STRING,
	detail => $TOGGLE,
	size => $STRING,
	sweep => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <request-ping-vpls-instance>
    ## Returns: <lsping-results>
    ## Command: "ping vpls instance"
    request_ping_vpls_instance => {
	instance_name => $STRING,
	destination_mac => $STRING,
	source_ip => $STRING,
	learning_vlan_id => $STRING,
	control_plane_response => $TOGGLE,
	bd_name => $STRING,
	count => $STRING,
	detail => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <traceroute-mpls-ldp>
    ## Returns: <tracelsp>
    ## Command: "traceroute mpls ldp"
    traceroute_mpls_ldp => {
	logical_system => $STRING,
	fec => $STRING,
	retries => $STRING,
	source => $STRING,
	exp => $STRING,
	detail => $TOGGLE,
	no_resolve => $TOGGLE,
	routing_instance => $STRING,
	ttl => $STRING,
	wait => $STRING,
	paths => $STRING,
	update => $TOGGLE,
	fanout => $STRING,
	destination => $STRING,
    },

    ## Method : <traceroute-mpls-rsvp>
    ## Returns: <tracelsp>
    ## Command: "traceroute mpls rsvp"
    traceroute_mpls_rsvp => {
	logical_system => $STRING,
	lsp_name => $STRING,
	egress => $STRING,
	multipoint => $TOGGLE,
	ttl => $STRING,
	retries => $STRING,
	source => $STRING,
	exp => $STRING,
	detail => $TOGGLE,
	no_resolve => $TOGGLE,
    },

);
1;
