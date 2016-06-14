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
# FILE: jggsn_methods.pl -- generated automagikally; DO NOT EDIT
#

%jggsn_methods = (
    ## Method : <get-ggsn-imsi-trace>
    ## Returns: <call-trace-information>
    ## Command: "show services ggsn trace imsi"
    get_ggsn_imsi_trace => {
	imsi_identifier => $STRING,
    },

    ## Method : <get-ggsn-msisdn-trace>
    ## Returns: <call-trace-information>
    ## Command: "show services ggsn trace msisdn"
    get_ggsn_msisdn_trace => {
	msisdn_identifier => $STRING,
    },

    ## Method : <get-ggsn-trace>
    ## Returns: <call-trace-information>
    ## Command: "show services ggsn trace all"
    get_ggsn_trace => $NO_ARGS,

    ## Method : <get-ggsn-interface-information>
    ## Returns: <ggsn-interface-information>
    ## Command: "show services ggsn status"
    get_ggsn_interface_information => $NO_ARGS,

    ## Method : <get-ggsn-statistics>
    ## Returns: <ggsn-statistics>
    ## Command: "show services ggsn statistics"
    get_ggsn_statistics => $NO_ARGS,

    ## Method : <get-ggsn-gtp-statistics-information>
    ## Returns: <gtp-statistics-information>
    ## Command: "show services ggsn statistics gtp"
    get_ggsn_gtp_statistics_information => $NO_ARGS,

    ## Method : <get-ggsn-charging-statistics-information>
    ## Returns: <ggsn-charging-statistics-information>
    ## Command: "show services ggsn statistics charging"
    get_ggsn_charging_statistics_information => $NO_ARGS,

    ## Method : <get-ggsn-radius-statistics-information>
    ## Returns: <ggsn-radius-statistics-information>
    ## Command: "show services ggsn statistics radius"
    get_ggsn_radius_statistics_information => $NO_ARGS,

    ## Method : <get-ggsn-gtp-prime-statistics-information>
    ## Returns: <gtp-prime-statistics-information>
    ## Command: "show services ggsn statistics gtp-prime"
    get_ggsn_gtp_prime_statistics_information => $NO_ARGS,

    ## Method : <get-ggsn-imsi-user-information>
    ## Returns: <mobile-user-information>
    ## Command: "show services ggsn statistics imsi"
    get_ggsn_imsi_user_information => {
	imsi_identifier => $STRING,
    },

    ## Method : <get-ggsn-apn-statistics-information>
    ## Returns: <apn-statistics-information>
    ## Command: "show services ggsn statistics apn"
    get_ggsn_apn_statistics_information => {
	apn_name => $STRING,
    },

    ## Method : <get-ggsn-sgsn-statistics-information>
    ## Returns: <sgsn-statistics-information>
    ## Command: "show services ggsn statistics sgsn"
    get_ggsn_sgsn_statistics_information => {
	address => $STRING,
    },

    ## Method : <get-ggsn-l2tp-tunnel-statistics-information>
    ## Returns: <l2tp-tunnel-statistics-information>
    ## Command: "show services ggsn statistics l2tp-tunnel"
    get_ggsn_l2tp_tunnel_statistics_information => {
	lac_address => $STRING,
    },

    ## Method : <get-pdp-diagnostics-per-apn>
    ## Returns: <pdp-diagnostics-per-apn>
    ## Command: "show services ggsn diagnostics pdp"
    get_pdp_diagnostics_per_apn => {
	apn => $STRING,
    },

    ## Method : <request-ggsn-restart-node>
    ## Returns: <node-action-results>
    ## Command: "request services ggsn restart node"
    request_ggsn_restart_node => $NO_ARGS,

    ## Method : <request-ggsn-restart-interface>
    ## Returns: <interface-action-results>
    ## Command: "request services ggsn restart interface"
    request_ggsn_restart_interface => {
	interface_name => $STRING,
    },

    ## Method : <request-ggsn-stop-node>
    ## Returns: nothing
    ## Command: "request services ggsn stop node"
    request_ggsn_stop_node => $NO_ARGS,

    ## Method : <request-ggsn-stop-interface>
    ## Returns: <interface-action-results>
    ## Command: "request services ggsn stop interface"
    request_ggsn_stop_interface => {
	interface_name => $STRING,
    },

    ## Method : <request-ggsn-terminate-context>
    ## Returns: <pdp-context-deletion-results>
    ## Command: "request services ggsn pdp terminate context"
    request_ggsn_terminate_context => {
	imsi => $STRING,
	nsapi => $STRING,
    },

    ## Method : <request-ggsn-terminate-msisdn-context>
    ## Returns: nothing
    ## Command: "request services ggsn pdp terminate context msisdn"
    request_ggsn_terminate_msisdn_context => {
	msisdn => $STRING,
    },

    ## Method : <request-ggsn-terminate-contexts-apn>
    ## Returns: <apn-pdp-context-deletion-results>
    ## Command: "request services ggsn pdp terminate apn"
    request_ggsn_terminate_contexts_apn => {
	apn_name => $STRING,
	user_category => $STRING,
    },

    ## Method : <request-ggsn-start-imsi-trace>
    ## Returns: nothing
    ## Command: "request services ggsn trace start imsi"
    request_ggsn_start_imsi_trace => {
	imsi_identifier => $STRING,
    },

    ## Method : <request-ggsn-start-msisdn-trace>
    ## Returns: nothing
    ## Command: "request services ggsn trace start msisdn"
    request_ggsn_start_msisdn_trace => {
	msisdn_identifier => $STRING,
    },

    ## Method : <request-ggsn-software-update>
    ## Returns: <software-action-results>
    ## Command: "request services ggsn trace software update"
    request_ggsn_software_update => $NO_ARGS,

    ## Method : <request-ggsn-stop-imsi-trace>
    ## Returns: nothing
    ## Command: "request services ggsn trace stop imsi"
    request_ggsn_stop_imsi_trace => {
	imsi_identifier => $STRING,
    },

    ## Method : <request-ggsn-stop-msisdn-trace>
    ## Returns: nothing
    ## Command: "request services ggsn trace stop msisdn"
    request_ggsn_stop_msisdn_trace => {
	msisdn_identifier => $STRING,
    },

    ## Method : <request-ggsn-stop-trace-activity>
    ## Returns: nothing
    ## Command: "request services ggsn trace stop all"
    request_ggsn_stop_trace_activity => $NO_ARGS,

);
1;
