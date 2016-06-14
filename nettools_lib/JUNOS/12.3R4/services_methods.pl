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
# FILE: services_methods.pl -- generated automagikally; DO NOT EDIT
#

%services_methods = (
    ## Method : <clear-service-msp-flow-table-information>
    ## Returns: <service-msp-flow-drain-information>
    ## Command: "clear services flows"
    clear_service_msp_flow_table_information => {
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	service_set => $STRING,
	interface => $STRING,
	application_protocol => $STRING,
    },

    ## Method : <clear-service-msp-flow-ipaction-table>
    ## Returns: <service-msp-flow-drain-information>
    ## Command: "clear services flows ip-action"
    clear_service_msp_flow_ipaction_table => {
    },

    ## Method : <clear-service-sfw-flow-table-information>
    ## Returns: <service-sfw-flow-drain-information>
    ## Command: "clear services stateful-firewall flows"
    clear_service_sfw_flow_table_information => {
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	application_protocol => $STRING,
	service_set => $STRING,
	interface => $STRING,
    },

    ## Method : <clear-service-flow-analysis>
    ## Returns: <clear-service-flow-analysis>
    ## Command: "clear services stateful-firewall flow-analysis"
    clear_service_flow_analysis => {
	interface => $STRING,
    },

    ## Method : <clear-service-subs-analysis>
    ## Returns: <clear-service-subs-analysis>
    ## Command: "clear services stateful-firewall subscriber-analysis"
    clear_service_subs_analysis => {
	interface => $STRING,
    },

    ## Method : <clear-service-sfw-sip-call-information>
    ## Returns: <service-sfw-sip-call-drain-information>
    ## Command: "clear services stateful-firewall sip-call"
    clear_service_sfw_sip_call_information => {
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	application_protocol => $STRING,
	service_set => $STRING,
	interface => $STRING,
    },

    ## Method : <clear-service-sfw-sip-register-information>
    ## Returns: <service-sfw-sip-register-drain-information>
    ## Command: "clear services stateful-firewall sip-register"
    clear_service_sfw_sip_register_information => {
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	application_protocol => $STRING,
	service_set => $STRING,
	interface => $STRING,
    },

    ## Method : <clear-stateful-firewall-statistics>
    ## Returns: <none>
    ## Command: "clear services stateful-firewall statistics"
    clear_stateful_firewall_statistics => {
	interface => $STRING,
    },

    ## Method : <clear-service-nat-statistics-information>
    ## Returns: <service-nat-statistics-clear-information>
    ## Command: "clear services nat statistics"
    clear_service_nat_statistics_information => {
	service_set => $STRING,
	interface => $STRING,
    },

    ## Method : <clear-inline-softwire-statistics>
    ## Returns: <none>
    ## Command: "clear services inline softwire statistics"
    clear_inline_softwire_statistics => {
	interface => $STRING,
	v6rd => $TOGGLE,
    },

    ## Method : <clear-inline-nat-statistics>
    ## Returns: <none>
    ## Command: "clear services inline nat statistics"
    clear_inline_nat_statistics => {
	interface => $STRING,
    },

    ## Method : <clear-inline-nat-pool-information>
    ## Returns: <none>
    ## Command: "clear services inline nat pool"
    clear_inline_nat_pool_information => {
	pool_name => $STRING,
    },

    ## Method : <clear-service-pcp-epoch>
    ## Returns: <service-pcp-epoch-information>
    ## Command: "clear services pcp epoch"
    clear_service_pcp_epoch => {
	interface => $STRING,
	server_name => $STRING,
    },

    ## Method : <clear-service-pcp-statistics>
    ## Returns: <service-pcp-statistics-drain-information>
    ## Command: "clear services pcp statistics"
    clear_service_pcp_statistics => {
	interface => $STRING,
    },

    ## Method : <clear-services-cos-statistics>
    ## Returns: <none>
    ## Command: "clear services cos statistics"
    clear_services_cos_statistics => {
	service_set => $STRING,
	interface => $STRING,
    },

    ## Method : <clear-services-softwire-statistics>
    ## Returns: <none>
    ## Command: "clear services softwire statistics"
    clear_services_softwire_statistics => {
	interface => $STRING,
    },

    ## Method : <clear-service-pgcp-gates>
    ## Returns: <service-pgcp-gates-drain-information>
    ## Command: "clear services pgcp gates"
    clear_service_pgcp_gates => $NO_ARGS,

    ## Method : <clear-service-pgcp-gates-gateway>
    ## Returns: <service-pgcp-gates-gateway-drain-information>
    ## Command: "clear services pgcp gates gateway"
    clear_service_pgcp_gates_gateway => {
	gateway_name => $STRING,
    },

    ## Method : <clear-service-pgcp-statistics>
    ## Returns: <service-pgcp-statistics-drain-information>
    ## Command: "clear services pgcp statistics"
    clear_service_pgcp_statistics => $NO_ARGS,

    ## Method : <clear-service-pgcp-statistics-gateway>
    ## Returns: <service-pgcp-statistics-gateway-drain-information>
    ## Command: "clear services pgcp statistics gateway"
    clear_service_pgcp_statistics_gateway => {
	gateway_name => $STRING,
    },

    ## Method : <clear-service-border-signaling-gateway-statistics>
    ## Returns: <service-border-signaling-gateway-drain-information>
    ## Command: "clear services border-signaling-gateway statistics"
    clear_service_border_signaling_gateway_statistics => {
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <clear-service-bsg-registrations>
    ## Returns: <clear-service-bsg-registrations>
    ## Command: "clear services border-signaling-gateway registrations"
    clear_service_bsg_registrations => $NO_ARGS,

    ## Method : <clear-service-bsg-registrations-statistics>
    ## Returns: <clear-service-bsg-registrations>
    ## Command: "clear services border-signaling-gateway registrations statistics"
    clear_service_bsg_registrations_statistics => {
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <clear-services-bsg-registrations-subscription>
    ## Returns: <clear-services-bsg-registrations-subscription>
    ## Command: "clear services border-signaling-gateway registrations subscription"
    clear_services_bsg_registrations_subscription => {
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
	address_of_record => $STRING,
	forceful => $TOGGLE,
	graceful => $TOGGLE,
    },

    ## Method : <clear-service-bsg-denied-messages>
    ## Returns: <bsg-statistics-clear-denied-messages>
    ## Command: "clear services border-signaling-gateway denied-messages"
    clear_service_bsg_denied_messages => {
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <clear-border-signaling-gateway-name-resolution-cache-by-fqdn>
    ## Returns: <bsg-drain-name-resolution-details>
    ## Command: "clear services border-signaling-gateway name-resolution-cache by-fqdn"
    clear_border_signaling_gateway_name_resolution_cache_by_fqdn => {
	fqdn => $STRING,
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <clear-service-border-signaling-gateway-name-resolution-cache-all>
    ## Returns: <bsg-drain-name-resolution-details>
    ## Command: "clear services border-signaling-gateway name-resolution-cache all"
    clear_service_border_signaling_gateway_name_resolution_cache_all => {
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <clear-services-ids-tables>
    ## Returns: <none>
    ## Command: "clear services ids"
    clear_services_ids_tables => {
	service_set => $STRING,
	interface => $STRING,
    },

    ## Method : <clear-services-ids-source-table>
    ## Returns: <none>
    ## Command: "clear services ids source-table"
    clear_services_ids_source_table => {
	source_prefix => $STRING,
	service_set => $STRING,
	interface => $STRING,
    },

    ## Method : <clear-services-ids-destination-table>
    ## Returns: <none>
    ## Command: "clear services ids destination-table"
    clear_services_ids_destination_table => {
	destination_prefix => $STRING,
	service_set => $STRING,
	interface => $STRING,
    },

    ## Method : <clear-services-ids-pair-table>
    ## Returns: <none>
    ## Command: "clear services ids pair-table"
    clear_services_ids_pair_table => {
	source_prefix => $STRING,
	destination_prefix => $STRING,
	service_set => $STRING,
	interface => $STRING,
    },

    ## Method : <clear-l2tp-destinations-information>
    ## Returns: <none>
    ## Command: "clear services l2tp destination"
    clear_l2tp_destinations_information => {
	all => $TOGGLE,
    },

    ## Method : <clear-l2tp-tunnel-information>
    ## Returns: <service-l2tp-tunnel-clear-information>
    ## Command: "clear services l2tp tunnel"
    clear_l2tp_tunnel_information => {
	statistics => $TOGGLE,
	tunnel_group => $STRING,
	local_tunnel_id => $STRING,
	local_gateway => $STRING,
	local_gateway_name => $STRING,
	peer_gateway => $STRING,
	peer_gateway_name => $STRING,
	all => $TOGGLE,
	interface => $STRING,
    },

    ## Method : <clear-l2tp-session-information>
    ## Returns: <service-l2tp-session-clear-information>
    ## Command: "clear services l2tp session"
    clear_l2tp_session_information => {
	statistics => $TOGGLE,
	tunnel_group => $STRING,
	local_tunnel_id => $STRING,
	local_gateway => $STRING,
	local_gateway_name => $STRING,
	peer_gateway => $STRING,
	peer_gateway_name => $STRING,
	local_session_id => $STRING,
	user => $STRING,
	interface => $STRING,
	all => $TOGGLE,
    },

    ## Method : <clear-l2tp-user-session-information>
    ## Returns: <service-l2tp-session-clear-information>
    ## Command: "clear services l2tp user"
    clear_l2tp_user_session_information => {
	statistics => $TOGGLE,
	user => $STRING,
	all => $TOGGLE,
    },

    ## Method : <clear-l2tp-multilink-information>
    ## Returns: <service-l2tp-multilink-clear-information>
    ## Command: "clear services l2tp multilink"
    clear_l2tp_multilink_information => {
	statistics => $TOGGLE,
	bundle_id => $STRING,
	all => $TOGGLE,
    },

    ## Method : <clear-l2tp-disconnect-cause-summary>
    ## Returns: <none>
    ## Command: "clear services l2tp disconnect-cause-summary"
    clear_l2tp_disconnect_cause_summary => $NO_ARGS,

    ## Method : <clear-services-crtp-statistics>
    ## Returns: <none>
    ## Command: "clear services crtp statistics"
    clear_services_crtp_statistics => {
	interface => $STRING,
    },

    ## Method : <clear-service-set-packet-drop-statistics>
    ## Returns: <service-set-packet-drop-statistics>
    ## Command: "clear services service-sets statistics packet-drops"
    clear_service_set_packet_drop_statistics => {
	interface => $STRING,
    },

    ## Method : <clear-service-set-syslog-statistics>
    ## Returns: <service-set-syslog-drop-statistics>
    ## Command: "clear services service-sets statistics syslog"
    clear_service_set_syslog_statistics => {
	service_set => $STRING,
	interface => $STRING,
    },

    ## Method : <clear-services-alg-statistics>
    ## Returns: <none>
    ## Command: "clear services alg statistics"
    clear_services_alg_statistics => {
	interface => $STRING,
	application_protocol => $STRING,
    },

    ## Method : <clear-firewall-counters>
    ## Returns: <none>
    ## Command: "clear firewall"
    clear_firewall_counters => {
	counter => $STRING,
	filter => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-all-firewall-conters>
    ## Returns: <none>
    ## Command: "clear firewall all"
    clear_all_firewall_conters => {
	logical_system => $STRING,
    },

    ## Method : <clear-firewall-policer-counter-statistics>
    ## Returns: <none>
    ## Command: "clear firewall policer counter"
    clear_firewall_policer_counter_statistics => {
	logical_system => $STRING,
	counter_id => $STRING,
    },

    ## Method : <clear-all-firewall-policer-counter-statistics>
    ## Returns: <none>
    ## Command: "clear firewall policer counter all"
    clear_all_firewall_policer_counter_statistics => {
	logical_system => $STRING,
    },

    ## Method : <clear-firewall-log>
    ## Returns: <none>
    ## Command: "clear firewall log"
    clear_firewall_log => {
	logical_system => $STRING,
    },

    ## Method : <get-service-set-memory-statistics>
    ## Returns: <service-set-memory-statistics-information>
    ## Command: "show services service-sets memory-usage"
    get_service_set_memory_statistics => {
	service_set => $STRING,
	interface => $STRING,
    },

    ## Method : <get-service-set-cpu-statistics>
    ## Returns: <service-set-cpu-statistics-information>
    ## Command: "show services service-sets cpu-usage"
    get_service_set_cpu_statistics => {
	service_set => $STRING,
	interface => $STRING,
    },

    ## Method : <get-service-set-summary-information>
    ## Returns: <service-set-summary-information>
    ## Command: "show services service-sets summary"
    get_service_set_summary_information => {
	interface => $STRING,
    },

    ## Method : <get-service-set-packet-drop-statistics>
    ## Returns: <service-set-packet-drop-statistics>
    ## Command: "show services service-sets statistics packet-drops"
    get_service_set_packet_drop_statistics => {
	interface => $STRING,
    },

    ## Method : <get-service-set-tcp-mss-statistics>
    ## Returns: <service-set-tcp-mss-statistics>
    ## Command: "show services service-sets statistics tcp-mss"
    get_service_set_tcp_mss_statistics => {
	interface => $STRING,
    },

    ## Method : <get-service-set-syslog-statistics>
    ## Returns: <syslog-stats-interface>
    ## Command: "show services service-sets statistics syslog"
    get_service_set_syslog_statistics => {
	service_set => $STRING,
	interface => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-service-set-plugin-summary>
    ## Returns: <service-set-plugin-summary>
    ## Command: "show services service-sets plug-ins"
    get_service_set_plugin_summary => {
	interface => $STRING,
    },

    ## Method : <get-service-nat-pool-information>
    ## Returns: <service-nat-pool-information>
    ## Command: "show services nat pool"
    get_service_nat_pool_information => {
	pool_name => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-service-detnat-information>
    ## Returns: <service-detnat-information>
    ## Command: "show services nat deterministic-nat internal-host"
    get_service_detnat_information => {
	nat_address => $STRING,
	nat_port => $STRING,
    },

    ## Method : <get-service-detnat-pb-information>
    ## Returns: <service-detnat-information>
    ## Command: "show services nat deterministic-nat nat-port-block"
    get_service_detnat_pb_information => {
	internal_address => $STRING,
    },

    ## Method : <get-service-nat-ipv6-multicast-information>
    ## Returns: <service-nat-ipv6-multicast-interfaces-information>
    ## Command: "show services nat ipv6-multicast-interfaces"
    get_service_nat_ipv6_multicast_information => $NO_ARGS,

    ## Method : <get-service-nat-mapping-address-pooling-paired>
    ## Returns: <service-nat-mapping-address-pooling-paired>
    ## Command: "show services nat mappings address-pooling-paired"
    get_service_nat_mapping_address_pooling_paired => $NO_ARGS,

    ## Method : <get-service-nat-mapping-endpoint-independent>
    ## Returns: <service-nat-mapping-endpoint-independent>
    ## Command: "show services nat mappings endpoint-independent"
    get_service_nat_mapping_endpoint_independent => $NO_ARGS,

    ## Method : <get-service-nat-mapping-pcp>
    ## Returns: <service-nat-mapping-pcp>
    ## Command: "show services nat mappings pcp"
    get_service_nat_mapping_pcp => $NO_ARGS,

    ## Method : <get-service-nat-mapping-summary>
    ## Returns: <service-nat-mapping-summary>
    ## Command: "show services nat mappings summary"
    get_service_nat_mapping_summary => $NO_ARGS,

    ## Method : <get-service-nat-mapping-brief>
    ## Returns: <service-nat-mapping-address-pooling-paired>
    ## Command: "show services nat mappings brief"
    get_service_nat_mapping_brief => {
	pool_name => $STRING,
    },

    ## Method : <get-service-nat-mapping-detail>
    ## Returns: <service-nat-mapping-endpoint-independent>
    ## Command: "show services nat mappings detail"
    get_service_nat_mapping_detail => {
	pool_name => $STRING,
    },

    ## Method : <get-service-nat-statistics-information>
    ## Returns: <service-nat-statistics-information>
    ## Command: "show services nat statistics"
    get_service_nat_statistics_information => {
	interface => $STRING,
    },

    ## Method : <get-service-cos-statistics-information>
    ## Returns: <service-cos-statistics-information>
    ## Command: "show services cos statistics"
    get_service_cos_statistics_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	summary => $TOGGLE,
	service_set => $STRING,
	interface => $STRING,
    },

    ## Method : <get-service-cos-diffserv-statistics>
    ## Returns: <service-cos-diffserv-statistics>
    ## Command: "show services cos statistics diffserv"
    get_service_cos_diffserv_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-service-cos-forwarding-class-statistics>
    ## Returns: <service-cos-forwarding-class-statistics>
    ## Command: "show services cos statistics forwarding-class"
    get_service_cos_forwarding_class_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-service-hcm-statistics-information>
    ## Returns: <service-hcm-statistics-information>
    ## Command: "show services hcm statistics"
    get_service_hcm_statistics_information => {
	rule => $STRING,
    },

    ## Method : <get-service-pgcp-flow-table-information>
    ## Returns: <service-pgcp-flow-table-information>
    ## Command: "show services pgcp flows"
    get_service_pgcp_flow_table_information => $NO_ARGS,

    ## Method : <get-service-pgcp-flow-table-information-gateway>
    ## Returns: <service-pgcp-flow-table-gateway-information>
    ## Command: "show services pgcp flows gateway"
    get_service_pgcp_flow_table_information_gateway => {
	gateway_name => $STRING,
	gate_id => $STRING,
	service_set => $STRING,
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	source_routing_instance => $STRING,
	destination_routing_instance => $STRING,
	protocol => $STRING,
	get_service_pgcp_flow_count_information => $TOGGLE,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	backup_data_pic => $TOGGLE,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-pgcp-conversation-information>
    ## Returns: <service-pgcp-conversation-information>
    ## Command: "show services pgcp conversations"
    get_service_pgcp_conversation_information => $NO_ARGS,

    ## Method : <get-service-pgcp-conversation-information-gateway>
    ## Returns: <service-pgcp-conversation-gateway-information>
    ## Command: "show services pgcp conversations gateway"
    get_service_pgcp_conversation_information_gateway => {
	gateway_name => $STRING,
	service_set => $STRING,
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	source_routing_instance => $STRING,
	destination_routing_instance => $STRING,
	protocol => $STRING,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	backup_data_pic => $TOGGLE,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-pgcpd-active-configuration>
    ## Returns: <pgcpd-active-configuration>
    ## Command: "show services pgcp active-configuration"
    get_pgcpd_active_configuration => $NO_ARGS,

    ## Method : <get-service-pgcp-active-configuration-gateway>
    ## Returns: <service-pgcp-active-configuration-gateway>
    ## Command: "show services pgcp active-configuration gateway"
    get_service_pgcp_active_configuration_gateway => {
	gateway_name => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-pgcp-statistics>
    ## Returns: <service-pgcp-statistics>
    ## Command: "show services pgcp statistics"
    get_service_pgcp_statistics => $NO_ARGS,

    ## Method : <get-service-pgcp-statistics-gateway>
    ## Returns: <service-pgcp-statistics-gateway>
    ## Command: "show services pgcp statistics gateway"
    get_service_pgcp_statistics_gateway => {
	gateway_name => $STRING,
	brief => $TOGGLE,
	extensive => $TOGGLE,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-pgcp-terminations>
    ## Returns: <service-pgcp-terminations>
    ## Command: "show services pgcp terminations"
    get_service_pgcp_terminations => $NO_ARGS,

    ## Method : <get-service-pgcp-terminations-gateway>
    ## Returns: <service-pgcp-terminations-gateway>
    ## Command: "show services pgcp terminations gateway"
    get_service_pgcp_terminations_gateway => {
	gateway_name => $STRING,
	termination_prefix => $STRING,
	h248 => $TOGGLE,
	brief => $TOGGLE,
	count => $TOGGLE,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-pgcp-gates>
    ## Returns: <service-pgcp-gates>
    ## Command: "show services pgcp gates"
    get_service_pgcp_gates => $NO_ARGS,

    ## Method : <get-service-pgcp-gates-gateway>
    ## Returns: <service-pgcp-gates-gateway>
    ## Command: "show services pgcp gates gateway"
    get_service_pgcp_gates_gateway => {
	gateway_name => $STRING,
	extensive => $TOGGLE,
	brief => $TOGGLE,
	count => $TOGGLE,
	source_routing_instance => $STRING,
	destination_routing_instance => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-pgcp-gate>
    ## Returns: <service-pgcp-gate>
    ## Command: "show services pgcp gate"
    get_service_pgcp_gate => $NO_ARGS,

    ## Method : <get-service-pgcp-gate-gateway>
    ## Returns: <service-pgcp-gate-gateway>
    ## Command: "show services pgcp gate gateway"
    get_service_pgcp_gate_gateway => {
	gateway_name => $STRING,
	gate_id => $STRING,
	extensive => $TOGGLE,
	brief => $TOGGLE,
	statistics => $TOGGLE,
	session_mirroring => $TOGGLE,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-services-pgcpd-root-termination>
    ## Returns: <services-pgcpd-root-termination>
    ## Command: "show services pgcp root-termination"
    get_services_pgcpd_root_termination => $NO_ARGS,

    ## Method : <get-services-pgcpd-root-termination-gateway>
    ## Returns: <services-pgcpd-root-termination-gateway>
    ## Command: "show services pgcp root-termination gateway"
    get_services_pgcpd_root_termination_gateway => {
	gateway_name => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-border-signaling-gateway-statistics-calls>
    ## Returns: <bsg-statistics-calls-details>
    ## Command: "show services border-signaling-gateway calls"
    get_service_border_signaling_gateway_statistics_calls => $NO_ARGS,

    ## Method : <get-service-border-signaling-gateway-statistics-calls-by-sp>
    ## Returns: <bsg-statistics-calls>
    ## Command: "show services border-signaling-gateway calls by-service-point"
    get_service_border_signaling_gateway_statistics_calls_by_sp => {
	service_point_name => $STRING,
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-border-signaling-gateway-statistics-calls-by-server>
    ## Returns: <bsg-statistics-calls>
    ## Command: "show services border-signaling-gateway calls by-server"
    get_service_border_signaling_gateway_statistics_calls_by_server => {
	server_name => $STRING,
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-border-signaling-gateway-statistics-calls-duration-by-sp>
    ## Returns: <bsg-calls-duration-detals>
    ## Command: "show services border-signaling-gateway calls-duration by-service-point"
    get_service_border_signaling_gateway_statistics_calls_duration_by_sp => {
	service_point_name => $STRING,
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-border-signaling-gateway-statistics-calls-duration-by-server>
    ## Returns: <bsg-calls-duration-detals>
    ## Command: "show services border-signaling-gateway calls-duration by-server"
    get_service_border_signaling_gateway_statistics_calls_duration_by_server => {
	server_name => $STRING,
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-border-signaling-gateway-statistics-failed-calls-by-sp>
    ## Returns: <bsg-statistics-calls-failed-details>
    ## Command: "show services border-signaling-gateway calls-failed by-service-point"
    get_service_border_signaling_gateway_statistics_failed_calls_by_sp => {
	service_point_name => $STRING,
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-border-signaling-gateway-statistics-failed-calls-by-server>
    ## Returns: <bsg-statistics-calls-failed-details>
    ## Command: "show services border-signaling-gateway calls-failed by-server"
    get_service_border_signaling_gateway_statistics_failed_calls_by_server => {
	server_name => $STRING,
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-bsg-denied-messages>
    ## Returns: <bsg-statistics-denied-messages-details>
    ## Command: "show services border-signaling-gateway denied-messages"
    get_service_bsg_denied_messages => {
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-border-signaling-gateway-statistics-admission-control>
    ## Returns: <bsg-statistics-admission-control>
    ## Command: "show services border-signaling-gateway admission-control"
    get_service_border_signaling_gateway_statistics_admission_control => {
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-border-signaling-gateway-information-by-request-uri>
    ## Returns: <bsg-information-details>
    ## Command: "show services border-signaling-gateway by-request-uri"
    get_service_border_signaling_gateway_information_by_request_uri => {
	gateway => $STRING,
	uri => $STRING,
	brief => $TOGGLE,
	summary => $TOGGLE,
	detail => $TOGGLE,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-border-signaling-gateway-information-by-contact>
    ## Returns: <bsg-information-details>
    ## Command: "show services border-signaling-gateway by-contact"
    get_service_border_signaling_gateway_information_by_contact => {
	gateway => $STRING,
	contact => $STRING,
	brief => $TOGGLE,
	summary => $TOGGLE,
	detail => $TOGGLE,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-bsg-information-by-call-context-id>
    ## Returns: <bsg-information-details>
    ## Command: "show services border-signaling-gateway by-call-context-id"
    get_service_bsg_information_by_call_context_id => {
	gateway => $STRING,
	context_id => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-bsg-status-information>
    ## Returns: <bsg-status-information>
    ## Command: "show services border-signaling-gateway status"
    get_service_bsg_status_information => {
	gateway => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-border-signaling-gateway-name-resolution-cache-by-fqdn>
    ## Returns: <bsg-name-resolution-cache-information>
    ## Command: "show services border-signaling-gateway name-resolution-cache by-fqdn"
    get_border_signaling_gateway_name_resolution_cache_by_fqdn => {
	fqdn => $STRING,
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-border-signaling-gateway-name-resolution-cache-all>
    ## Returns: <bsg-name-resolution-cache-information>
    ## Command: "show services border-signaling-gateway name-resolution-cache all"
    get_service_border_signaling_gateway_name_resolution_cache_all => {
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-border-signaling-gateway-routing-blacklist>
    ## Returns: <bsg-routing-blacklist>
    ## Command: "show services border-signaling-gateway routing-blacklist"
    get_service_border_signaling_gateway_routing_blacklist => {
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-bsg-registrations>
    ## Returns: <bsg-registrations>
    ## Command: "show services border-signaling-gateway registrations"
    get_service_bsg_registrations => {
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-bsg-registrations-statistics>
    ## Returns: <bsg-registrations>
    ## Command: "show services border-signaling-gateway registrations statistics"
    get_service_bsg_registrations_statistics => {
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-bsg-registrations-realm-statistics>
    ## Returns: <bsg-registrations-realm>
    ## Command: "show services border-signaling-gateway registrations realm"
    get_service_bsg_registrations_realm_statistics => {
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
	realm_name => $STRING,
    },

    ## Method : <get-service-border-signaling-gateway-address-of-record>
    ## Returns: <bsg-address-of-records>
    ## Command: "show services border-signaling-gateway address-of-record"
    get_service_border_signaling_gateway_address_of_record => $NO_ARGS,

    ## Method : <get-service-border-signaling-gateway-address-of-record-bindings>
    ## Returns: <bsg-address-of-record-bindings>
    ## Command: "show services border-signaling-gateway address-of-record bindings"
    get_service_border_signaling_gateway_address_of_record_bindings => {
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
	address_of_record => $STRING,
	detail => $TOGGLE,
    },

    ## Method : <get-service-border-signaling-gateway-charging-status>
    ## Returns: <bsg-charging-status>
    ## Command: "show services border-signaling-gateway accounting status"
    get_service_border_signaling_gateway_charging_status => {
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-border-signaling-gateway-charging-statistics>
    ## Returns: <bsg-charging-statistics>
    ## Command: "show services border-signaling-gateway accounting statistics"
    get_service_border_signaling_gateway_charging_statistics => {
	gateway => $STRING,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <get-service-msp-flow-table-information>
    ## Returns: <service-sfw-flow-table-information>
    ## Command: "show services flows"
    get_service_msp_flow_table_information => {
	all => $TOGGLE,
	limit => $STRING,
	extensive => $TOGGLE,
	brief => $TOGGLE,
	terse => $TOGGLE,
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	service_set => $STRING,
	interface => $STRING,
	application_protocol => $STRING,
	get_service_sfw_flow_count_information => $TOGGLE,
    },

    ## Method : <get-msp-session-table>
    ## Returns: <msp-session-table>
    ## Command: "show services sessions"
    get_msp_session_table => {
	all => $TOGGLE,
	limit => $STRING,
	extensive => $TOGGLE,
	brief => $TOGGLE,
	terse => $TOGGLE,
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	service_set => $STRING,
	interface => $STRING,
	application_protocol => $STRING,
	get_service_msp_sess_count_information => $TOGGLE,
    },

    ## Method : <get-service-msp-alg-conversation-information>
    ## Returns: <service-msp-alg-conversation-information>
    ## Command: "show services alg conversations"
    get_service_msp_alg_conversation_information => {
	interface => $STRING,
	application_protocol => $STRING,
	extensive => $TOGGLE,
	brief => $TOGGLE,
    },

    ## Method : <get-service-msp-alg-stats-information>
    ## Returns: <service-msp-alg-stats-information>
    ## Command: "show services alg statistics"
    get_service_msp_alg_stats_information => {
	interface => $STRING,
	application_protocol => $STRING,
    },

    ## Method : <get-service-msp-alg-sip-globals-information>
    ## Returns: <service-msp-alg-sip-globals-information>
    ## Command: "show services alg sip-globals"
    get_service_msp_alg_sip_globals_information => {
	interface => $STRING,
    },

    ## Method : <get-service-flow-analysis-information>
    ## Returns: <service-flow-analysis-information>
    ## Command: "show services stateful-firewall flow-analysis"
    get_service_flow_analysis_information => {
	interface => $STRING,
    },

    ## Method : <get-service-subs-analysis-information>
    ## Returns: <service-subs-analysis-information>
    ## Command: "show services stateful-firewall subscriber-analysis"
    get_service_subs_analysis_information => {
	interface => $STRING,
    },

    ## Method : <get-service-sfw-flow-table-information>
    ## Returns: <service-sfw-flow-table-information>
    ## Command: "show services stateful-firewall flows"
    get_service_sfw_flow_table_information => {
	all => $TOGGLE,
	limit => $STRING,
	extensive => $TOGGLE,
	brief => $TOGGLE,
	terse => $TOGGLE,
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	application_protocol => $STRING,
	service_set => $STRING,
	interface => $STRING,
	pgcp => $TOGGLE,
	get_service_sfw_flow_count_information => $TOGGLE,
    },

    ## Method : <get-service-sfw-conversation-information>
    ## Returns: <service-sfw-conversation-information>
    ## Command: "show services stateful-firewall conversations"
    get_service_sfw_conversation_information => {
	all => $TOGGLE,
	limit => $STRING,
	extensive => $TOGGLE,
	brief => $TOGGLE,
	terse => $TOGGLE,
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	application_protocol => $STRING,
	service_set => $STRING,
	interface => $STRING,
	pgcp => $TOGGLE,
    },

    ## Method : <get-service-sfw-sip-call-information>
    ## Returns: <service-sfw-sip-call-information>
    ## Command: "show services stateful-firewall sip-call"
    get_service_sfw_sip_call_information => {
	all => $TOGGLE,
	limit => $STRING,
	extensive => $TOGGLE,
	brief => $TOGGLE,
	terse => $TOGGLE,
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	application_protocol => $STRING,
	service_set => $STRING,
	interface => $STRING,
	get_service_sfw_sip_call_count_information => $TOGGLE,
    },

    ## Method : <get-service-sfw-sip-register-information>
    ## Returns: <service-sfw-sip-register-information>
    ## Command: "show services stateful-firewall sip-register"
    get_service_sfw_sip_register_information => {
	all => $TOGGLE,
	limit => $STRING,
	extensive => $TOGGLE,
	brief => $TOGGLE,
	terse => $TOGGLE,
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	protocol => $STRING,
	application_protocol => $STRING,
	service_set => $STRING,
	interface => $STRING,
	get_service_sfw_sip_register_count_information => $TOGGLE,
    },

    ## Method : <get-service-sfw-statistics-information>
    ## Returns: <service-sfw-statistics-information>
    ## Command: "show services stateful-firewall statistics"
    get_service_sfw_statistics_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	summary => $TOGGLE,
	service_set => $STRING,
	interface => $STRING,
    },

    ## Method : <get-sfw-application-protocol-statistics>
    ## Returns: <service-sfw-statistics-information>
    ## Command: "show services stateful-firewall statistics application-protocol"
    get_sfw_application_protocol_statistics => {
	sip => $TOGGLE,
    },

    ## Method : <get-service-sfw-redundancy-statistics>
    ## Returns: <service-sfw-redundancy-statistics>
    ## Command: "show services stateful-firewall redundancy-statistics"
    get_service_sfw_redundancy_statistics => {
	backup_data_pic => $TOGGLE,
	extensive => $TOGGLE,
	brief => $TOGGLE,
    },

    ## Method : <get-service-softwire-table-information>
    ## Returns: <service-softwire-table-information>
    ## Command: "show services softwire"
    get_service_softwire_table_information => {
	get_service_current_softwire_count_information => $TOGGLE,
    },

    ## Method : <get-service-softwire-flow-table-information>
    ## Returns: <service-softwire-flow-table-information>
    ## Command: "show services softwire flows"
    get_service_softwire_flow_table_information => {
	service_set => $STRING,
	interface => $STRING,
	get_service_softwire_count_information => $TOGGLE,
    },

    ## Method : <get-service-softwire-ds-lite-flow-table-information>
    ## Returns: <service-softwire-flow-table-information>
    ## Command: "show services softwire flows ds-lite"
    get_service_softwire_ds_lite_flow_table_information => {
	AFTR => $STRING,
	B4 => $STRING,
    },

    ## Method : <get-service-softwire-v6rd-flow-table-information>
    ## Returns: <service-softwire-flow-table-information>
    ## Command: "show services softwire flows v6rd"
    get_service_softwire_v6rd_flow_table_information => {
	concentrator => $STRING,
	initiator => $STRING,
    },

    ## Method : <get-service-softwire-statistics-information>
    ## Returns: <service-softwire-statistics-information>
    ## Command: "show services softwire statistics"
    get_service_softwire_statistics_information => {
	interface => $STRING,
	ds_lite => $TOGGLE,
	v6rd => $TOGGLE,
    },

    ## Method : <get-inline-service-sw-statistics-information>
    ## Returns: <inline-service-sw-statistics-information>
    ## Command: "show services inline softwire statistics"
    get_inline_service_sw_statistics_information => {
	interface => $STRING,
	v6rd => $TOGGLE,
    },

    ## Method : <get-inline-nat-statistics-information>
    ## Returns: <inline-nat-statistics-information>
    ## Command: "show services inline nat statistics"
    get_inline_nat_statistics_information => {
	interface => $STRING,
    },

    ## Method : <get-inline-nat-pool-information>
    ## Returns: <inline-nat-pool-information>
    ## Command: "show services inline nat pool"
    get_inline_nat_pool_information => {
	pool_name => $STRING,
    },

    ## Method : <get-service-ids-source-table-information>
    ## Returns: <service-ids-flow-table-information>
    ## Command: "show services ids source-table"
    get_service_ids_source_table_information => {
	source_prefix => $STRING,
	service_set => $STRING,
	interface => $STRING,
	order => $STRING,
	threshold => $STRING,
	limit => $STRING,
	extensive => $TOGGLE,
	brief => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-service-ids-destination-table-information>
    ## Returns: <service-ids-flow-table-information>
    ## Command: "show services ids destination-table"
    get_service_ids_destination_table_information => {
	destination_prefix => $STRING,
	service_set => $STRING,
	interface => $STRING,
	order => $STRING,
	threshold => $STRING,
	limit => $STRING,
	extensive => $TOGGLE,
	brief => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-service-ids-pair-table-information>
    ## Returns: <service-ids-flow-table-information>
    ## Command: "show services ids pair-table"
    get_service_ids_pair_table_information => {
	source_prefix => $STRING,
	destination_prefix => $STRING,
	service_set => $STRING,
	interface => $STRING,
	order => $STRING,
	threshold => $STRING,
	limit => $STRING,
	extensive => $TOGGLE,
	brief => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-service-identification-statistics-information>
    ## Returns: <service-identification-statistics-information>
    ## Command: "show services service-identification statistics"
    get_service_identification_statistics_information => {
	detail => $TOGGLE,
    },

    ## Method : <get-header-redirect-set-statistics-information>
    ## Returns: <header-redirect-set-statistics-information>
    ## Command: "show services service-identification header-redirect statistics"
    get_header_redirect_set_statistics_information => {
	detail => $TOGGLE,
    },

    ## Method : <get-uri-redirect-set-statistics-information>
    ## Returns: <uri-redirect-set-statistics-information>
    ## Command: "show services service-identification uri-redirect statistics"
    get_uri_redirect_set_statistics_information => {
	detail => $TOGGLE,
    },

    ## Method : <get-flow-table-statistics-information>
    ## Returns: <flow-table-statistics-information>
    ## Command: "show services flow-table statistics"
    get_flow_table_statistics_information => {
	detail => $TOGGLE,
    },

    ## Method : <get-l2tp-destination-information>
    ## Returns: <service-l2tp-destination-information>
    ## Command: "show services l2tp destination"
    get_l2tp_destination_information => {
	extensive => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	statistics => $TOGGLE,
	local_gateway => $STRING,
	peer_gateway => $STRING,
    },

    ## Method : <get-l2tp-tunnel-information>
    ## Returns: <service-l2tp-tunnel-information>
    ## Command: "show services l2tp tunnel"
    get_l2tp_tunnel_information => {
	extensive => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	statistics => $TOGGLE,
	tunnel_group => $STRING,
	local_tunnel_id => $STRING,
	local_gateway => $STRING,
	local_gateway_name => $STRING,
	peer_gateway => $STRING,
	peer_gateway_name => $STRING,
	interface => $STRING,
    },

    ## Method : <get-l2tp-session-information>
    ## Returns: <service-l2tp-session-information>
    ## Command: "show services l2tp session"
    get_l2tp_session_information => {
	extensive => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	statistics => $TOGGLE,
	tunnel_group => $STRING,
	local_tunnel_id => $STRING,
	local_gateway => $STRING,
	local_gateway_name => $STRING,
	peer_gateway => $STRING,
	peer_gateway_name => $STRING,
	local_session_id => $STRING,
	user => $STRING,
	interface => $STRING,
    },

    ## Method : <get-l2tp-disconnect-cause-summary>
    ## Returns: <service-l2tp-disconnect-cause-summary>
    ## Command: "show services l2tp disconnect-cause-summary"
    get_l2tp_disconnect_cause_summary => $NO_ARGS,

    ## Method : <get-l2tp-user-information>
    ## Returns: <service-l2tp-session-information>
    ## Command: "show services l2tp user"
    get_l2tp_user_information => {
	extensive => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	statistics => $TOGGLE,
	user => $STRING,
    },

    ## Method : <get-l2tp-multilink-information>
    ## Returns: <services-l2tp-multilink-information>
    ## Command: "show services l2tp multilink"
    get_l2tp_multilink_information => {
	extensive => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	statistics => $TOGGLE,
	bundle_id => $STRING,
    },

    ## Method : <get-l2tp-summary-information>
    ## Returns: <service-l2tp-summary-information>
    ## Command: "show services l2tp summary"
    get_l2tp_summary_information => {
	interface => $STRING,
    },

    ## Method : <get-services-l2tp-radius-authentication-accounting-servers-information>
    ## Returns: <services-l2tp-radius-authentication-accounting-servers-information>
    ## Command: "show services l2tp radius servers"
    get_services_l2tp_radius_authentication_accounting_servers_information => $NO_ARGS,

    ## Method : <get-services-l2tp-radius-authentication-accounting-statistics-information>
    ## Returns: <services-l2tp-radius-authentication-accounting-statistics-information>
    ## Command: "show services l2tp radius statistics"
    get_services_l2tp_radius_authentication_accounting_statistics_information => $NO_ARGS,

    ## Method : <get-services-l2tp-radius-authentication-servers-information>
    ## Returns: <services-l2tp-radius-authentication-servers-information>
    ## Command: "show services l2tp radius authentication servers"
    get_services_l2tp_radius_authentication_servers_information => $NO_ARGS,

    ## Method : <get-services-l2tp-radius-authentication-statistics-information>
    ## Returns: <services-l2tp-radius-authentication-statistics-information>
    ## Command: "show services l2tp radius authentication statistics"
    get_services_l2tp_radius_authentication_statistics_information => $NO_ARGS,

    ## Method : <get-services-l2tp-radius-accounting-servers-information>
    ## Returns: <services-l2tp-radius-accounting-servers-information>
    ## Command: "show services l2tp radius accounting servers"
    get_services_l2tp_radius_accounting_servers_information => $NO_ARGS,

    ## Method : <get-services-l2tp-radius-accounting-statistics-information>
    ## Returns: <services-l2tp-radius-accounting-statistics-information>
    ## Command: "show services l2tp radius accounting statistics"
    get_services_l2tp_radius_accounting_statistics_information => $NO_ARGS,

    ## Method : <get-service-crtp-params-information>
    ## Returns: <service-crtp-params-information>
    ## Command: "show services crtp"
    get_service_crtp_params_information => {
	interface => $STRING,
    },

    ## Method : <get-service-crtp-extensive-information>
    ## Returns: <service-crtp-extensive-information>
    ## Command: "show services crtp extensive"
    get_service_crtp_extensive_information => {
	interface => $STRING,
    },

    ## Method : <get-service-crtp-flow-table-information>
    ## Returns: <service-crtp-flow-table-information>
    ## Command: "show services crtp flows"
    get_service_crtp_flow_table_information => {
	interface => $STRING,
    },

    ## Method : <get-link-services-cpu-usage>
    ## Returns: <lsqinfo-cpu-usage-information>
    ## Command: "show services link-services cpu-usage"
    get_link_services_cpu_usage => {
	interface => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-global-pcp-statistics-information>
    ## Returns: <global-pcp-statistics-information>
    ## Command: "show services pcp statistics"
    get_global_pcp_statistics_information => {
	interface => $STRING,
	protocol => $TOGGLE,
    },

    ## Method : <get-firewall-information>
    ## Returns: <firewall-information>
    ## Command: "show firewall"
    get_firewall_information => {
	application => $STRING,
	logical_system => $STRING,
	terse => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-firewall-counter-information>
    ## Returns: <firewall-counter-information>
    ## Command: "show firewall counter"
    get_firewall_counter_information => {
	countername => $STRING,
	filter => $STRING,
	detail => $TOGGLE,
	application => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-firewall-filter-information>
    ## Returns: <firewall-filter-information>
    ## Command: "show firewall filter"
    get_firewall_filter_information => {
	filtername => $STRING,
	counter => $STRING,
	detail => $TOGGLE,
	application => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-filter-version>
    ## Returns: <firewall-information>
    ## Command: "show firewall filter version"
    get_filter_version => {
	filtername => $STRING,
    },

    ## Method : <get-firewall-log-information>
    ## Returns: <firewall-log-information>
    ## Command: "show firewall log"
    get_firewall_log_information => {
	get_firewall_log_detailed_information => $TOGGLE,
	interface => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-firewall-prefix-action-information>
    ## Returns: <firewall-prefix-action-information>
    ## Command: "show firewall prefix-action-stats"
    get_firewall_prefix_action_information => {
	filter => $STRING,
	prefix_action => $STRING,
	from => $STRING,
	to => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-firewall-policer-counter-information>
    ## Returns: <firewall-policer-counter-information>
    ## Command: "show firewall policer counters"
    get_firewall_policer_counter_information => {
	logical_system => $STRING,
	detail => $TOGGLE,
    },

    ## Method : <get-firewall-policer-per-counter-information>
    ## Returns: <firewall-policer-per-counter-information>
    ## Command: "show firewall policer counters counter-id"
    get_firewall_policer_per_counter_information => {
	logical_system => $STRING,
	counter_id => $STRING,
	detail => $TOGGLE,
    },

    ## Method : <get-firewall-templates-reference-counts>
    ## Returns: <firewall-templates-reference-counts-information>
    ## Command: "show firewall templates-in-use"
    get_firewall_templates_reference_counts => $NO_ARGS,

    ## Method : <get-policer-information>
    ## Returns: <firewall-information>
    ## Command: "show policer"
    get_policer_information => {
	policer => $STRING,
	logical_system => $STRING,
	detail => $TOGGLE,
    },

    ## Method : <restart-pgcp-service>
    ## Returns: <restart-pgcp-service-information>
    ## Command: "restart services pgcp"
    restart_pgcp_service => {
	gateway => $STRING,
    },

    ## Method : <restart-border-signaling-gateway-service>
    ## Returns: <restart-bsg-service-information>
    ## Command: "restart services border-signaling-gateway"
    restart_border_signaling_gateway_service => {
	gateway => $STRING,
    },

    ## Method : <get-radius-server-access-test-result>
    ## Returns: <radius-access-server-test-result>
    ## Command: "test access radius-server"
    get_radius_server_access_test_result => {
	address => $STRING,
	authentication_port => $STRING,
	secret => $STRING,
	user => $STRING,
	password => $STRING,
	timeout => $STRING,
	retry => $STRING,
	source_address => $STRING,
    },

    ## Method : <get-radius-profile-access-test-result>
    ## Returns: <radius-profile-access-test-result>
    ## Command: "test access profile"
    get_radius_profile_access_test_result => {
	profile_name => $STRING,
	user => $STRING,
	password => $STRING,
	get_radius_profile_access_test_detail_result => $TOGGLE,
    },

    ## Method : <get-test-services-l2tp-tunnel-result>
    ## Returns: <test-services-l2tp-tunnel-result>
    ## Command: "test services l2tp tunnel"
    get_test_services_l2tp_tunnel_result => {
	user => $STRING,
	password => $STRING,
	tunnel_name => $STRING,
    },

);
1;
