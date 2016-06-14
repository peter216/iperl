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
# FILE: mo_methods.pl -- generated automagikally; DO NOT EDIT
#

%mo_methods = (
    ## Method : <get-passive-monitoring-information>
    ## Returns: <passive-monitoring-information>
    ## Command: "show passive-monitoring"
    get_passive_monitoring_information => $NO_ARGS,

    ## Method : <get-passive-monitoring-usage-information>
    ## Returns: <passive-monitoring-usage-information>
    ## Command: "show passive-monitoring usage"
    get_passive_monitoring_usage_information => {
	interface_name => $STRING,
    },

    ## Method : <get-passive-monitoring-memory-information>
    ## Returns: <passive-monitoring-memory-information>
    ## Command: "show passive-monitoring memory"
    get_passive_monitoring_memory_information => {
	interface_name => $STRING,
    },

    ## Method : <get-passive-monitoring-flow-information>
    ## Returns: <passive-monitoring-flow-information>
    ## Command: "show passive-monitoring flow"
    get_passive_monitoring_flow_information => {
	interface_name => $STRING,
    },

    ## Method : <get-passive-monitoring-error-information>
    ## Returns: <passive-monitoring-error-information>
    ## Command: "show passive-monitoring error"
    get_passive_monitoring_error_information => {
	interface_name => $STRING,
    },

    ## Method : <get-passive-monitoring-status-information>
    ## Returns: <passive-monitoring-status-information>
    ## Command: "show passive-monitoring status"
    get_passive_monitoring_status_information => {
	interface_name => $STRING,
    },

    ## Method : <get-service-accounting-information>
    ## Returns: <service-accounting-information>
    ## Command: "show services accounting"
    get_service_accounting_information => $NO_ARGS,

    ## Method : <get-service-accounting-status-information>
    ## Returns: <service-accounting-status-information>
    ## Command: "show services accounting status"
    get_service_accounting_status_information => {
	status_information => $STRING,
    },

    ## Method : <get-service-accounting-status-inline-jflow-information>
    ## Returns: <service-accouting-inline-jflow-information>
    ## Command: "show services accounting status inline-jflow"
    get_service_accounting_status_inline_jflow_information => {
	inline_jflow_information => $STRING,
    },

    ## Method : <get-service-accounting-usage-information>
    ## Returns: <service-accounting-usage-information>
    ## Command: "show services accounting usage"
    get_service_accounting_usage_information => {
	usage_information => $STRING,
    },

    ## Method : <get-service-accounting-memory-information>
    ## Returns: <service-accounting-memory-information>
    ## Command: "show services accounting memory"
    get_service_accounting_memory_information => {
	memory_information => $STRING,
    },

    ## Method : <get-service-accounting-flow-information>
    ## Returns: <service-accounting-flow-information>
    ## Command: "show services accounting flow"
    get_service_accounting_flow_information => {
	flow_information => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-service-accounting-status-inline-jflow-flow-information>
    ## Returns: <service-accouting-inline-jflow-flow-infomation>
    ## Command: "show services accounting flow inline-jflow"
    get_service_accounting_status_inline_jflow_flow_information => {
	inline_jflow_flow_information => $STRING,
    },

    ## Method : <get-service-accounting-flow-detail>
    ## Returns: <service-accounting-flow-detail>
    ## Command: "show services accounting flow-detail"
    get_service_accounting_flow_detail => {
	flow_detail_information => $STRING,
	limit => $STRING,
	order => $STRING,
	extensive => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
	source_prefix => $STRING,
	destination_prefix => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
	input_snmp_interface_index => $STRING,
	output_snmp_interface_index => $STRING,
	source_as => $STRING,
	destination_as => $STRING,
	tos => $STRING,
	proto => $STRING,
    },

    ## Method : <get-service-accounting-aggregation-information>
    ## Returns: <service-accounting-aggregation-information>
    ## Command: "show services accounting aggregation"
    get_service_accounting_aggregation_information => $NO_ARGS,

    ## Method : <get-service-accounting-aggregation-as-information>
    ## Returns: <service-accounting-aggregation-as-information>
    ## Command: "show services accounting aggregation as"
    get_service_accounting_aggregation_as_information => {
	as_information => $STRING,
	limit => $STRING,
	order => $STRING,
	extensive => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
	source_as => $STRING,
	destination_as => $STRING,
	input_snmp_interface_index => $STRING,
	output_snmp_interface_index => $STRING,
    },

    ## Method : <get-service-accounting-aggregation-protocol-port-information>
    ## Returns: <service-accounting-aggregation-protocol-port-information>
    ## Command: "show services accounting aggregation protocol-port"
    get_service_accounting_aggregation_protocol_port_information => {
	protocol_port_information => $STRING,
	limit => $STRING,
	order => $STRING,
	extensive => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
	proto => $STRING,
	source_port => $STRING,
	destination_port => $STRING,
    },

    ## Method : <get-service-accounting-aggregation-source-prefix-information>
    ## Returns: <service-accounting-aggregation-source-prefix-information>
    ## Command: "show services accounting aggregation source-prefix"
    get_service_accounting_aggregation_source_prefix_information => {
	source_prefix_information => $STRING,
	limit => $STRING,
	order => $STRING,
	extensive => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
	source_prefix => $STRING,
	source_as => $STRING,
	input_snmp_interface_index => $STRING,
    },

    ## Method : <get-service-accounting-aggregation-destination-prefix-information>
    ## Returns: <service-accounting-aggregation-destination-prefix-information>
    ## Command: "show services accounting aggregation destination-prefix"
    get_service_accounting_aggregation_destination_prefix_information => {
	destination_prefix_information => $STRING,
	limit => $STRING,
	order => $STRING,
	extensive => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
	destination_prefix => $STRING,
	destination_as => $STRING,
	output_snmp_interface_index => $STRING,
    },

    ## Method : <get-service-accounting-aggregation-source-destination-prefix-information>
    ## Returns: <service-accounting-aggregation-source-destination-prefix-information>
    ## Command: "show services accounting aggregation source-destination-prefix"
    get_service_accounting_aggregation_source_destination_prefix_information => {
	source_destination_prefix_information => $STRING,
	limit => $STRING,
	order => $STRING,
	extensive => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
	source_prefix => $STRING,
	source_as => $STRING,
	input_snmp_interface_index => $STRING,
	destination_prefix => $STRING,
	destination_as => $STRING,
	output_snmp_interface_index => $STRING,
    },

    ## Method : <get-service-accounting-aggregation-template-information>
    ## Returns: <service-accounting-aggregation-template-information>
    ## Command: "show services accounting aggregation template"
    get_service_accounting_aggregation_template_information => {
	template_name => $STRING,
	logical_system => $STRING,
	extensive => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-service-accounting-errors-information>
    ## Returns: <service-accounting-errors-information>
    ## Command: "show services accounting errors"
    get_service_accounting_errors_information => {
	error_information => $STRING,
    },

    ## Method : <get-service-accounting-error-inline-jflow-information>
    ## Returns: <service-accouting-inline-jflow-error-infomation>
    ## Command: "show services accounting errors inline-jflow"
    get_service_accounting_error_inline_jflow_information => {
	inline_jflow_error_information => $STRING,
    },

    ## Method : <get-packet-distribution-information>
    ## Returns: <packet-distribution-information>
    ## Command: "show services accounting packet-size-distribution"
    get_packet_distribution_information => {
	packet_size_distribution_information => $STRING,
    },

    ## Method : <clear-passive-monitoring>
    ## Returns: nothing
    ## Command: "clear passive-monitoring"
    clear_passive_monitoring => $NO_ARGS,

    ## Method : <clear-passive-monitoring-statistics>
    ## Returns: <none>
    ## Command: "clear passive-monitoring statistics"
    clear_passive_monitoring_statistics => {
	interface_name => $STRING,
    },

);
1;
