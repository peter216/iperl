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
# FILE: jkernel_methods.pl -- generated automagikally; DO NOT EDIT
#

%jkernel_methods = (
    ## Method : <get-ddos-protocols-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols"
    get_ddos_protocols_information => $NO_ARGS,

    ## Method : <get-ddos-protocols-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols parameters"
    get_ddos_protocols_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-protocols-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols statistics"
    get_ddos_protocols_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-protocols-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols violations"
    get_ddos_protocols_violations => $NO_ARGS,

    ## Method : <get-ddos-flow-detection-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols flow-detection"
    get_ddos_flow_detection_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-protocols-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols culprit-flows"
    get_ddos_protocols_flows => $NO_ARGS,

    ## Method : <get-ddos-dynvlan-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dynamic-vlan"
    get_ddos_dynvlan_information => $NO_ARGS,

    ## Method : <get-ddos-dynvlan-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dynamic-vlan parameters"
    get_ddos_dynvlan_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-dynvlan-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dynamic-vlan statistics"
    get_ddos_dynvlan_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-dynvlan-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dynamic-vlan violations"
    get_ddos_dynvlan_violations => $NO_ARGS,

    ## Method : <get-ddos-dynvlan-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dynamic-vlan flow-detection"
    get_ddos_dynvlan_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-dynvlan-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dynamic-vlan culprit-flows"
    get_ddos_dynvlan_flows => $NO_ARGS,

    ## Method : <get-ddos-dynvlan-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dynamic-vlan aggregate"
    get_ddos_dynvlan_aggregate => $NO_ARGS,

    ## Method : <get-ddos-dynvlan-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dynamic-vlan aggregate culprit-flows"
    get_ddos_dynvlan_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ppp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp"
    get_ddos_ppp_information => $NO_ARGS,

    ## Method : <get-ddos-ppp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp parameters"
    get_ddos_ppp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ppp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp statistics"
    get_ddos_ppp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ppp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp violations"
    get_ddos_ppp_violations => $NO_ARGS,

    ## Method : <get-ddos-ppp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp flow-detection"
    get_ddos_ppp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ppp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp culprit-flows"
    get_ddos_ppp_flows => $NO_ARGS,

    ## Method : <get-ddos-ppp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp aggregate"
    get_ddos_ppp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ppp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp aggregate culprit-flows"
    get_ddos_ppp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ppp-unclass>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp unclassified"
    get_ddos_ppp_unclass => $NO_ARGS,

    ## Method : <get-ddos-ppp-unclass-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp unclassified culprit-flows"
    get_ddos_ppp_unclass_flows => $NO_ARGS,

    ## Method : <get-ddos-ppp-lcp>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp lcp"
    get_ddos_ppp_lcp => $NO_ARGS,

    ## Method : <get-ddos-ppp-lcp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp lcp culprit-flows"
    get_ddos_ppp_lcp_flows => $NO_ARGS,

    ## Method : <get-ddos-ppp-auth>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp authentication"
    get_ddos_ppp_auth => $NO_ARGS,

    ## Method : <get-ddos-ppp-auth-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp authentication culprit-flows"
    get_ddos_ppp_auth_flows => $NO_ARGS,

    ## Method : <get-ddos-ppp-ipcp>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp ipcp"
    get_ddos_ppp_ipcp => $NO_ARGS,

    ## Method : <get-ddos-ppp-ipcp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp ipcp culprit-flows"
    get_ddos_ppp_ipcp_flows => $NO_ARGS,

    ## Method : <get-ddos-ppp-ipv6cp>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp ipv6cp"
    get_ddos_ppp_ipv6cp => $NO_ARGS,

    ## Method : <get-ddos-ppp-ipv6cp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp ipv6cp culprit-flows"
    get_ddos_ppp_ipv6cp_flows => $NO_ARGS,

    ## Method : <get-ddos-ppp-mplscp>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp mplscp"
    get_ddos_ppp_mplscp => $NO_ARGS,

    ## Method : <get-ddos-ppp-mplscp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp mplscp culprit-flows"
    get_ddos_ppp_mplscp_flows => $NO_ARGS,

    ## Method : <get-ddos-ppp-isis>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp isis"
    get_ddos_ppp_isis => $NO_ARGS,

    ## Method : <get-ddos-ppp-isis-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp isis culprit-flows"
    get_ddos_ppp_isis_flows => $NO_ARGS,

    ## Method : <get-ddos-ppp-echo-req>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp echo-req"
    get_ddos_ppp_echo_req => $NO_ARGS,

    ## Method : <get-ddos-ppp-echo-req-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp echo-req culprit-flows"
    get_ddos_ppp_echo_req_flows => $NO_ARGS,

    ## Method : <get-ddos-ppp-echo-rep>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp echo-rep"
    get_ddos_ppp_echo_rep => $NO_ARGS,

    ## Method : <get-ddos-ppp-echo-rep-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp echo-rep culprit-flows"
    get_ddos_ppp_echo_rep_flows => $NO_ARGS,

    ## Method : <get-ddos-ppp-mlppp-lcp>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp mlppp-lcp"
    get_ddos_ppp_mlppp_lcp => $NO_ARGS,

    ## Method : <get-ddos-ppp-mlppp-lcp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ppp mlppp-lcp culprit-flows"
    get_ddos_ppp_mlppp_lcp_flows => $NO_ARGS,

    ## Method : <get-ddos-pppoe-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe"
    get_ddos_pppoe_information => $NO_ARGS,

    ## Method : <get-ddos-pppoe-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe parameters"
    get_ddos_pppoe_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pppoe-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe statistics"
    get_ddos_pppoe_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pppoe-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe violations"
    get_ddos_pppoe_violations => $NO_ARGS,

    ## Method : <get-ddos-pppoe-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe flow-detection"
    get_ddos_pppoe_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pppoe-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe culprit-flows"
    get_ddos_pppoe_flows => $NO_ARGS,

    ## Method : <get-ddos-pppoe-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe aggregate"
    get_ddos_pppoe_aggregate => $NO_ARGS,

    ## Method : <get-ddos-pppoe-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe aggregate culprit-flows"
    get_ddos_pppoe_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-pppoe-padi>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe padi"
    get_ddos_pppoe_padi => $NO_ARGS,

    ## Method : <get-ddos-pppoe-padi-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe padi culprit-flows"
    get_ddos_pppoe_padi_flows => $NO_ARGS,

    ## Method : <get-ddos-pppoe-pado>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe pado"
    get_ddos_pppoe_pado => $NO_ARGS,

    ## Method : <get-ddos-pppoe-pado-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe pado culprit-flows"
    get_ddos_pppoe_pado_flows => $NO_ARGS,

    ## Method : <get-ddos-pppoe-padr>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe padr"
    get_ddos_pppoe_padr => $NO_ARGS,

    ## Method : <get-ddos-pppoe-padr-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe padr culprit-flows"
    get_ddos_pppoe_padr_flows => $NO_ARGS,

    ## Method : <get-ddos-pppoe-pads>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe pads"
    get_ddos_pppoe_pads => $NO_ARGS,

    ## Method : <get-ddos-pppoe-pads-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe pads culprit-flows"
    get_ddos_pppoe_pads_flows => $NO_ARGS,

    ## Method : <get-ddos-pppoe-padt>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe padt"
    get_ddos_pppoe_padt => $NO_ARGS,

    ## Method : <get-ddos-pppoe-padt-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe padt culprit-flows"
    get_ddos_pppoe_padt_flows => $NO_ARGS,

    ## Method : <get-ddos-pppoe-padm>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe padm"
    get_ddos_pppoe_padm => $NO_ARGS,

    ## Method : <get-ddos-pppoe-padm-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe padm culprit-flows"
    get_ddos_pppoe_padm_flows => $NO_ARGS,

    ## Method : <get-ddos-pppoe-padn>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe padn"
    get_ddos_pppoe_padn => $NO_ARGS,

    ## Method : <get-ddos-pppoe-padn-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pppoe padn culprit-flows"
    get_ddos_pppoe_padn_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4"
    get_ddos_dhcpv4_information => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 parameters"
    get_ddos_dhcpv4_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-dhcpv4-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 statistics"
    get_ddos_dhcpv4_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-dhcpv4-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 violations"
    get_ddos_dhcpv4_violations => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 flow-detection"
    get_ddos_dhcpv4_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-dhcpv4-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 culprit-flows"
    get_ddos_dhcpv4_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 aggregate"
    get_ddos_dhcpv4_aggregate => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 aggregate culprit-flows"
    get_ddos_dhcpv4_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-unclass>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 unclassified"
    get_ddos_dhcpv4_unclass => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-unclass-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 unclassified culprit-flows"
    get_ddos_dhcpv4_unclass_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-discover>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 discover"
    get_ddos_dhcpv4_discover => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-discover-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 discover culprit-flows"
    get_ddos_dhcpv4_discover_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-offer>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 offer"
    get_ddos_dhcpv4_offer => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-offer-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 offer culprit-flows"
    get_ddos_dhcpv4_offer_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-request>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 request"
    get_ddos_dhcpv4_request => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-request-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 request culprit-flows"
    get_ddos_dhcpv4_request_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-decline>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 decline"
    get_ddos_dhcpv4_decline => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-decline-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 decline culprit-flows"
    get_ddos_dhcpv4_decline_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-ack>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 ack"
    get_ddos_dhcpv4_ack => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-ack-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 ack culprit-flows"
    get_ddos_dhcpv4_ack_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-nak>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 nak"
    get_ddos_dhcpv4_nak => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-nak-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 nak culprit-flows"
    get_ddos_dhcpv4_nak_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-release>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 release"
    get_ddos_dhcpv4_release => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-release-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 release culprit-flows"
    get_ddos_dhcpv4_release_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-inform>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 inform"
    get_ddos_dhcpv4_inform => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-inform-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 inform culprit-flows"
    get_ddos_dhcpv4_inform_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-renew>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 renew"
    get_ddos_dhcpv4_renew => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-renew-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 renew culprit-flows"
    get_ddos_dhcpv4_renew_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-forcerenew>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 force-renew"
    get_ddos_dhcpv4_forcerenew => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-forcerenew-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 force-renew culprit-flows"
    get_ddos_dhcpv4_forcerenew_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-leasequery>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 lease-query"
    get_ddos_dhcpv4_leasequery => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-leasequery-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 lease-query culprit-flows"
    get_ddos_dhcpv4_leasequery_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-leaseuna>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 lease-unassigned"
    get_ddos_dhcpv4_leaseuna => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-leaseuna-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 lease-unassigned culprit-flows"
    get_ddos_dhcpv4_leaseuna_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-leaseunk>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 lease-unknown"
    get_ddos_dhcpv4_leaseunk => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-leaseunk-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 lease-unknown culprit-flows"
    get_ddos_dhcpv4_leaseunk_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-leaseact>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 lease-active"
    get_ddos_dhcpv4_leaseact => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-leaseact-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 lease-active culprit-flows"
    get_ddos_dhcpv4_leaseact_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-bootp>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 bootp"
    get_ddos_dhcpv4_bootp => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-bootp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 bootp culprit-flows"
    get_ddos_dhcpv4_bootp_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-no-msgtype>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 no-message-type"
    get_ddos_dhcpv4_no_msgtype => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-no-msgtype-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 no-message-type culprit-flows"
    get_ddos_dhcpv4_no_msgtype_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-bad-pack>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 bad-packets"
    get_ddos_dhcpv4_bad_pack => $NO_ARGS,

    ## Method : <get-ddos-dhcpv4-bad-pack-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv4 bad-packets culprit-flows"
    get_ddos_dhcpv4_bad_pack_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6"
    get_ddos_dhcpv6_information => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 parameters"
    get_ddos_dhcpv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-dhcpv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 statistics"
    get_ddos_dhcpv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-dhcpv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 violations"
    get_ddos_dhcpv6_violations => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 flow-detection"
    get_ddos_dhcpv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-dhcpv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 culprit-flows"
    get_ddos_dhcpv6_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 aggregate"
    get_ddos_dhcpv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 aggregate culprit-flows"
    get_ddos_dhcpv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-unclass>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 unclassified"
    get_ddos_dhcpv6_unclass => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-unclass-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 unclassified culprit-flows"
    get_ddos_dhcpv6_unclass_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-solicit>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 solicit"
    get_ddos_dhcpv6_solicit => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-solicit-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 solicit culprit-flows"
    get_ddos_dhcpv6_solicit_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-advertise>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 advertise"
    get_ddos_dhcpv6_advertise => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-advertise-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 advertise culprit-flows"
    get_ddos_dhcpv6_advertise_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-request>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 request"
    get_ddos_dhcpv6_request => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-request-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 request culprit-flows"
    get_ddos_dhcpv6_request_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-confirm>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 confirm"
    get_ddos_dhcpv6_confirm => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-confirm-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 confirm culprit-flows"
    get_ddos_dhcpv6_confirm_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-renew>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 renew"
    get_ddos_dhcpv6_renew => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-renew-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 renew culprit-flows"
    get_ddos_dhcpv6_renew_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-rebind>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 rebind"
    get_ddos_dhcpv6_rebind => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-rebind-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 rebind culprit-flows"
    get_ddos_dhcpv6_rebind_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-reply>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 reply"
    get_ddos_dhcpv6_reply => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-reply-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 reply culprit-flows"
    get_ddos_dhcpv6_reply_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-release>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 release"
    get_ddos_dhcpv6_release => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-release-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 release culprit-flows"
    get_ddos_dhcpv6_release_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-decline>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 decline"
    get_ddos_dhcpv6_decline => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-decline-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 decline culprit-flows"
    get_ddos_dhcpv6_decline_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-reconfig>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 reconfigure"
    get_ddos_dhcpv6_reconfig => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-reconfig-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 reconfigure culprit-flows"
    get_ddos_dhcpv6_reconfig_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-info-req>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 information-request"
    get_ddos_dhcpv6_info_req => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-info-req-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 information-request culprit-flows"
    get_ddos_dhcpv6_info_req_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-relay-for>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 relay-forward"
    get_ddos_dhcpv6_relay_for => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-relay-for-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 relay-forward culprit-flows"
    get_ddos_dhcpv6_relay_for_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-relay-rep>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 relay-reply"
    get_ddos_dhcpv6_relay_rep => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-relay-rep-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 relay-reply culprit-flows"
    get_ddos_dhcpv6_relay_rep_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-leasequery>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 leasequery"
    get_ddos_dhcpv6_leasequery => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-leasequery-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 leasequery culprit-flows"
    get_ddos_dhcpv6_leasequery_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-leaseq-re>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 leasequery-reply"
    get_ddos_dhcpv6_leaseq_re => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-leaseq-re-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 leasequery-reply culprit-flows"
    get_ddos_dhcpv6_leaseq_re_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-leaseq-do>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 leasequery-done"
    get_ddos_dhcpv6_leaseq_do => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-leaseq-do-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 leasequery-done culprit-flows"
    get_ddos_dhcpv6_leaseq_do_flows => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-leaseq-da>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 leasequery-data"
    get_ddos_dhcpv6_leaseq_da => $NO_ARGS,

    ## Method : <get-ddos-dhcpv6-leaseq-da-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dhcpv6 leasequery-data culprit-flows"
    get_ddos_dhcpv6_leaseq_da_flows => $NO_ARGS,

    ## Method : <get-ddos-vchassis-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis"
    get_ddos_vchassis_information => $NO_ARGS,

    ## Method : <get-ddos-vchassis-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis parameters"
    get_ddos_vchassis_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-vchassis-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis statistics"
    get_ddos_vchassis_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-vchassis-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis violations"
    get_ddos_vchassis_violations => $NO_ARGS,

    ## Method : <get-ddos-vchassis-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis flow-detection"
    get_ddos_vchassis_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-vchassis-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis culprit-flows"
    get_ddos_vchassis_flows => $NO_ARGS,

    ## Method : <get-ddos-vchassis-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis aggregate"
    get_ddos_vchassis_aggregate => $NO_ARGS,

    ## Method : <get-ddos-vchassis-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis aggregate culprit-flows"
    get_ddos_vchassis_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-vchassis-unclass>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis unclassified"
    get_ddos_vchassis_unclass => $NO_ARGS,

    ## Method : <get-ddos-vchassis-unclass-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis unclassified culprit-flows"
    get_ddos_vchassis_unclass_flows => $NO_ARGS,

    ## Method : <get-ddos-vchassis-control-hi>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis control-high"
    get_ddos_vchassis_control_hi => $NO_ARGS,

    ## Method : <get-ddos-vchassis-control-hi-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis control-high culprit-flows"
    get_ddos_vchassis_control_hi_flows => $NO_ARGS,

    ## Method : <get-ddos-vchassis-control-lo>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis control-low"
    get_ddos_vchassis_control_lo => $NO_ARGS,

    ## Method : <get-ddos-vchassis-control-lo-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis control-low culprit-flows"
    get_ddos_vchassis_control_lo_flows => $NO_ARGS,

    ## Method : <get-ddos-vchassis-vc-packets>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis vc-packets"
    get_ddos_vchassis_vc_packets => $NO_ARGS,

    ## Method : <get-ddos-vchassis-vc-packets-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis vc-packets culprit-flows"
    get_ddos_vchassis_vc_packets_flows => $NO_ARGS,

    ## Method : <get-ddos-vchassis-vc-ttl-err>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis vc-ttl-errors"
    get_ddos_vchassis_vc_ttl_err => $NO_ARGS,

    ## Method : <get-ddos-vchassis-vc-ttl-err-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols virtual-chassis vc-ttl-errors culprit-flows"
    get_ddos_vchassis_vc_ttl_err_flows => $NO_ARGS,

    ## Method : <get-ddos-icmp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols icmp"
    get_ddos_icmp_information => $NO_ARGS,

    ## Method : <get-ddos-icmp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols icmp parameters"
    get_ddos_icmp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-icmp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols icmp statistics"
    get_ddos_icmp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-icmp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols icmp violations"
    get_ddos_icmp_violations => $NO_ARGS,

    ## Method : <get-ddos-icmp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols icmp flow-detection"
    get_ddos_icmp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-icmp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols icmp culprit-flows"
    get_ddos_icmp_flows => $NO_ARGS,

    ## Method : <get-ddos-icmp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols icmp aggregate"
    get_ddos_icmp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-icmp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols icmp aggregate culprit-flows"
    get_ddos_icmp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-igmp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmp"
    get_ddos_igmp_information => $NO_ARGS,

    ## Method : <get-ddos-igmp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmp parameters"
    get_ddos_igmp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-igmp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmp statistics"
    get_ddos_igmp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-igmp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmp violations"
    get_ddos_igmp_violations => $NO_ARGS,

    ## Method : <get-ddos-igmp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmp flow-detection"
    get_ddos_igmp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-igmp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmp culprit-flows"
    get_ddos_igmp_flows => $NO_ARGS,

    ## Method : <get-ddos-igmp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmp aggregate"
    get_ddos_igmp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-igmp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmp aggregate culprit-flows"
    get_ddos_igmp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ospf-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ospf"
    get_ddos_ospf_information => $NO_ARGS,

    ## Method : <get-ddos-ospf-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ospf parameters"
    get_ddos_ospf_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ospf-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ospf statistics"
    get_ddos_ospf_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ospf-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ospf violations"
    get_ddos_ospf_violations => $NO_ARGS,

    ## Method : <get-ddos-ospf-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ospf flow-detection"
    get_ddos_ospf_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ospf-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ospf culprit-flows"
    get_ddos_ospf_flows => $NO_ARGS,

    ## Method : <get-ddos-ospf-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ospf aggregate"
    get_ddos_ospf_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ospf-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ospf aggregate culprit-flows"
    get_ddos_ospf_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-rsvp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rsvp"
    get_ddos_rsvp_information => $NO_ARGS,

    ## Method : <get-ddos-rsvp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rsvp parameters"
    get_ddos_rsvp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-rsvp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rsvp statistics"
    get_ddos_rsvp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-rsvp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rsvp violations"
    get_ddos_rsvp_violations => $NO_ARGS,

    ## Method : <get-ddos-rsvp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rsvp flow-detection"
    get_ddos_rsvp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-rsvp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rsvp culprit-flows"
    get_ddos_rsvp_flows => $NO_ARGS,

    ## Method : <get-ddos-rsvp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rsvp aggregate"
    get_ddos_rsvp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-rsvp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rsvp aggregate culprit-flows"
    get_ddos_rsvp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-pim-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pim"
    get_ddos_pim_information => $NO_ARGS,

    ## Method : <get-ddos-pim-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pim parameters"
    get_ddos_pim_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pim-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pim statistics"
    get_ddos_pim_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pim-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pim violations"
    get_ddos_pim_violations => $NO_ARGS,

    ## Method : <get-ddos-pim-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pim flow-detection"
    get_ddos_pim_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pim-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pim culprit-flows"
    get_ddos_pim_flows => $NO_ARGS,

    ## Method : <get-ddos-pim-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pim aggregate"
    get_ddos_pim_aggregate => $NO_ARGS,

    ## Method : <get-ddos-pim-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pim aggregate culprit-flows"
    get_ddos_pim_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-rip-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rip"
    get_ddos_rip_information => $NO_ARGS,

    ## Method : <get-ddos-rip-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rip parameters"
    get_ddos_rip_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-rip-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rip statistics"
    get_ddos_rip_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-rip-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rip violations"
    get_ddos_rip_violations => $NO_ARGS,

    ## Method : <get-ddos-rip-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rip flow-detection"
    get_ddos_rip_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-rip-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rip culprit-flows"
    get_ddos_rip_flows => $NO_ARGS,

    ## Method : <get-ddos-rip-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rip aggregate"
    get_ddos_rip_aggregate => $NO_ARGS,

    ## Method : <get-ddos-rip-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rip aggregate culprit-flows"
    get_ddos_rip_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ptp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ptp"
    get_ddos_ptp_information => $NO_ARGS,

    ## Method : <get-ddos-ptp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ptp parameters"
    get_ddos_ptp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ptp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ptp statistics"
    get_ddos_ptp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ptp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ptp violations"
    get_ddos_ptp_violations => $NO_ARGS,

    ## Method : <get-ddos-ptp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ptp flow-detection"
    get_ddos_ptp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ptp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ptp culprit-flows"
    get_ddos_ptp_flows => $NO_ARGS,

    ## Method : <get-ddos-ptp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ptp aggregate"
    get_ddos_ptp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ptp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ptp aggregate culprit-flows"
    get_ddos_ptp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-bfd-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bfd"
    get_ddos_bfd_information => $NO_ARGS,

    ## Method : <get-ddos-bfd-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bfd parameters"
    get_ddos_bfd_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-bfd-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bfd statistics"
    get_ddos_bfd_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-bfd-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bfd violations"
    get_ddos_bfd_violations => $NO_ARGS,

    ## Method : <get-ddos-bfd-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bfd flow-detection"
    get_ddos_bfd_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-bfd-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bfd culprit-flows"
    get_ddos_bfd_flows => $NO_ARGS,

    ## Method : <get-ddos-bfd-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bfd aggregate"
    get_ddos_bfd_aggregate => $NO_ARGS,

    ## Method : <get-ddos-bfd-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bfd aggregate culprit-flows"
    get_ddos_bfd_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-lmp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lmp"
    get_ddos_lmp_information => $NO_ARGS,

    ## Method : <get-ddos-lmp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lmp parameters"
    get_ddos_lmp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-lmp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lmp statistics"
    get_ddos_lmp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-lmp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lmp violations"
    get_ddos_lmp_violations => $NO_ARGS,

    ## Method : <get-ddos-lmp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lmp flow-detection"
    get_ddos_lmp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-lmp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lmp culprit-flows"
    get_ddos_lmp_flows => $NO_ARGS,

    ## Method : <get-ddos-lmp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lmp aggregate"
    get_ddos_lmp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-lmp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lmp aggregate culprit-flows"
    get_ddos_lmp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ldp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ldp"
    get_ddos_ldp_information => $NO_ARGS,

    ## Method : <get-ddos-ldp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ldp parameters"
    get_ddos_ldp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ldp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ldp statistics"
    get_ddos_ldp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ldp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ldp violations"
    get_ddos_ldp_violations => $NO_ARGS,

    ## Method : <get-ddos-ldp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ldp flow-detection"
    get_ddos_ldp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ldp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ldp culprit-flows"
    get_ddos_ldp_flows => $NO_ARGS,

    ## Method : <get-ddos-ldp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ldp aggregate"
    get_ddos_ldp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ldp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ldp aggregate culprit-flows"
    get_ddos_ldp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-msdp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols msdp"
    get_ddos_msdp_information => $NO_ARGS,

    ## Method : <get-ddos-msdp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols msdp parameters"
    get_ddos_msdp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-msdp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols msdp statistics"
    get_ddos_msdp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-msdp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols msdp violations"
    get_ddos_msdp_violations => $NO_ARGS,

    ## Method : <get-ddos-msdp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols msdp flow-detection"
    get_ddos_msdp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-msdp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols msdp culprit-flows"
    get_ddos_msdp_flows => $NO_ARGS,

    ## Method : <get-ddos-msdp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols msdp aggregate"
    get_ddos_msdp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-msdp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols msdp aggregate culprit-flows"
    get_ddos_msdp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-bgp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bgp"
    get_ddos_bgp_information => $NO_ARGS,

    ## Method : <get-ddos-bgp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bgp parameters"
    get_ddos_bgp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-bgp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bgp statistics"
    get_ddos_bgp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-bgp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bgp violations"
    get_ddos_bgp_violations => $NO_ARGS,

    ## Method : <get-ddos-bgp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bgp flow-detection"
    get_ddos_bgp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-bgp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bgp culprit-flows"
    get_ddos_bgp_flows => $NO_ARGS,

    ## Method : <get-ddos-bgp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bgp aggregate"
    get_ddos_bgp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-bgp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bgp aggregate culprit-flows"
    get_ddos_bgp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-vrrp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols vrrp"
    get_ddos_vrrp_information => $NO_ARGS,

    ## Method : <get-ddos-vrrp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols vrrp parameters"
    get_ddos_vrrp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-vrrp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols vrrp statistics"
    get_ddos_vrrp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-vrrp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols vrrp violations"
    get_ddos_vrrp_violations => $NO_ARGS,

    ## Method : <get-ddos-vrrp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols vrrp flow-detection"
    get_ddos_vrrp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-vrrp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols vrrp culprit-flows"
    get_ddos_vrrp_flows => $NO_ARGS,

    ## Method : <get-ddos-vrrp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols vrrp aggregate"
    get_ddos_vrrp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-vrrp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols vrrp aggregate culprit-flows"
    get_ddos_vrrp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-telnet-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols telnet"
    get_ddos_telnet_information => $NO_ARGS,

    ## Method : <get-ddos-telnet-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols telnet parameters"
    get_ddos_telnet_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-telnet-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols telnet statistics"
    get_ddos_telnet_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-telnet-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols telnet violations"
    get_ddos_telnet_violations => $NO_ARGS,

    ## Method : <get-ddos-telnet-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols telnet flow-detection"
    get_ddos_telnet_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-telnet-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols telnet culprit-flows"
    get_ddos_telnet_flows => $NO_ARGS,

    ## Method : <get-ddos-telnet-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols telnet aggregate"
    get_ddos_telnet_aggregate => $NO_ARGS,

    ## Method : <get-ddos-telnet-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols telnet aggregate culprit-flows"
    get_ddos_telnet_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ftp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ftp"
    get_ddos_ftp_information => $NO_ARGS,

    ## Method : <get-ddos-ftp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ftp parameters"
    get_ddos_ftp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ftp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ftp statistics"
    get_ddos_ftp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ftp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ftp violations"
    get_ddos_ftp_violations => $NO_ARGS,

    ## Method : <get-ddos-ftp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ftp flow-detection"
    get_ddos_ftp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ftp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ftp culprit-flows"
    get_ddos_ftp_flows => $NO_ARGS,

    ## Method : <get-ddos-ftp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ftp aggregate"
    get_ddos_ftp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ftp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ftp aggregate culprit-flows"
    get_ddos_ftp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ssh-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ssh"
    get_ddos_ssh_information => $NO_ARGS,

    ## Method : <get-ddos-ssh-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ssh parameters"
    get_ddos_ssh_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ssh-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ssh statistics"
    get_ddos_ssh_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ssh-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ssh violations"
    get_ddos_ssh_violations => $NO_ARGS,

    ## Method : <get-ddos-ssh-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ssh flow-detection"
    get_ddos_ssh_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ssh-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ssh culprit-flows"
    get_ddos_ssh_flows => $NO_ARGS,

    ## Method : <get-ddos-ssh-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ssh aggregate"
    get_ddos_ssh_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ssh-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ssh aggregate culprit-flows"
    get_ddos_ssh_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-snmp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols snmp"
    get_ddos_snmp_information => $NO_ARGS,

    ## Method : <get-ddos-snmp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols snmp parameters"
    get_ddos_snmp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-snmp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols snmp statistics"
    get_ddos_snmp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-snmp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols snmp violations"
    get_ddos_snmp_violations => $NO_ARGS,

    ## Method : <get-ddos-snmp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols snmp flow-detection"
    get_ddos_snmp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-snmp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols snmp culprit-flows"
    get_ddos_snmp_flows => $NO_ARGS,

    ## Method : <get-ddos-snmp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols snmp aggregate"
    get_ddos_snmp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-snmp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols snmp aggregate culprit-flows"
    get_ddos_snmp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ancp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ancp"
    get_ddos_ancp_information => $NO_ARGS,

    ## Method : <get-ddos-ancp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ancp parameters"
    get_ddos_ancp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ancp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ancp statistics"
    get_ddos_ancp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ancp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ancp violations"
    get_ddos_ancp_violations => $NO_ARGS,

    ## Method : <get-ddos-ancp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ancp flow-detection"
    get_ddos_ancp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ancp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ancp culprit-flows"
    get_ddos_ancp_flows => $NO_ARGS,

    ## Method : <get-ddos-ancp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ancp aggregate"
    get_ddos_ancp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ancp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ancp aggregate culprit-flows"
    get_ddos_ancp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-igmpv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmpv6"
    get_ddos_igmpv6_information => $NO_ARGS,

    ## Method : <get-ddos-igmpv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmpv6 parameters"
    get_ddos_igmpv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-igmpv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmpv6 statistics"
    get_ddos_igmpv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-igmpv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmpv6 violations"
    get_ddos_igmpv6_violations => $NO_ARGS,

    ## Method : <get-ddos-igmpv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmpv6 flow-detection"
    get_ddos_igmpv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-igmpv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmpv6 culprit-flows"
    get_ddos_igmpv6_flows => $NO_ARGS,

    ## Method : <get-ddos-igmpv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmpv6 aggregate"
    get_ddos_igmpv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-igmpv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmpv6 aggregate culprit-flows"
    get_ddos_igmpv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-egpv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols egpv6"
    get_ddos_egpv6_information => $NO_ARGS,

    ## Method : <get-ddos-egpv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols egpv6 parameters"
    get_ddos_egpv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-egpv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols egpv6 statistics"
    get_ddos_egpv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-egpv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols egpv6 violations"
    get_ddos_egpv6_violations => $NO_ARGS,

    ## Method : <get-ddos-egpv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols egpv6 flow-detection"
    get_ddos_egpv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-egpv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols egpv6 culprit-flows"
    get_ddos_egpv6_flows => $NO_ARGS,

    ## Method : <get-ddos-egpv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols egpv6 aggregate"
    get_ddos_egpv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-egpv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols egpv6 aggregate culprit-flows"
    get_ddos_egpv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-rsvpv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rsvpv6"
    get_ddos_rsvpv6_information => $NO_ARGS,

    ## Method : <get-ddos-rsvpv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rsvpv6 parameters"
    get_ddos_rsvpv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-rsvpv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rsvpv6 statistics"
    get_ddos_rsvpv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-rsvpv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rsvpv6 violations"
    get_ddos_rsvpv6_violations => $NO_ARGS,

    ## Method : <get-ddos-rsvpv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rsvpv6 flow-detection"
    get_ddos_rsvpv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-rsvpv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rsvpv6 culprit-flows"
    get_ddos_rsvpv6_flows => $NO_ARGS,

    ## Method : <get-ddos-rsvpv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rsvpv6 aggregate"
    get_ddos_rsvpv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-rsvpv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rsvpv6 aggregate culprit-flows"
    get_ddos_rsvpv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-igmpv4v6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmpv4v6"
    get_ddos_igmpv4v6_information => $NO_ARGS,

    ## Method : <get-ddos-igmpv4v6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmpv4v6 parameters"
    get_ddos_igmpv4v6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-igmpv4v6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmpv4v6 statistics"
    get_ddos_igmpv4v6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-igmpv4v6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmpv4v6 violations"
    get_ddos_igmpv4v6_violations => $NO_ARGS,

    ## Method : <get-ddos-igmpv4v6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmpv4v6 flow-detection"
    get_ddos_igmpv4v6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-igmpv4v6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmpv4v6 culprit-flows"
    get_ddos_igmpv4v6_flows => $NO_ARGS,

    ## Method : <get-ddos-igmpv4v6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmpv4v6 aggregate"
    get_ddos_igmpv4v6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-igmpv4v6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmpv4v6 aggregate culprit-flows"
    get_ddos_igmpv4v6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ripv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ripv6"
    get_ddos_ripv6_information => $NO_ARGS,

    ## Method : <get-ddos-ripv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ripv6 parameters"
    get_ddos_ripv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ripv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ripv6 statistics"
    get_ddos_ripv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ripv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ripv6 violations"
    get_ddos_ripv6_violations => $NO_ARGS,

    ## Method : <get-ddos-ripv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ripv6 flow-detection"
    get_ddos_ripv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ripv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ripv6 culprit-flows"
    get_ddos_ripv6_flows => $NO_ARGS,

    ## Method : <get-ddos-ripv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ripv6 aggregate"
    get_ddos_ripv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ripv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ripv6 aggregate culprit-flows"
    get_ddos_ripv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-bfdv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bfdv6"
    get_ddos_bfdv6_information => $NO_ARGS,

    ## Method : <get-ddos-bfdv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bfdv6 parameters"
    get_ddos_bfdv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-bfdv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bfdv6 statistics"
    get_ddos_bfdv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-bfdv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bfdv6 violations"
    get_ddos_bfdv6_violations => $NO_ARGS,

    ## Method : <get-ddos-bfdv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bfdv6 flow-detection"
    get_ddos_bfdv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-bfdv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bfdv6 culprit-flows"
    get_ddos_bfdv6_flows => $NO_ARGS,

    ## Method : <get-ddos-bfdv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bfdv6 aggregate"
    get_ddos_bfdv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-bfdv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bfdv6 aggregate culprit-flows"
    get_ddos_bfdv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-lmpv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lmpv6"
    get_ddos_lmpv6_information => $NO_ARGS,

    ## Method : <get-ddos-lmpv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lmpv6 parameters"
    get_ddos_lmpv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-lmpv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lmpv6 statistics"
    get_ddos_lmpv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-lmpv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lmpv6 violations"
    get_ddos_lmpv6_violations => $NO_ARGS,

    ## Method : <get-ddos-lmpv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lmpv6 flow-detection"
    get_ddos_lmpv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-lmpv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lmpv6 culprit-flows"
    get_ddos_lmpv6_flows => $NO_ARGS,

    ## Method : <get-ddos-lmpv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lmpv6 aggregate"
    get_ddos_lmpv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-lmpv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lmpv6 aggregate culprit-flows"
    get_ddos_lmpv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ldpv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ldpv6"
    get_ddos_ldpv6_information => $NO_ARGS,

    ## Method : <get-ddos-ldpv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ldpv6 parameters"
    get_ddos_ldpv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ldpv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ldpv6 statistics"
    get_ddos_ldpv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ldpv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ldpv6 violations"
    get_ddos_ldpv6_violations => $NO_ARGS,

    ## Method : <get-ddos-ldpv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ldpv6 flow-detection"
    get_ddos_ldpv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ldpv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ldpv6 culprit-flows"
    get_ddos_ldpv6_flows => $NO_ARGS,

    ## Method : <get-ddos-ldpv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ldpv6 aggregate"
    get_ddos_ldpv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ldpv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ldpv6 aggregate culprit-flows"
    get_ddos_ldpv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-msdpv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols msdpv6"
    get_ddos_msdpv6_information => $NO_ARGS,

    ## Method : <get-ddos-msdpv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols msdpv6 parameters"
    get_ddos_msdpv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-msdpv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols msdpv6 statistics"
    get_ddos_msdpv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-msdpv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols msdpv6 violations"
    get_ddos_msdpv6_violations => $NO_ARGS,

    ## Method : <get-ddos-msdpv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols msdpv6 flow-detection"
    get_ddos_msdpv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-msdpv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols msdpv6 culprit-flows"
    get_ddos_msdpv6_flows => $NO_ARGS,

    ## Method : <get-ddos-msdpv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols msdpv6 aggregate"
    get_ddos_msdpv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-msdpv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols msdpv6 aggregate culprit-flows"
    get_ddos_msdpv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-bgpv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bgpv6"
    get_ddos_bgpv6_information => $NO_ARGS,

    ## Method : <get-ddos-bgpv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bgpv6 parameters"
    get_ddos_bgpv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-bgpv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bgpv6 statistics"
    get_ddos_bgpv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-bgpv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bgpv6 violations"
    get_ddos_bgpv6_violations => $NO_ARGS,

    ## Method : <get-ddos-bgpv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bgpv6 flow-detection"
    get_ddos_bgpv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-bgpv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bgpv6 culprit-flows"
    get_ddos_bgpv6_flows => $NO_ARGS,

    ## Method : <get-ddos-bgpv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bgpv6 aggregate"
    get_ddos_bgpv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-bgpv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols bgpv6 aggregate culprit-flows"
    get_ddos_bgpv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-vrrpv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols vrrpv6"
    get_ddos_vrrpv6_information => $NO_ARGS,

    ## Method : <get-ddos-vrrpv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols vrrpv6 parameters"
    get_ddos_vrrpv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-vrrpv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols vrrpv6 statistics"
    get_ddos_vrrpv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-vrrpv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols vrrpv6 violations"
    get_ddos_vrrpv6_violations => $NO_ARGS,

    ## Method : <get-ddos-vrrpv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols vrrpv6 flow-detection"
    get_ddos_vrrpv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-vrrpv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols vrrpv6 culprit-flows"
    get_ddos_vrrpv6_flows => $NO_ARGS,

    ## Method : <get-ddos-vrrpv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols vrrpv6 aggregate"
    get_ddos_vrrpv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-vrrpv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols vrrpv6 aggregate culprit-flows"
    get_ddos_vrrpv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-telnetv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols telnetv6"
    get_ddos_telnetv6_information => $NO_ARGS,

    ## Method : <get-ddos-telnetv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols telnetv6 parameters"
    get_ddos_telnetv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-telnetv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols telnetv6 statistics"
    get_ddos_telnetv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-telnetv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols telnetv6 violations"
    get_ddos_telnetv6_violations => $NO_ARGS,

    ## Method : <get-ddos-telnetv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols telnetv6 flow-detection"
    get_ddos_telnetv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-telnetv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols telnetv6 culprit-flows"
    get_ddos_telnetv6_flows => $NO_ARGS,

    ## Method : <get-ddos-telnetv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols telnetv6 aggregate"
    get_ddos_telnetv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-telnetv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols telnetv6 aggregate culprit-flows"
    get_ddos_telnetv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ftpv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ftpv6"
    get_ddos_ftpv6_information => $NO_ARGS,

    ## Method : <get-ddos-ftpv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ftpv6 parameters"
    get_ddos_ftpv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ftpv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ftpv6 statistics"
    get_ddos_ftpv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ftpv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ftpv6 violations"
    get_ddos_ftpv6_violations => $NO_ARGS,

    ## Method : <get-ddos-ftpv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ftpv6 flow-detection"
    get_ddos_ftpv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ftpv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ftpv6 culprit-flows"
    get_ddos_ftpv6_flows => $NO_ARGS,

    ## Method : <get-ddos-ftpv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ftpv6 aggregate"
    get_ddos_ftpv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ftpv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ftpv6 aggregate culprit-flows"
    get_ddos_ftpv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-sshv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sshv6"
    get_ddos_sshv6_information => $NO_ARGS,

    ## Method : <get-ddos-sshv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sshv6 parameters"
    get_ddos_sshv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-sshv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sshv6 statistics"
    get_ddos_sshv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-sshv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sshv6 violations"
    get_ddos_sshv6_violations => $NO_ARGS,

    ## Method : <get-ddos-sshv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sshv6 flow-detection"
    get_ddos_sshv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-sshv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sshv6 culprit-flows"
    get_ddos_sshv6_flows => $NO_ARGS,

    ## Method : <get-ddos-sshv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sshv6 aggregate"
    get_ddos_sshv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-sshv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sshv6 aggregate culprit-flows"
    get_ddos_sshv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-snmpv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols snmpv6"
    get_ddos_snmpv6_information => $NO_ARGS,

    ## Method : <get-ddos-snmpv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols snmpv6 parameters"
    get_ddos_snmpv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-snmpv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols snmpv6 statistics"
    get_ddos_snmpv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-snmpv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols snmpv6 violations"
    get_ddos_snmpv6_violations => $NO_ARGS,

    ## Method : <get-ddos-snmpv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols snmpv6 flow-detection"
    get_ddos_snmpv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-snmpv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols snmpv6 culprit-flows"
    get_ddos_snmpv6_flows => $NO_ARGS,

    ## Method : <get-ddos-snmpv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols snmpv6 aggregate"
    get_ddos_snmpv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-snmpv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols snmpv6 aggregate culprit-flows"
    get_ddos_snmpv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ancpv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ancpv6"
    get_ddos_ancpv6_information => $NO_ARGS,

    ## Method : <get-ddos-ancpv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ancpv6 parameters"
    get_ddos_ancpv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ancpv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ancpv6 statistics"
    get_ddos_ancpv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ancpv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ancpv6 violations"
    get_ddos_ancpv6_violations => $NO_ARGS,

    ## Method : <get-ddos-ancpv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ancpv6 flow-detection"
    get_ddos_ancpv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ancpv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ancpv6 culprit-flows"
    get_ddos_ancpv6_flows => $NO_ARGS,

    ## Method : <get-ddos-ancpv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ancpv6 aggregate"
    get_ddos_ancpv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ancpv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ancpv6 aggregate culprit-flows"
    get_ddos_ancpv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ospfv3v6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ospfv3v6"
    get_ddos_ospfv3v6_information => $NO_ARGS,

    ## Method : <get-ddos-ospfv3v6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ospfv3v6 parameters"
    get_ddos_ospfv3v6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ospfv3v6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ospfv3v6 statistics"
    get_ddos_ospfv3v6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ospfv3v6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ospfv3v6 violations"
    get_ddos_ospfv3v6_violations => $NO_ARGS,

    ## Method : <get-ddos-ospfv3v6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ospfv3v6 flow-detection"
    get_ddos_ospfv3v6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ospfv3v6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ospfv3v6 culprit-flows"
    get_ddos_ospfv3v6_flows => $NO_ARGS,

    ## Method : <get-ddos-ospfv3v6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ospfv3v6 aggregate"
    get_ddos_ospfv3v6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ospfv3v6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ospfv3v6 aggregate culprit-flows"
    get_ddos_ospfv3v6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-lacp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lacp"
    get_ddos_lacp_information => $NO_ARGS,

    ## Method : <get-ddos-lacp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lacp parameters"
    get_ddos_lacp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-lacp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lacp statistics"
    get_ddos_lacp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-lacp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lacp violations"
    get_ddos_lacp_violations => $NO_ARGS,

    ## Method : <get-ddos-lacp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lacp flow-detection"
    get_ddos_lacp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-lacp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lacp culprit-flows"
    get_ddos_lacp_flows => $NO_ARGS,

    ## Method : <get-ddos-lacp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lacp aggregate"
    get_ddos_lacp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-lacp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lacp aggregate culprit-flows"
    get_ddos_lacp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-stp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols stp"
    get_ddos_stp_information => $NO_ARGS,

    ## Method : <get-ddos-stp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols stp parameters"
    get_ddos_stp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-stp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols stp statistics"
    get_ddos_stp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-stp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols stp violations"
    get_ddos_stp_violations => $NO_ARGS,

    ## Method : <get-ddos-stp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols stp flow-detection"
    get_ddos_stp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-stp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols stp culprit-flows"
    get_ddos_stp_flows => $NO_ARGS,

    ## Method : <get-ddos-stp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols stp aggregate"
    get_ddos_stp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-stp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols stp aggregate culprit-flows"
    get_ddos_stp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-esmc-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols esmc"
    get_ddos_esmc_information => $NO_ARGS,

    ## Method : <get-ddos-esmc-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols esmc parameters"
    get_ddos_esmc_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-esmc-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols esmc statistics"
    get_ddos_esmc_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-esmc-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols esmc violations"
    get_ddos_esmc_violations => $NO_ARGS,

    ## Method : <get-ddos-esmc-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols esmc flow-detection"
    get_ddos_esmc_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-esmc-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols esmc culprit-flows"
    get_ddos_esmc_flows => $NO_ARGS,

    ## Method : <get-ddos-esmc-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols esmc aggregate"
    get_ddos_esmc_aggregate => $NO_ARGS,

    ## Method : <get-ddos-esmc-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols esmc aggregate culprit-flows"
    get_ddos_esmc_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-oam-lfm-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols oam-lfm"
    get_ddos_oam_lfm_information => $NO_ARGS,

    ## Method : <get-ddos-oam-lfm-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols oam-lfm parameters"
    get_ddos_oam_lfm_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-oam-lfm-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols oam-lfm statistics"
    get_ddos_oam_lfm_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-oam-lfm-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols oam-lfm violations"
    get_ddos_oam_lfm_violations => $NO_ARGS,

    ## Method : <get-ddos-oam-lfm-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols oam-lfm flow-detection"
    get_ddos_oam_lfm_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-oam-lfm-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols oam-lfm culprit-flows"
    get_ddos_oam_lfm_flows => $NO_ARGS,

    ## Method : <get-ddos-oam-lfm-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols oam-lfm aggregate"
    get_ddos_oam_lfm_aggregate => $NO_ARGS,

    ## Method : <get-ddos-oam-lfm-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols oam-lfm aggregate culprit-flows"
    get_ddos_oam_lfm_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-eoam-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols eoam"
    get_ddos_eoam_information => $NO_ARGS,

    ## Method : <get-ddos-eoam-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols eoam parameters"
    get_ddos_eoam_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-eoam-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols eoam statistics"
    get_ddos_eoam_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-eoam-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols eoam violations"
    get_ddos_eoam_violations => $NO_ARGS,

    ## Method : <get-ddos-eoam-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols eoam flow-detection"
    get_ddos_eoam_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-eoam-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols eoam culprit-flows"
    get_ddos_eoam_flows => $NO_ARGS,

    ## Method : <get-ddos-eoam-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols eoam aggregate"
    get_ddos_eoam_aggregate => $NO_ARGS,

    ## Method : <get-ddos-eoam-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols eoam aggregate culprit-flows"
    get_ddos_eoam_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-lldp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lldp"
    get_ddos_lldp_information => $NO_ARGS,

    ## Method : <get-ddos-lldp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lldp parameters"
    get_ddos_lldp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-lldp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lldp statistics"
    get_ddos_lldp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-lldp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lldp violations"
    get_ddos_lldp_violations => $NO_ARGS,

    ## Method : <get-ddos-lldp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lldp flow-detection"
    get_ddos_lldp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-lldp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lldp culprit-flows"
    get_ddos_lldp_flows => $NO_ARGS,

    ## Method : <get-ddos-lldp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lldp aggregate"
    get_ddos_lldp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-lldp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols lldp aggregate culprit-flows"
    get_ddos_lldp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-mvrp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mvrp"
    get_ddos_mvrp_information => $NO_ARGS,

    ## Method : <get-ddos-mvrp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mvrp parameters"
    get_ddos_mvrp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-mvrp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mvrp statistics"
    get_ddos_mvrp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-mvrp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mvrp violations"
    get_ddos_mvrp_violations => $NO_ARGS,

    ## Method : <get-ddos-mvrp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mvrp flow-detection"
    get_ddos_mvrp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-mvrp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mvrp culprit-flows"
    get_ddos_mvrp_flows => $NO_ARGS,

    ## Method : <get-ddos-mvrp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mvrp aggregate"
    get_ddos_mvrp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-mvrp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mvrp aggregate culprit-flows"
    get_ddos_mvrp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-pmvrp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pmvrp"
    get_ddos_pmvrp_information => $NO_ARGS,

    ## Method : <get-ddos-pmvrp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pmvrp parameters"
    get_ddos_pmvrp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pmvrp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pmvrp statistics"
    get_ddos_pmvrp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pmvrp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pmvrp violations"
    get_ddos_pmvrp_violations => $NO_ARGS,

    ## Method : <get-ddos-pmvrp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pmvrp flow-detection"
    get_ddos_pmvrp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pmvrp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pmvrp culprit-flows"
    get_ddos_pmvrp_flows => $NO_ARGS,

    ## Method : <get-ddos-pmvrp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pmvrp aggregate"
    get_ddos_pmvrp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-pmvrp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pmvrp aggregate culprit-flows"
    get_ddos_pmvrp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-arp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols arp"
    get_ddos_arp_information => $NO_ARGS,

    ## Method : <get-ddos-arp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols arp parameters"
    get_ddos_arp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-arp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols arp statistics"
    get_ddos_arp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-arp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols arp violations"
    get_ddos_arp_violations => $NO_ARGS,

    ## Method : <get-ddos-arp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols arp flow-detection"
    get_ddos_arp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-arp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols arp culprit-flows"
    get_ddos_arp_flows => $NO_ARGS,

    ## Method : <get-ddos-arp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols arp aggregate"
    get_ddos_arp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-arp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols arp aggregate culprit-flows"
    get_ddos_arp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-pvstp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pvstp"
    get_ddos_pvstp_information => $NO_ARGS,

    ## Method : <get-ddos-pvstp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pvstp parameters"
    get_ddos_pvstp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pvstp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pvstp statistics"
    get_ddos_pvstp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pvstp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pvstp violations"
    get_ddos_pvstp_violations => $NO_ARGS,

    ## Method : <get-ddos-pvstp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pvstp flow-detection"
    get_ddos_pvstp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pvstp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pvstp culprit-flows"
    get_ddos_pvstp_flows => $NO_ARGS,

    ## Method : <get-ddos-pvstp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pvstp aggregate"
    get_ddos_pvstp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-pvstp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pvstp aggregate culprit-flows"
    get_ddos_pvstp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-isis-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols isis"
    get_ddos_isis_information => $NO_ARGS,

    ## Method : <get-ddos-isis-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols isis parameters"
    get_ddos_isis_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-isis-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols isis statistics"
    get_ddos_isis_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-isis-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols isis violations"
    get_ddos_isis_violations => $NO_ARGS,

    ## Method : <get-ddos-isis-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols isis flow-detection"
    get_ddos_isis_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-isis-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols isis culprit-flows"
    get_ddos_isis_flows => $NO_ARGS,

    ## Method : <get-ddos-isis-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols isis aggregate"
    get_ddos_isis_aggregate => $NO_ARGS,

    ## Method : <get-ddos-isis-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols isis aggregate culprit-flows"
    get_ddos_isis_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-pos-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pos"
    get_ddos_pos_information => $NO_ARGS,

    ## Method : <get-ddos-pos-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pos parameters"
    get_ddos_pos_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pos-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pos statistics"
    get_ddos_pos_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pos-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pos violations"
    get_ddos_pos_violations => $NO_ARGS,

    ## Method : <get-ddos-pos-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pos flow-detection"
    get_ddos_pos_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pos-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pos culprit-flows"
    get_ddos_pos_flows => $NO_ARGS,

    ## Method : <get-ddos-pos-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pos aggregate"
    get_ddos_pos_aggregate => $NO_ARGS,

    ## Method : <get-ddos-pos-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pos aggregate culprit-flows"
    get_ddos_pos_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-mlp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mlp"
    get_ddos_mlp_information => $NO_ARGS,

    ## Method : <get-ddos-mlp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mlp parameters"
    get_ddos_mlp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-mlp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mlp statistics"
    get_ddos_mlp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-mlp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mlp violations"
    get_ddos_mlp_violations => $NO_ARGS,

    ## Method : <get-ddos-mlp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mlp flow-detection"
    get_ddos_mlp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-mlp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mlp culprit-flows"
    get_ddos_mlp_flows => $NO_ARGS,

    ## Method : <get-ddos-mlp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mlp aggregate"
    get_ddos_mlp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-mlp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mlp aggregate culprit-flows"
    get_ddos_mlp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-mlp-unclass>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mlp unclassified"
    get_ddos_mlp_unclass => $NO_ARGS,

    ## Method : <get-ddos-mlp-unclass-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mlp unclassified culprit-flows"
    get_ddos_mlp_unclass_flows => $NO_ARGS,

    ## Method : <get-ddos-mlp-packets>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mlp packets"
    get_ddos_mlp_packets => $NO_ARGS,

    ## Method : <get-ddos-mlp-packets-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mlp packets culprit-flows"
    get_ddos_mlp_packets_flows => $NO_ARGS,

    ## Method : <get-ddos-mlp-aging-exc>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mlp aging-exception"
    get_ddos_mlp_aging_exc => $NO_ARGS,

    ## Method : <get-ddos-mlp-aging-exc-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mlp aging-exception culprit-flows"
    get_ddos_mlp_aging_exc_flows => $NO_ARGS,

    ## Method : <get-ddos-jfm-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols jfm"
    get_ddos_jfm_information => $NO_ARGS,

    ## Method : <get-ddos-jfm-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols jfm parameters"
    get_ddos_jfm_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-jfm-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols jfm statistics"
    get_ddos_jfm_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-jfm-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols jfm violations"
    get_ddos_jfm_violations => $NO_ARGS,

    ## Method : <get-ddos-jfm-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols jfm flow-detection"
    get_ddos_jfm_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-jfm-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols jfm culprit-flows"
    get_ddos_jfm_flows => $NO_ARGS,

    ## Method : <get-ddos-jfm-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols jfm aggregate"
    get_ddos_jfm_aggregate => $NO_ARGS,

    ## Method : <get-ddos-jfm-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols jfm aggregate culprit-flows"
    get_ddos_jfm_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-atm-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols atm"
    get_ddos_atm_information => $NO_ARGS,

    ## Method : <get-ddos-atm-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols atm parameters"
    get_ddos_atm_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-atm-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols atm statistics"
    get_ddos_atm_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-atm-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols atm violations"
    get_ddos_atm_violations => $NO_ARGS,

    ## Method : <get-ddos-atm-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols atm flow-detection"
    get_ddos_atm_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-atm-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols atm culprit-flows"
    get_ddos_atm_flows => $NO_ARGS,

    ## Method : <get-ddos-atm-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols atm aggregate"
    get_ddos_atm_aggregate => $NO_ARGS,

    ## Method : <get-ddos-atm-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols atm aggregate culprit-flows"
    get_ddos_atm_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-pfe-alive-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pfe-alive"
    get_ddos_pfe_alive_information => $NO_ARGS,

    ## Method : <get-ddos-pfe-alive-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pfe-alive parameters"
    get_ddos_pfe_alive_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pfe-alive-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pfe-alive statistics"
    get_ddos_pfe_alive_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pfe-alive-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pfe-alive violations"
    get_ddos_pfe_alive_violations => $NO_ARGS,

    ## Method : <get-ddos-pfe-alive-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pfe-alive flow-detection"
    get_ddos_pfe_alive_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pfe-alive-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pfe-alive culprit-flows"
    get_ddos_pfe_alive_flows => $NO_ARGS,

    ## Method : <get-ddos-pfe-alive-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pfe-alive aggregate"
    get_ddos_pfe_alive_aggregate => $NO_ARGS,

    ## Method : <get-ddos-pfe-alive-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pfe-alive aggregate culprit-flows"
    get_ddos_pfe_alive_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ttl-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ttl"
    get_ddos_ttl_information => $NO_ARGS,

    ## Method : <get-ddos-ttl-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ttl parameters"
    get_ddos_ttl_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ttl-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ttl statistics"
    get_ddos_ttl_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ttl-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ttl violations"
    get_ddos_ttl_violations => $NO_ARGS,

    ## Method : <get-ddos-ttl-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ttl flow-detection"
    get_ddos_ttl_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ttl-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ttl culprit-flows"
    get_ddos_ttl_flows => $NO_ARGS,

    ## Method : <get-ddos-ttl-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ttl aggregate"
    get_ddos_ttl_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ttl-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ttl aggregate culprit-flows"
    get_ddos_ttl_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ip-opt-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-options"
    get_ddos_ip_opt_information => $NO_ARGS,

    ## Method : <get-ddos-ip-opt-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-options parameters"
    get_ddos_ip_opt_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ip-opt-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-options statistics"
    get_ddos_ip_opt_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ip-opt-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-options violations"
    get_ddos_ip_opt_violations => $NO_ARGS,

    ## Method : <get-ddos-ip-opt-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-options flow-detection"
    get_ddos_ip_opt_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ip-opt-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-options culprit-flows"
    get_ddos_ip_opt_flows => $NO_ARGS,

    ## Method : <get-ddos-ip-opt-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-options aggregate"
    get_ddos_ip_opt_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ip-opt-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-options aggregate culprit-flows"
    get_ddos_ip_opt_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ip-opt-unclass>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-options unclassified"
    get_ddos_ip_opt_unclass => $NO_ARGS,

    ## Method : <get-ddos-ip-opt-unclass-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-options unclassified culprit-flows"
    get_ddos_ip_opt_unclass_flows => $NO_ARGS,

    ## Method : <get-ddos-ip-opt-rt-alert>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-options router-alert"
    get_ddos_ip_opt_rt_alert => $NO_ARGS,

    ## Method : <get-ddos-ip-opt-rt-alert-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-options router-alert culprit-flows"
    get_ddos_ip_opt_rt_alert_flows => $NO_ARGS,

    ## Method : <get-ddos-ip-opt-non-v4v6>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-options non-v4v6"
    get_ddos_ip_opt_non_v4v6 => $NO_ARGS,

    ## Method : <get-ddos-ip-opt-non-v4v6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-options non-v4v6 culprit-flows"
    get_ddos_ip_opt_non_v4v6_flows => $NO_ARGS,

    ## Method : <get-ddos-redirect-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols redirect"
    get_ddos_redirect_information => $NO_ARGS,

    ## Method : <get-ddos-redirect-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols redirect parameters"
    get_ddos_redirect_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-redirect-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols redirect statistics"
    get_ddos_redirect_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-redirect-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols redirect violations"
    get_ddos_redirect_violations => $NO_ARGS,

    ## Method : <get-ddos-redirect-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols redirect flow-detection"
    get_ddos_redirect_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-redirect-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols redirect culprit-flows"
    get_ddos_redirect_flows => $NO_ARGS,

    ## Method : <get-ddos-redirect-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols redirect aggregate"
    get_ddos_redirect_aggregate => $NO_ARGS,

    ## Method : <get-ddos-redirect-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols redirect aggregate culprit-flows"
    get_ddos_redirect_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-mac-host-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mac-host"
    get_ddos_mac_host_information => $NO_ARGS,

    ## Method : <get-ddos-mac-host-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mac-host parameters"
    get_ddos_mac_host_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-mac-host-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mac-host statistics"
    get_ddos_mac_host_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-mac-host-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mac-host violations"
    get_ddos_mac_host_violations => $NO_ARGS,

    ## Method : <get-ddos-mac-host-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mac-host flow-detection"
    get_ddos_mac_host_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-mac-host-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mac-host culprit-flows"
    get_ddos_mac_host_flows => $NO_ARGS,

    ## Method : <get-ddos-mac-host-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mac-host aggregate"
    get_ddos_mac_host_aggregate => $NO_ARGS,

    ## Method : <get-ddos-mac-host-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols mac-host aggregate culprit-flows"
    get_ddos_mac_host_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-tun-frag-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tunnel-fragment"
    get_ddos_tun_frag_information => $NO_ARGS,

    ## Method : <get-ddos-tun-frag-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tunnel-fragment parameters"
    get_ddos_tun_frag_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-tun-frag-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tunnel-fragment statistics"
    get_ddos_tun_frag_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-tun-frag-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tunnel-fragment violations"
    get_ddos_tun_frag_violations => $NO_ARGS,

    ## Method : <get-ddos-tun-frag-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tunnel-fragment flow-detection"
    get_ddos_tun_frag_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-tun-frag-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tunnel-fragment culprit-flows"
    get_ddos_tun_frag_flows => $NO_ARGS,

    ## Method : <get-ddos-tun-frag-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tunnel-fragment aggregate"
    get_ddos_tun_frag_aggregate => $NO_ARGS,

    ## Method : <get-ddos-tun-frag-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tunnel-fragment aggregate culprit-flows"
    get_ddos_tun_frag_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-igmp-snoop-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmp-snoop"
    get_ddos_igmp_snoop_information => $NO_ARGS,

    ## Method : <get-ddos-igmp-snoop-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmp-snoop parameters"
    get_ddos_igmp_snoop_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-igmp-snoop-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmp-snoop statistics"
    get_ddos_igmp_snoop_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-igmp-snoop-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmp-snoop violations"
    get_ddos_igmp_snoop_violations => $NO_ARGS,

    ## Method : <get-ddos-igmp-snoop-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmp-snoop flow-detection"
    get_ddos_igmp_snoop_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-igmp-snoop-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmp-snoop culprit-flows"
    get_ddos_igmp_snoop_flows => $NO_ARGS,

    ## Method : <get-ddos-igmp-snoop-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmp-snoop aggregate"
    get_ddos_igmp_snoop_aggregate => $NO_ARGS,

    ## Method : <get-ddos-igmp-snoop-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols igmp-snoop aggregate culprit-flows"
    get_ddos_igmp_snoop_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-services-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols services"
    get_ddos_services_information => $NO_ARGS,

    ## Method : <get-ddos-services-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols services parameters"
    get_ddos_services_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-services-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols services statistics"
    get_ddos_services_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-services-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols services violations"
    get_ddos_services_violations => $NO_ARGS,

    ## Method : <get-ddos-services-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols services flow-detection"
    get_ddos_services_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-services-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols services culprit-flows"
    get_ddos_services_flows => $NO_ARGS,

    ## Method : <get-ddos-services-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols services aggregate"
    get_ddos_services_aggregate => $NO_ARGS,

    ## Method : <get-ddos-services-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols services aggregate culprit-flows"
    get_ddos_services_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-demuxauto-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols demux-autosense"
    get_ddos_demuxauto_information => $NO_ARGS,

    ## Method : <get-ddos-demuxauto-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols demux-autosense parameters"
    get_ddos_demuxauto_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-demuxauto-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols demux-autosense statistics"
    get_ddos_demuxauto_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-demuxauto-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols demux-autosense violations"
    get_ddos_demuxauto_violations => $NO_ARGS,

    ## Method : <get-ddos-demuxauto-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols demux-autosense flow-detection"
    get_ddos_demuxauto_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-demuxauto-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols demux-autosense culprit-flows"
    get_ddos_demuxauto_flows => $NO_ARGS,

    ## Method : <get-ddos-demuxauto-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols demux-autosense aggregate"
    get_ddos_demuxauto_aggregate => $NO_ARGS,

    ## Method : <get-ddos-demuxauto-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols demux-autosense aggregate culprit-flows"
    get_ddos_demuxauto_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-reject-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols reject"
    get_ddos_reject_information => $NO_ARGS,

    ## Method : <get-ddos-reject-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols reject parameters"
    get_ddos_reject_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-reject-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols reject statistics"
    get_ddos_reject_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-reject-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols reject violations"
    get_ddos_reject_violations => $NO_ARGS,

    ## Method : <get-ddos-reject-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols reject flow-detection"
    get_ddos_reject_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-reject-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols reject culprit-flows"
    get_ddos_reject_flows => $NO_ARGS,

    ## Method : <get-ddos-reject-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols reject aggregate"
    get_ddos_reject_aggregate => $NO_ARGS,

    ## Method : <get-ddos-reject-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols reject aggregate culprit-flows"
    get_ddos_reject_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-rejectv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rejectv6"
    get_ddos_rejectv6_information => $NO_ARGS,

    ## Method : <get-ddos-rejectv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rejectv6 parameters"
    get_ddos_rejectv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-rejectv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rejectv6 statistics"
    get_ddos_rejectv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-rejectv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rejectv6 violations"
    get_ddos_rejectv6_violations => $NO_ARGS,

    ## Method : <get-ddos-rejectv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rejectv6 flow-detection"
    get_ddos_rejectv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-rejectv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rejectv6 culprit-flows"
    get_ddos_rejectv6_flows => $NO_ARGS,

    ## Method : <get-ddos-rejectv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rejectv6 aggregate"
    get_ddos_rejectv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-rejectv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols rejectv6 aggregate culprit-flows"
    get_ddos_rejectv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-fw-host-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols firewall-host"
    get_ddos_fw_host_information => $NO_ARGS,

    ## Method : <get-ddos-fw-host-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols firewall-host parameters"
    get_ddos_fw_host_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-fw-host-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols firewall-host statistics"
    get_ddos_fw_host_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-fw-host-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols firewall-host violations"
    get_ddos_fw_host_violations => $NO_ARGS,

    ## Method : <get-ddos-fw-host-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols firewall-host flow-detection"
    get_ddos_fw_host_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-fw-host-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols firewall-host culprit-flows"
    get_ddos_fw_host_flows => $NO_ARGS,

    ## Method : <get-ddos-fw-host-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols firewall-host aggregate"
    get_ddos_fw_host_aggregate => $NO_ARGS,

    ## Method : <get-ddos-fw-host-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols firewall-host aggregate culprit-flows"
    get_ddos_fw_host_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-tcp-flags-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tcp-flags"
    get_ddos_tcp_flags_information => $NO_ARGS,

    ## Method : <get-ddos-tcp-flags-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tcp-flags parameters"
    get_ddos_tcp_flags_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-tcp-flags-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tcp-flags statistics"
    get_ddos_tcp_flags_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-tcp-flags-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tcp-flags violations"
    get_ddos_tcp_flags_violations => $NO_ARGS,

    ## Method : <get-ddos-tcp-flags-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tcp-flags flow-detection"
    get_ddos_tcp_flags_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-tcp-flags-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tcp-flags culprit-flows"
    get_ddos_tcp_flags_flows => $NO_ARGS,

    ## Method : <get-ddos-tcp-flags-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tcp-flags aggregate"
    get_ddos_tcp_flags_aggregate => $NO_ARGS,

    ## Method : <get-ddos-tcp-flags-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tcp-flags aggregate culprit-flows"
    get_ddos_tcp_flags_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-tcp-flags-unclass>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tcp-flags unclassified"
    get_ddos_tcp_flags_unclass => $NO_ARGS,

    ## Method : <get-ddos-tcp-flags-unclass-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tcp-flags unclassified culprit-flows"
    get_ddos_tcp_flags_unclass_flows => $NO_ARGS,

    ## Method : <get-ddos-tcp-flags-initial>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tcp-flags initial"
    get_ddos_tcp_flags_initial => $NO_ARGS,

    ## Method : <get-ddos-tcp-flags-initial-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tcp-flags initial culprit-flows"
    get_ddos_tcp_flags_initial_flows => $NO_ARGS,

    ## Method : <get-ddos-tcp-flags-establish>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tcp-flags established"
    get_ddos_tcp_flags_establish => $NO_ARGS,

    ## Method : <get-ddos-tcp-flags-establish-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tcp-flags established culprit-flows"
    get_ddos_tcp_flags_establish_flows => $NO_ARGS,

    ## Method : <get-ddos-dtcp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dtcp"
    get_ddos_dtcp_information => $NO_ARGS,

    ## Method : <get-ddos-dtcp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dtcp parameters"
    get_ddos_dtcp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-dtcp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dtcp statistics"
    get_ddos_dtcp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-dtcp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dtcp violations"
    get_ddos_dtcp_violations => $NO_ARGS,

    ## Method : <get-ddos-dtcp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dtcp flow-detection"
    get_ddos_dtcp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-dtcp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dtcp culprit-flows"
    get_ddos_dtcp_flows => $NO_ARGS,

    ## Method : <get-ddos-dtcp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dtcp aggregate"
    get_ddos_dtcp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-dtcp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dtcp aggregate culprit-flows"
    get_ddos_dtcp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-radius-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols radius"
    get_ddos_radius_information => $NO_ARGS,

    ## Method : <get-ddos-radius-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols radius parameters"
    get_ddos_radius_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-radius-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols radius statistics"
    get_ddos_radius_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-radius-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols radius violations"
    get_ddos_radius_violations => $NO_ARGS,

    ## Method : <get-ddos-radius-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols radius flow-detection"
    get_ddos_radius_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-radius-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols radius culprit-flows"
    get_ddos_radius_flows => $NO_ARGS,

    ## Method : <get-ddos-radius-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols radius aggregate"
    get_ddos_radius_aggregate => $NO_ARGS,

    ## Method : <get-ddos-radius-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols radius aggregate culprit-flows"
    get_ddos_radius_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-radius-server>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols radius server"
    get_ddos_radius_server => $NO_ARGS,

    ## Method : <get-ddos-radius-server-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols radius server culprit-flows"
    get_ddos_radius_server_flows => $NO_ARGS,

    ## Method : <get-ddos-radius-account>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols radius accounting"
    get_ddos_radius_account => $NO_ARGS,

    ## Method : <get-ddos-radius-account-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols radius accounting culprit-flows"
    get_ddos_radius_account_flows => $NO_ARGS,

    ## Method : <get-ddos-radius-auth>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols radius authorization"
    get_ddos_radius_auth => $NO_ARGS,

    ## Method : <get-ddos-radius-auth-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols radius authorization culprit-flows"
    get_ddos_radius_auth_flows => $NO_ARGS,

    ## Method : <get-ddos-ntp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ntp"
    get_ddos_ntp_information => $NO_ARGS,

    ## Method : <get-ddos-ntp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ntp parameters"
    get_ddos_ntp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ntp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ntp statistics"
    get_ddos_ntp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ntp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ntp violations"
    get_ddos_ntp_violations => $NO_ARGS,

    ## Method : <get-ddos-ntp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ntp flow-detection"
    get_ddos_ntp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ntp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ntp culprit-flows"
    get_ddos_ntp_flows => $NO_ARGS,

    ## Method : <get-ddos-ntp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ntp aggregate"
    get_ddos_ntp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ntp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ntp aggregate culprit-flows"
    get_ddos_ntp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-tacacs-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tacacs"
    get_ddos_tacacs_information => $NO_ARGS,

    ## Method : <get-ddos-tacacs-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tacacs parameters"
    get_ddos_tacacs_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-tacacs-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tacacs statistics"
    get_ddos_tacacs_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-tacacs-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tacacs violations"
    get_ddos_tacacs_violations => $NO_ARGS,

    ## Method : <get-ddos-tacacs-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tacacs flow-detection"
    get_ddos_tacacs_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-tacacs-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tacacs culprit-flows"
    get_ddos_tacacs_flows => $NO_ARGS,

    ## Method : <get-ddos-tacacs-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tacacs aggregate"
    get_ddos_tacacs_aggregate => $NO_ARGS,

    ## Method : <get-ddos-tacacs-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols tacacs aggregate culprit-flows"
    get_ddos_tacacs_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-dns-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dns"
    get_ddos_dns_information => $NO_ARGS,

    ## Method : <get-ddos-dns-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dns parameters"
    get_ddos_dns_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-dns-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dns statistics"
    get_ddos_dns_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-dns-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dns violations"
    get_ddos_dns_violations => $NO_ARGS,

    ## Method : <get-ddos-dns-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dns flow-detection"
    get_ddos_dns_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-dns-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dns culprit-flows"
    get_ddos_dns_flows => $NO_ARGS,

    ## Method : <get-ddos-dns-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dns aggregate"
    get_ddos_dns_aggregate => $NO_ARGS,

    ## Method : <get-ddos-dns-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols dns aggregate culprit-flows"
    get_ddos_dns_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-diameter-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols diameter"
    get_ddos_diameter_information => $NO_ARGS,

    ## Method : <get-ddos-diameter-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols diameter parameters"
    get_ddos_diameter_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-diameter-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols diameter statistics"
    get_ddos_diameter_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-diameter-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols diameter violations"
    get_ddos_diameter_violations => $NO_ARGS,

    ## Method : <get-ddos-diameter-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols diameter flow-detection"
    get_ddos_diameter_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-diameter-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols diameter culprit-flows"
    get_ddos_diameter_flows => $NO_ARGS,

    ## Method : <get-ddos-diameter-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols diameter aggregate"
    get_ddos_diameter_aggregate => $NO_ARGS,

    ## Method : <get-ddos-diameter-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols diameter aggregate culprit-flows"
    get_ddos_diameter_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ip-frag-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-fragments"
    get_ddos_ip_frag_information => $NO_ARGS,

    ## Method : <get-ddos-ip-frag-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-fragments parameters"
    get_ddos_ip_frag_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ip-frag-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-fragments statistics"
    get_ddos_ip_frag_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ip-frag-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-fragments violations"
    get_ddos_ip_frag_violations => $NO_ARGS,

    ## Method : <get-ddos-ip-frag-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-fragments flow-detection"
    get_ddos_ip_frag_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ip-frag-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-fragments culprit-flows"
    get_ddos_ip_frag_flows => $NO_ARGS,

    ## Method : <get-ddos-ip-frag-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-fragments aggregate"
    get_ddos_ip_frag_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ip-frag-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-fragments aggregate culprit-flows"
    get_ddos_ip_frag_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ip-frag-first-frag>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-fragments first-fragment"
    get_ddos_ip_frag_first_frag => $NO_ARGS,

    ## Method : <get-ddos-ip-frag-first-frag-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-fragments first-fragment culprit-flows"
    get_ddos_ip_frag_first_frag_flows => $NO_ARGS,

    ## Method : <get-ddos-ip-frag-trail-frag>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-fragments trail-fragment"
    get_ddos_ip_frag_trail_frag => $NO_ARGS,

    ## Method : <get-ddos-ip-frag-trail-frag-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ip-fragments trail-fragment culprit-flows"
    get_ddos_ip_frag_trail_frag_flows => $NO_ARGS,

    ## Method : <get-ddos-l2tp-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols l2tp"
    get_ddos_l2tp_information => $NO_ARGS,

    ## Method : <get-ddos-l2tp-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols l2tp parameters"
    get_ddos_l2tp_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-l2tp-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols l2tp statistics"
    get_ddos_l2tp_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-l2tp-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols l2tp violations"
    get_ddos_l2tp_violations => $NO_ARGS,

    ## Method : <get-ddos-l2tp-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols l2tp flow-detection"
    get_ddos_l2tp_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-l2tp-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols l2tp culprit-flows"
    get_ddos_l2tp_flows => $NO_ARGS,

    ## Method : <get-ddos-l2tp-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols l2tp aggregate"
    get_ddos_l2tp_aggregate => $NO_ARGS,

    ## Method : <get-ddos-l2tp-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols l2tp aggregate culprit-flows"
    get_ddos_l2tp_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-gre-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols gre"
    get_ddos_gre_information => $NO_ARGS,

    ## Method : <get-ddos-gre-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols gre parameters"
    get_ddos_gre_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-gre-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols gre statistics"
    get_ddos_gre_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-gre-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols gre violations"
    get_ddos_gre_violations => $NO_ARGS,

    ## Method : <get-ddos-gre-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols gre flow-detection"
    get_ddos_gre_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-gre-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols gre culprit-flows"
    get_ddos_gre_flows => $NO_ARGS,

    ## Method : <get-ddos-gre-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols gre aggregate"
    get_ddos_gre_aggregate => $NO_ARGS,

    ## Method : <get-ddos-gre-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols gre aggregate culprit-flows"
    get_ddos_gre_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-pimv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pimv6"
    get_ddos_pimv6_information => $NO_ARGS,

    ## Method : <get-ddos-pimv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pimv6 parameters"
    get_ddos_pimv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pimv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pimv6 statistics"
    get_ddos_pimv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pimv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pimv6 violations"
    get_ddos_pimv6_violations => $NO_ARGS,

    ## Method : <get-ddos-pimv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pimv6 flow-detection"
    get_ddos_pimv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-pimv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pimv6 culprit-flows"
    get_ddos_pimv6_flows => $NO_ARGS,

    ## Method : <get-ddos-pimv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pimv6 aggregate"
    get_ddos_pimv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-pimv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols pimv6 aggregate culprit-flows"
    get_ddos_pimv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-icmpv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols icmpv6"
    get_ddos_icmpv6_information => $NO_ARGS,

    ## Method : <get-ddos-icmpv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols icmpv6 parameters"
    get_ddos_icmpv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-icmpv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols icmpv6 statistics"
    get_ddos_icmpv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-icmpv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols icmpv6 violations"
    get_ddos_icmpv6_violations => $NO_ARGS,

    ## Method : <get-ddos-icmpv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols icmpv6 flow-detection"
    get_ddos_icmpv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-icmpv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols icmpv6 culprit-flows"
    get_ddos_icmpv6_flows => $NO_ARGS,

    ## Method : <get-ddos-icmpv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols icmpv6 aggregate"
    get_ddos_icmpv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-icmpv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols icmpv6 aggregate culprit-flows"
    get_ddos_icmpv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-ndpv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ndpv6"
    get_ddos_ndpv6_information => $NO_ARGS,

    ## Method : <get-ddos-ndpv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ndpv6 parameters"
    get_ddos_ndpv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ndpv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ndpv6 statistics"
    get_ddos_ndpv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ndpv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ndpv6 violations"
    get_ddos_ndpv6_violations => $NO_ARGS,

    ## Method : <get-ddos-ndpv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ndpv6 flow-detection"
    get_ddos_ndpv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-ndpv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ndpv6 culprit-flows"
    get_ddos_ndpv6_flows => $NO_ARGS,

    ## Method : <get-ddos-ndpv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ndpv6 aggregate"
    get_ddos_ndpv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-ndpv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols ndpv6 aggregate culprit-flows"
    get_ddos_ndpv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-sample-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sample"
    get_ddos_sample_information => $NO_ARGS,

    ## Method : <get-ddos-sample-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sample parameters"
    get_ddos_sample_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-sample-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sample statistics"
    get_ddos_sample_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-sample-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sample violations"
    get_ddos_sample_violations => $NO_ARGS,

    ## Method : <get-ddos-sample-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sample flow-detection"
    get_ddos_sample_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-sample-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sample culprit-flows"
    get_ddos_sample_flows => $NO_ARGS,

    ## Method : <get-ddos-sample-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sample aggregate"
    get_ddos_sample_aggregate => $NO_ARGS,

    ## Method : <get-ddos-sample-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sample aggregate culprit-flows"
    get_ddos_sample_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-sample-syslog>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sample syslog"
    get_ddos_sample_syslog => $NO_ARGS,

    ## Method : <get-ddos-sample-syslog-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sample syslog culprit-flows"
    get_ddos_sample_syslog_flows => $NO_ARGS,

    ## Method : <get-ddos-sample-host>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sample host"
    get_ddos_sample_host => $NO_ARGS,

    ## Method : <get-ddos-sample-host-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sample host culprit-flows"
    get_ddos_sample_host_flows => $NO_ARGS,

    ## Method : <get-ddos-sample-pfe>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sample pfe"
    get_ddos_sample_pfe => $NO_ARGS,

    ## Method : <get-ddos-sample-pfe-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sample pfe culprit-flows"
    get_ddos_sample_pfe_flows => $NO_ARGS,

    ## Method : <get-ddos-sample-tap>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sample tap"
    get_ddos_sample_tap => $NO_ARGS,

    ## Method : <get-ddos-sample-tap-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols sample tap culprit-flows"
    get_ddos_sample_tap_flows => $NO_ARGS,

    ## Method : <get-ddos-fab-probe-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols fab-probe"
    get_ddos_fab_probe_information => $NO_ARGS,

    ## Method : <get-ddos-fab-probe-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols fab-probe parameters"
    get_ddos_fab_probe_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-fab-probe-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols fab-probe statistics"
    get_ddos_fab_probe_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-fab-probe-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols fab-probe violations"
    get_ddos_fab_probe_violations => $NO_ARGS,

    ## Method : <get-ddos-fab-probe-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols fab-probe flow-detection"
    get_ddos_fab_probe_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-fab-probe-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols fab-probe culprit-flows"
    get_ddos_fab_probe_flows => $NO_ARGS,

    ## Method : <get-ddos-fab-probe-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols fab-probe aggregate"
    get_ddos_fab_probe_aggregate => $NO_ARGS,

    ## Method : <get-ddos-fab-probe-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols fab-probe aggregate culprit-flows"
    get_ddos_fab_probe_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-uncls-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified"
    get_ddos_uncls_information => $NO_ARGS,

    ## Method : <get-ddos-uncls-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified parameters"
    get_ddos_uncls_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-uncls-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified statistics"
    get_ddos_uncls_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-uncls-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified violations"
    get_ddos_uncls_violations => $NO_ARGS,

    ## Method : <get-ddos-uncls-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified flow-detection"
    get_ddos_uncls_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-uncls-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified culprit-flows"
    get_ddos_uncls_flows => $NO_ARGS,

    ## Method : <get-ddos-uncls-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified aggregate"
    get_ddos_uncls_aggregate => $NO_ARGS,

    ## Method : <get-ddos-uncls-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified aggregate culprit-flows"
    get_ddos_uncls_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-uncls-other>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified other"
    get_ddos_uncls_other => $NO_ARGS,

    ## Method : <get-ddos-uncls-other-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified other culprit-flows"
    get_ddos_uncls_other_flows => $NO_ARGS,

    ## Method : <get-ddos-uncls-resolve-v4>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified resolve-v4"
    get_ddos_uncls_resolve_v4 => $NO_ARGS,

    ## Method : <get-ddos-uncls-resolve-v4-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified resolve-v4 culprit-flows"
    get_ddos_uncls_resolve_v4_flows => $NO_ARGS,

    ## Method : <get-ddos-uncls-resolve-v6>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified resolve-v6"
    get_ddos_uncls_resolve_v6 => $NO_ARGS,

    ## Method : <get-ddos-uncls-resolve-v6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified resolve-v6 culprit-flows"
    get_ddos_uncls_resolve_v6_flows => $NO_ARGS,

    ## Method : <get-ddos-uncls-control-v4>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified control-v4"
    get_ddos_uncls_control_v4 => $NO_ARGS,

    ## Method : <get-ddos-uncls-control-v4-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified control-v4 culprit-flows"
    get_ddos_uncls_control_v4_flows => $NO_ARGS,

    ## Method : <get-ddos-uncls-control-v6>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified control-v6"
    get_ddos_uncls_control_v6 => $NO_ARGS,

    ## Method : <get-ddos-uncls-control-v6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified control-v6 culprit-flows"
    get_ddos_uncls_control_v6_flows => $NO_ARGS,

    ## Method : <get-ddos-uncls-host-rt-v4>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified host-route-v4"
    get_ddos_uncls_host_rt_v4 => $NO_ARGS,

    ## Method : <get-ddos-uncls-host-rt-v4-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified host-route-v4 culprit-flows"
    get_ddos_uncls_host_rt_v4_flows => $NO_ARGS,

    ## Method : <get-ddos-uncls-host-rt-v6>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified host-route-v6"
    get_ddos_uncls_host_rt_v6 => $NO_ARGS,

    ## Method : <get-ddos-uncls-host-rt-v6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified host-route-v6 culprit-flows"
    get_ddos_uncls_host_rt_v6_flows => $NO_ARGS,

    ## Method : <get-ddos-uncls-filter-v4>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified filter-v4"
    get_ddos_uncls_filter_v4 => $NO_ARGS,

    ## Method : <get-ddos-uncls-filter-v4-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified filter-v4 culprit-flows"
    get_ddos_uncls_filter_v4_flows => $NO_ARGS,

    ## Method : <get-ddos-uncls-filter-v6>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified filter-v6"
    get_ddos_uncls_filter_v6 => $NO_ARGS,

    ## Method : <get-ddos-uncls-filter-v6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified filter-v6 culprit-flows"
    get_ddos_uncls_filter_v6_flows => $NO_ARGS,

    ## Method : <get-ddos-uncls-control-l2>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified control-layer2"
    get_ddos_uncls_control_l2 => $NO_ARGS,

    ## Method : <get-ddos-uncls-control-l2-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified control-layer2 culprit-flows"
    get_ddos_uncls_control_l2_flows => $NO_ARGS,

    ## Method : <get-ddos-uncls-fw-host>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified fw-host"
    get_ddos_uncls_fw_host => $NO_ARGS,

    ## Method : <get-ddos-uncls-fw-host-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified fw-host culprit-flows"
    get_ddos_uncls_fw_host_flows => $NO_ARGS,

    ## Method : <get-ddos-uncls-mcast-copy>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified mcast-copy"
    get_ddos_uncls_mcast_copy => $NO_ARGS,

    ## Method : <get-ddos-uncls-mcast-copy-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols unclassified mcast-copy culprit-flows"
    get_ddos_uncls_mcast_copy_flows => $NO_ARGS,

    ## Method : <get-ddos-l2pt-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols l2pt"
    get_ddos_l2pt_information => $NO_ARGS,

    ## Method : <get-ddos-l2pt-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols l2pt parameters"
    get_ddos_l2pt_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-l2pt-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols l2pt statistics"
    get_ddos_l2pt_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-l2pt-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols l2pt violations"
    get_ddos_l2pt_violations => $NO_ARGS,

    ## Method : <get-ddos-l2pt-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols l2pt flow-detection"
    get_ddos_l2pt_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-l2pt-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols l2pt culprit-flows"
    get_ddos_l2pt_flows => $NO_ARGS,

    ## Method : <get-ddos-l2pt-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols l2pt aggregate"
    get_ddos_l2pt_aggregate => $NO_ARGS,

    ## Method : <get-ddos-l2pt-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols l2pt aggregate culprit-flows"
    get_ddos_l2pt_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-keepalive-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols keepalive"
    get_ddos_keepalive_information => $NO_ARGS,

    ## Method : <get-ddos-keepalive-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols keepalive parameters"
    get_ddos_keepalive_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-keepalive-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols keepalive statistics"
    get_ddos_keepalive_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-keepalive-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols keepalive violations"
    get_ddos_keepalive_violations => $NO_ARGS,

    ## Method : <get-ddos-keepalive-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols keepalive flow-detection"
    get_ddos_keepalive_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-keepalive-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols keepalive culprit-flows"
    get_ddos_keepalive_flows => $NO_ARGS,

    ## Method : <get-ddos-keepalive-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols keepalive aggregate"
    get_ddos_keepalive_aggregate => $NO_ARGS,

    ## Method : <get-ddos-keepalive-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols keepalive aggregate culprit-flows"
    get_ddos_keepalive_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-inline-ka-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols inline-ka"
    get_ddos_inline_ka_information => $NO_ARGS,

    ## Method : <get-ddos-inline-ka-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols inline-ka parameters"
    get_ddos_inline_ka_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-inline-ka-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols inline-ka statistics"
    get_ddos_inline_ka_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-inline-ka-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols inline-ka violations"
    get_ddos_inline_ka_violations => $NO_ARGS,

    ## Method : <get-ddos-inline-ka-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols inline-ka flow-detection"
    get_ddos_inline_ka_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-inline-ka-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols inline-ka culprit-flows"
    get_ddos_inline_ka_flows => $NO_ARGS,

    ## Method : <get-ddos-inline-ka-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols inline-ka aggregate"
    get_ddos_inline_ka_aggregate => $NO_ARGS,

    ## Method : <get-ddos-inline-ka-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols inline-ka aggregate culprit-flows"
    get_ddos_inline_ka_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-inline-svcs-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols inline-svcs"
    get_ddos_inline_svcs_information => $NO_ARGS,

    ## Method : <get-ddos-inline-svcs-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols inline-svcs parameters"
    get_ddos_inline_svcs_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-inline-svcs-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols inline-svcs statistics"
    get_ddos_inline_svcs_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-inline-svcs-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols inline-svcs violations"
    get_ddos_inline_svcs_violations => $NO_ARGS,

    ## Method : <get-ddos-inline-svcs-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols inline-svcs flow-detection"
    get_ddos_inline_svcs_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-inline-svcs-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols inline-svcs culprit-flows"
    get_ddos_inline_svcs_flows => $NO_ARGS,

    ## Method : <get-ddos-inline-svcs-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols inline-svcs aggregate"
    get_ddos_inline_svcs_aggregate => $NO_ARGS,

    ## Method : <get-ddos-inline-svcs-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols inline-svcs aggregate culprit-flows"
    get_ddos_inline_svcs_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-frame-relay-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols frame-relay"
    get_ddos_frame_relay_information => $NO_ARGS,

    ## Method : <get-ddos-frame-relay-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols frame-relay parameters"
    get_ddos_frame_relay_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-frame-relay-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols frame-relay statistics"
    get_ddos_frame_relay_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-frame-relay-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols frame-relay violations"
    get_ddos_frame_relay_violations => $NO_ARGS,

    ## Method : <get-ddos-frame-relay-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols frame-relay flow-detection"
    get_ddos_frame_relay_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-frame-relay-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols frame-relay culprit-flows"
    get_ddos_frame_relay_flows => $NO_ARGS,

    ## Method : <get-ddos-frame-relay-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols frame-relay aggregate"
    get_ddos_frame_relay_aggregate => $NO_ARGS,

    ## Method : <get-ddos-frame-relay-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols frame-relay aggregate culprit-flows"
    get_ddos_frame_relay_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-frame-relay-frf15>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols frame-relay frf15"
    get_ddos_frame_relay_frf15 => $NO_ARGS,

    ## Method : <get-ddos-frame-relay-frf15-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols frame-relay frf15 culprit-flows"
    get_ddos_frame_relay_frf15_flows => $NO_ARGS,

    ## Method : <get-ddos-frame-relay-frf16>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols frame-relay frf16"
    get_ddos_frame_relay_frf16 => $NO_ARGS,

    ## Method : <get-ddos-frame-relay-frf16-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols frame-relay frf16 culprit-flows"
    get_ddos_frame_relay_frf16_flows => $NO_ARGS,

    ## Method : <get-ddos-amtv4-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols amtv4"
    get_ddos_amtv4_information => $NO_ARGS,

    ## Method : <get-ddos-amtv4-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols amtv4 parameters"
    get_ddos_amtv4_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-amtv4-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols amtv4 statistics"
    get_ddos_amtv4_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-amtv4-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols amtv4 violations"
    get_ddos_amtv4_violations => $NO_ARGS,

    ## Method : <get-ddos-amtv4-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols amtv4 flow-detection"
    get_ddos_amtv4_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-amtv4-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols amtv4 culprit-flows"
    get_ddos_amtv4_flows => $NO_ARGS,

    ## Method : <get-ddos-amtv4-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols amtv4 aggregate"
    get_ddos_amtv4_aggregate => $NO_ARGS,

    ## Method : <get-ddos-amtv4-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols amtv4 aggregate culprit-flows"
    get_ddos_amtv4_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-amtv6-information>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols amtv6"
    get_ddos_amtv6_information => $NO_ARGS,

    ## Method : <get-ddos-amtv6-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols amtv6 parameters"
    get_ddos_amtv6_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-amtv6-statistics>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols amtv6 statistics"
    get_ddos_amtv6_statistics => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-amtv6-violations>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols amtv6 violations"
    get_ddos_amtv6_violations => $NO_ARGS,

    ## Method : <get-ddos-amtv6-flow-parameters>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols amtv6 flow-detection"
    get_ddos_amtv6_flow_parameters => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ddos-amtv6-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols amtv6 culprit-flows"
    get_ddos_amtv6_flows => $NO_ARGS,

    ## Method : <get-ddos-amtv6-aggregate>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols amtv6 aggregate"
    get_ddos_amtv6_aggregate => $NO_ARGS,

    ## Method : <get-ddos-amtv6-aggregate-flows>
    ## Returns: <ddos-protocols-information>
    ## Command: "show ddos-protection protocols amtv6 aggregate culprit-flows"
    get_ddos_amtv6_aggregate_flows => $NO_ARGS,

    ## Method : <get-ddos-statistics-information>
    ## Returns: <ddos-statistics-information>
    ## Command: "show ddos-protection statistics"
    get_ddos_statistics_information => $NO_ARGS,

    ## Method : <get-ddos-version>
    ## Returns: <ddos-version>
    ## Command: "show ddos-protection version"
    get_ddos_version => $NO_ARGS,

    ## Method : <get-dhcp-service-statistics-information>
    ## Returns: <dhcp-service-statistics-information>
    ## Command: "show dhcp statistics"
    get_dhcp_service_statistics_information => {
	summary => $TOGGLE,
	interface => $STRING,
    },

    ## Method : <get-dhcp-relay-binding-information>
    ## Returns: <dhcp-relay-binding-information>
    ## Command: "show dhcp relay binding"
    get_dhcp_relay_binding_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	summary => $TOGGLE,
	address => $STRING,
	interfaces_wildcard => $STRING,
	interfaces_vlan => $STRING,
	routing_instance => $STRING,
	bridge_domain => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-dhcp-relay-interface-bindings>
    ## Returns: <dhcp-relay-binding-information>
    ## Command: "show dhcp relay binding interface"
    get_dhcp_relay_interface_bindings => {
	interface_name => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-dhcp-relay-statistics-information>
    ## Returns: <dhcp-relay-statistics-information>
    ## Command: "show dhcp relay statistics"
    get_dhcp_relay_statistics_information => {
	summary => $TOGGLE,
	routing_instance => $STRING,
	bridge_domain => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-dhcp-server-binding-information>
    ## Returns: <dhcp-server-binding-information>
    ## Command: "show dhcp server binding"
    get_dhcp_server_binding_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	summary => $TOGGLE,
	address => $STRING,
	interfaces_wildcard => $STRING,
	interfaces_vlan => $STRING,
	routing_instance => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-dhcp-relay-binding-interface>
    ## Returns: <dhcp-relay-binding-information>
    ## Command: "show dhcp server binding interface"
    get_dhcp_relay_binding_interface => {
	interface_name => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-dhcp-server-statistics-information>
    ## Returns: <dhcp-server-statistics-information>
    ## Command: "show dhcp server statistics"
    get_dhcp_server_statistics_information => {
	summary => $TOGGLE,
	routing_instance => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-dhcpv6-relay-binding-information>
    ## Returns: <dhcpv6-relay-binding-information>
    ## Command: "show dhcpv6 relay binding"
    get_dhcpv6_relay_binding_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	summary => $TOGGLE,
	address => $STRING,
	interfaces_wildcard => $STRING,
	interfaces_vlan => $STRING,
	routing_instance => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-dhcpv6-relay-binding-interface>
    ## Returns: <dhcpv6-relay-binding-information>
    ## Command: "show dhcpv6 relay binding interface"
    get_dhcpv6_relay_binding_interface => {
	interface_name => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-dhcpv6-relay-statistics-information>
    ## Returns: <dhcpv6-relay-statistics-information>
    ## Command: "show dhcpv6 relay statistics"
    get_dhcpv6_relay_statistics_information => {
	summary => $TOGGLE,
	routing_instance => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-dhcpv6-service-statistics-information>
    ## Returns: <dhcpv6-service-statistics-information>
    ## Command: "show dhcpv6 statistics"
    get_dhcpv6_service_statistics_information => {
	summary => $TOGGLE,
	interface => $STRING,
    },

    ## Method : <get-dhcpv6-server-binding-information>
    ## Returns: <dhcpv6-server-binding-information>
    ## Command: "show dhcpv6 server binding"
    get_dhcpv6_server_binding_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	summary => $TOGGLE,
	address => $STRING,
	interfaces_wildcard => $STRING,
	interfaces_vlan => $STRING,
	routing_instance => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-dhcpv6-server-binding-interface>
    ## Returns: <dhcpv6-server-binding-information>
    ## Command: "show dhcpv6 server binding interface"
    get_dhcpv6_server_binding_interface => {
	interface_name => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-dhcpv6-server-statistics-information>
    ## Returns: <dhcpv6-server-statistics-information>
    ## Command: "show dhcpv6 server statistics"
    get_dhcpv6_server_statistics_information => {
	summary => $TOGGLE,
	routing_instance => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-services-subscriber-session>
    ## Returns: <packet-triggered-subscribers-information>
    ## Command: "show services subscriber sessions"
    get_services_subscriber_session => {
	client_id => $STRING,
	user_id => $STRING,
	ip_address => $STRING,
	interface => $STRING,
	service_interface => $STRING,
	routing_instance => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
	summary => $TOGGLE,
    },

    ## Method : <get-services-subscriber-statistics>
    ## Returns: <packet-triggered-subscribers-information>
    ## Command: "show services subscriber statistics"
    get_services_subscriber_statistics => {
	client_id => $STRING,
	extensive => $TOGGLE,
    },

    ## Method : <get-services-subscriber-bandwidth-by-session-id>
    ## Returns: <packet-triggered-subscribers-information>
    ## Command: "show services subscriber bandwidth client-id"
    get_services_subscriber_bandwidth_by_session_id => {
	client_id => $STRING,
    },

    ## Method : <get-services-subscriber-bandwidth-by-ip-address>
    ## Returns: <packet-triggered-subscribers-information>
    ## Command: "show services subscriber bandwidth ip-address"
    get_services_subscriber_bandwidth_by_ip_address => {
	ip_address => $STRING,
    },

    ## Method : <get-services-subscriber-bandwidth-by-interface>
    ## Returns: <packet-triggered-subscribers-information>
    ## Command: "show services subscriber bandwidth interface"
    get_services_subscriber_bandwidth_by_interface => {
	interface_name => $STRING,
	top_talkers => $STRING,
    },

    ## Method : <get-services-subscriber-bandwidth-by-service-interface>
    ## Returns: <packet-triggered-subscribers-information>
    ## Command: "show services subscriber bandwidth service-interface"
    get_services_subscriber_bandwidth_by_service_interface => {
	service_interface => $STRING,
	top_talkers => $STRING,
    },

    ## Method : <get-services-subscriber-dynamic-policies>
    ## Returns: <packet-triggered-subscribers-information>
    ## Command: "show services subscriber dynamic-policies"
    get_services_subscriber_dynamic_policies => {
	client_id => $STRING,
    },

    ## Method : <get-services-subscriber-flows>
    ## Returns: <packet-triggered-subscribers-information>
    ## Command: "show services subscriber flows"
    get_services_subscriber_flows => {
	client_id => $STRING,
    },

    ## Method : <get-local-policy-decision-function-statistics-interface>
    ## Returns: <lpdf-statistics>
    ## Command: "show services local-policy-decision-function statistics interface"
    get_local_policy_decision_function_statistics_interface => {
	interface_name => $STRING,
    },

    ## Method : <get-local-policy-decision-function-statistics-subscriber>
    ## Returns: <lpdf-statistics>
    ## Command: "show services local-policy-decision-function statistics subscriber"
    get_local_policy_decision_function_statistics_subscriber => {
	subscriber => $STRING,
    },

    ## Method : <get-local-policy-decision-function-flows-interface>
    ## Returns: <lpdf-flows>
    ## Command: "show services local-policy-decision-function flows interface"
    get_local_policy_decision_function_flows_interface => {
	interface_name => $STRING,
    },

    ## Method : <get-local-policy-decision-function-flows-subscriber>
    ## Returns: <lpdf-flows>
    ## Command: "show services local-policy-decision-function flows subscriber"
    get_local_policy_decision_function_flows_subscriber => {
	subscriber => $STRING,
    },

    ## Method : <get-lpdf-accounting-interface>
    ## Returns: <lpdf-accounting>
    ## Command: "show services local-policy-decision-function accounting interface"
    get_lpdf_accounting_interface => {
	interface_name => $STRING,
    },

    ## Method : <get-lpdf-accounting-subscriber>
    ## Returns: <lpdf-accounting>
    ## Command: "show services local-policy-decision-function accounting subscriber"
    get_lpdf_accounting_subscriber => {
	subscriber => $STRING,
    },

    ## Method : <get-application-aware-access-list-statistics-interface>
    ## Returns: <lpdf-statistics>
    ## Command: "show services application-aware-access-list statistics interface"
    get_application_aware_access_list_statistics_interface => {
	interface_name => $STRING,
    },

    ## Method : <get-application-aware-access-list-statistics-subscriber>
    ## Returns: <lpdf-statistics>
    ## Command: "show services application-aware-access-list statistics subscriber"
    get_application_aware_access_list_statistics_subscriber => {
	subscriber => $STRING,
    },

    ## Method : <get-application-aware-access-list-flows-interface>
    ## Returns: <lpdf-flows>
    ## Command: "show services application-aware-access-list flows interface"
    get_application_aware_access_list_flows_interface => {
	interface_name => $STRING,
	brief => $TOGGLE,
    },

    ## Method : <get-application-aware-access-list-flows-subscriber>
    ## Returns: <lpdf-flows>
    ## Command: "show services application-aware-access-list flows subscriber"
    get_application_aware_access_list_flows_subscriber => {
	subscriber => $STRING,
	level => $STRING,
    },

    ## Method : <get-probe-results>
    ## Returns: <probe-results>
    ## Command: "show services rpm probe-results"
    get_probe_results => {
	owner => $STRING,
	test => $STRING,
    },

    ## Method : <get-history-results>
    ## Returns: <history-results>
    ## Command: "show services rpm history-results"
    get_history_results => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	owner => $STRING,
	test => $STRING,
	since => $STRING,
    },

    ## Method : <get-active-servers>
    ## Returns: <active-servers>
    ## Command: "show services rpm active-servers"
    get_active_servers => $NO_ARGS,

    ## Method : <twamp-information>
    ## Returns: <none>
    ## Command: "show services rpm twamp"
    twamp_information => $NO_ARGS,

    ## Method : <twamp-server-information>
    ## Returns: <twamp-server-information>
    ## Command: "show services rpm twamp server"
    twamp_server_information => $NO_ARGS,

    ## Method : <twamp-server-connection-information>
    ## Returns: <none>
    ## Command: "show services rpm twamp server connection"
    twamp_server_connection_information => {
	connection_id => $STRING,
    },

    ## Method : <twamp-server-session-information>
    ## Returns: <none>
    ## Command: "show services rpm twamp server session"
    twamp_server_session_information => {
	session_id => $STRING,
    },

    ## Method : <get-uac-policies>
    ## Returns: <uac-policies>
    ## Command: "show services unified-access-control policies"
    get_uac_policies => {
	detail => $TOGGLE,
	identifier => $STRING,
    },

    ## Method : <get-uac-auth-table>
    ## Returns: <uac-auth-table>
    ## Command: "show services unified-access-control authentication-table"
    get_uac_auth_table => {
	detail => $TOGGLE,
	identifier => $STRING,
	extended => $TOGGLE,
	role => $STRING,
	ip => $STRING,
	user => $STRING,
    },

    ## Method : <get-uac-status>
    ## Returns: <uac-status>
    ## Command: "show services unified-access-control status"
    get_uac_status => $NO_ARGS,

    ## Method : <get-uac-role-entries>
    ## Returns: <uac-role-entries>
    ## Command: "show services unified-access-control roles"
    get_uac_role_entries => $NO_ARGS,

    ## Method : <get-static-subscribers-sessions-information>
    ## Returns: <static-subscribers-information>
    ## Command: "show static-subscribers sessions"
    get_static_subscribers_sessions_information => {
	interface => $STRING,
	group => $STRING,
    },

    ## Method : <get-interface-information>
    ## Returns: <interface-information>
    ## Command: "show interfaces"
    get_interface_information => {
	routing_instance => $STRING,
	extensive => $TOGGLE,
	statistics => $TOGGLE,
	media => $TOGGLE,
	detail => $TOGGLE,
	terse => $TOGGLE,
	brief => $TOGGLE,
	descriptions => $TOGGLE,
	snmp_index => $STRING,
	switch_port => $STRING,
	interface_name => $STRING,
    },

    ## Method : <get-mc-ae-interface-information>
    ## Returns: <mc-ae-status>
    ## Command: "show interfaces mc-ae"
    get_mc_ae_interface_information => {
	id => $STRING,
	unit => $STRING,
    },

    ## Method : <get-interface-controller-information>
    ## Returns: <interface-information>
    ## Command: "show interfaces controller"
    get_interface_controller_information => {
	interface_name => $STRING,
    },

    ## Method : <get-interface-set-information>
    ## Returns: <interface-information>
    ## Command: "show interfaces interface-set"
    get_interface_set_information => {
	terse => $TOGGLE,
	detail => $TOGGLE,
	interface_set_name => $STRING,
    },

    ## Method : <get-interface-set-queue-information>
    ## Returns: <interface-set-queue-information>
    ## Command: "show interfaces interface-set queue"
    get_interface_set_queue_information => {
	forwarding_class => $STRING,
	ingress => $TOGGLE,
	egress => $TOGGLE,
	both_ingress_egress => $TOGGLE,
	aggregate => $TOGGLE,
	remaining_traffic => $TOGGLE,
	interface_set_name => $STRING,
    },

    ## Method : <show-interfaces-interval>
    ## Returns: <interfaces-interval>
    ## Command: "show interfaces interval"
    show_interfaces_interval => {
	interface_name => $STRING,
    },

    ## Method : <show-interfaces-far-end-interval>
    ## Returns: <interfaces-far-end-interval>
    ## Command: "show interfaces far-end-interval"
    show_interfaces_far_end_interval => {
	interface_name => $STRING,
    },

    ## Method : <get-mac-database>
    ## Returns: <mac-database>
    ## Command: "show interfaces mac-database"
    get_mac_database => {
	interface_name => $STRING,
	mac_address => $STRING,
    },

    ## Method : <get-interface-queue-information>
    ## Returns: <interface-information>
    ## Command: "show interfaces queue"
    get_interface_queue_information => {
	forwarding_class => $STRING,
	ingress => $TOGGLE,
	egress => $TOGGLE,
	both_ingress_egress => $TOGGLE,
	aggregate => $TOGGLE,
	remaining_traffic => $TOGGLE,
	source_chassis => $STRING,
	source_fpc => $STRING,
	l2_statistics => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-interface-filter-information>
    ## Returns: <interface-filter-information>
    ## Command: "show interfaces filters"
    get_interface_filter_information => {
	interface_name => $STRING,
    },

    ## Method : <get-interface-policer-information>
    ## Returns: <interface-policer-information>
    ## Command: "show interfaces policers"
    get_interface_policer_information => {
	interface_name => $STRING,
    },

    ## Method : <get-interface-optics-diagnostics-information>
    ## Returns: <interface-optics-diagnostics-information>
    ## Command: "show interfaces diagnostics optics"
    get_interface_optics_diagnostics_information => {
	interface_name => $STRING,
    },

    ## Method : <get-destination-class-statistics>
    ## Returns: <destination-class-statistics>
    ## Command: "show interfaces destination-class"
    get_destination_class_statistics => {
	class_name => $STRING,
	interface_name => $STRING,
    },

    ## Method : <get-all-destination-class-statistics>
    ## Returns: <interface-information>
    ## Command: "show interfaces destination-class all"
    get_all_destination_class_statistics => $NO_ARGS,

    ## Method : <get-source-class-statistics>
    ## Returns: <source-class-statistics>
    ## Command: "show interfaces source-class"
    get_source_class_statistics => {
	class_name => $STRING,
	interface_name => $STRING,
    },

    ## Method : <get-all-source-class-statistics>
    ## Returns: <interface-information>
    ## Command: "show interfaces source-class all"
    get_all_source_class_statistics => $NO_ARGS,

    ## Method : <get-lacp-interface-statistics>
    ## Returns: <lacp-interface-statistics>
    ## Command: "show lacp statistics interfaces"
    get_lacp_interface_statistics => {
	interface_name => $STRING,
    },

    ## Method : <get-lacp-interface-information>
    ## Returns: <lacp-interface-information>
    ## Command: "show lacp interfaces"
    get_lacp_interface_information => {
	interface_name => $STRING,
    },

    ## Method : <get-lacp-timeout-information>
    ## Returns: <lacp-timeout-information>
    ## Command: "show lacp timeouts"
    get_lacp_timeout_information => {
	interface_name => $STRING,
    },

    ## Method : <get-lfmd-information>
    ## Returns: <lfmd-information>
    ## Command: "show oam ethernet link-fault-management"
    get_lfmd_information => {
	detail => $TOGGLE,
	brief => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-gre-ka-information>
    ## Returns: <oamd-information>
    ## Command: "show oam gre-keepalive"
    get_gre_ka_information => {
	interface_name => $STRING,
    },

    ## Method : <get-mspinfo-packages>
    ## Returns: <mspinfo-raw-output>
    ## Command: "show extension-provider system packages"
    get_mspinfo_packages => {
	detail => $TOGGLE,
	interface => $STRING,
    },

    ## Method : <get-mspinfo-processes>
    ## Returns: <mspinfo-raw-output>
    ## Command: "show extension-provider system processes"
    get_mspinfo_processes => {
	detail => $TOGGLE,
	wide => $TOGGLE,
	interface => $STRING,
    },

    ## Method : <get-mspinfo-processes-brief>
    ## Returns: <mspinfo-raw-output>
    ## Command: "show extension-provider system processes brief"
    get_mspinfo_processes_brief => {
	interface => $STRING,
    },

    ## Method : <get-mspinfo-processes-extensive>
    ## Returns: <mspinfo-raw-output>
    ## Command: "show extension-provider system processes extensive"
    get_mspinfo_processes_extensive => {
	interface => $STRING,
    },

    ## Method : <get-mspinfo-connections>
    ## Returns: <mspinfo-raw-output>
    ## Command: "show extension-provider system connections"
    get_mspinfo_connections => {
	inet => $TOGGLE,
	inet6 => $TOGGLE,
	extensive => $TOGGLE,
	show_routing_instances => $TOGGLE,
	interface => $STRING,
    },

    ## Method : <get-mspinfo-virtual-memory>
    ## Returns: <mspinfo-raw-output>
    ## Command: "show extension-provider system virtual-memory"
    get_mspinfo_virtual_memory => {
	interface => $STRING,
    },

    ## Method : <get-mspinfo-uptime>
    ## Returns: <mspinfo-raw-output>
    ## Command: "show extension-provider system uptime"
    get_mspinfo_uptime => {
	interface => $STRING,
    },

    ## Method : <get-arp-table-information>
    ## Returns: <arp-table-information>
    ## Command: "show arp"
    get_arp_table_information => {
	hostname => $STRING,
	interface => $STRING,
	no_resolve => $TOGGLE,
	expiration_time => $TOGGLE,
	vpn => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-forwarding-table-information>
    ## Returns: <forwarding-table-information>
    ## Command: "show route forwarding-table"
    get_forwarding_table_information => {
	detail => $TOGGLE,
	extensive => $TOGGLE,
	multicast => $TOGGLE,
	family => $STRING,
	vpn => $STRING,
	table => $STRING,
	interface_name => $STRING,
	vlan => $STRING,
	bridge_domain => $STRING,
	summary => $TOGGLE,
	matching => $STRING,
	destination => $STRING,
	learning_vlan_id => $STRING,
	label => $STRING,
	ccc => $STRING,
	all => $TOGGLE,
    },

    ## Method : <get-fib-localization-information>
    ## Returns: <fib-localization-information>
    ## Command: "show route localization"
    get_fib_localization_information => {
	detail => $TOGGLE,
    },

    ## Method : <get-system-core-dumps>
    ## Returns: <directory-list>
    ## Command: "show system core-dumps"
    get_system_core_dumps => {
	component => $STRING,
	node_group => $STRING,
	staging_area => $TOGGLE,
	detail => $TOGGLE,
	display_mastership => $TOGGLE,
	repository => $STRING,
	fabric_members => $TOGGLE,
	display_order => $STRING,
	display_period => $STRING,
    },

    ## Method : <get-core-file-information>
    ## Returns: <core-information>
    ## Command: "show system core-dumps core-file-info"
    get_core_file_information => {
	component => $STRING,
	staging_area => $TOGGLE,
	detail => $TOGGLE,
	brief => $TOGGLE,
	core_filename => $STRING,
    },

    ## Method : <get-directory-usage-information>
    ## Returns: <directory-usage-information>
    ## Command: "show system directory-usage"
    get_directory_usage_information => {
	path => $STRING,
	depth => $STRING,
    },

    ## Method : <get-auto-snapshot-information>
    ## Returns: <auto-snapshot-information>
    ## Command: "show system auto-snapshot"
    get_auto_snapshot_information => $NO_ARGS,

    ## Method : <get-snapshot-information>
    ## Returns: <snapshot-information>
    ## Command: "show system snapshot"
    get_snapshot_information => {
	slice => $STRING,
	media => $STRING,
    },

    ## Method : <get-package-backup-information>
    ## Returns: <package-backup-information>
    ## Command: "show system software backup"
    get_package_backup_information => $NO_ARGS,

    ## Method : <get-process-health-information>
    ## Returns: <system-processes-health-information>
    ## Command: "show system processes health"
    get_process_health_information => {
	process_name => $STRING,
	pid => $STRING,
    },

    ## Method : <get-system-process-resource-limits>
    ## Returns: <secpolinfo-policy-information>
    ## Command: "show system processes resource-limits"
    get_system_process_resource_limits => {
	process_name => $STRING,
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-statistics-information>
    ## Returns: <statistics>
    ## Command: "show system statistics"
    get_statistics_information => {
	ip => $TOGGLE,
	ip6 => $TOGGLE,
	icmp => $TOGGLE,
	icmp6 => $TOGGLE,
	tcp => $TOGGLE,
	udp => $TOGGLE,
	igmp => $TOGGLE,
	arp => $TOGGLE,
	clns => $TOGGLE,
	esis => $TOGGLE,
	tnp => $TOGGLE,
	rdp => $TOGGLE,
	ttp => $TOGGLE,
	tudp => $TOGGLE,
	mpls => $TOGGLE,
	ethoamcfm => $TOGGLE,
	ethoamlfm => $TOGGLE,
	virtual_node => $TOGGLE,
    },

    ## Method : <get-system-vpls-statistics>
    ## Returns: <statistics>
    ## Command: "show system statistics vpls"
    get_system_vpls_statistics => $NO_ARGS,

    ## Method : <get-system-bridge-statistics>
    ## Returns: <statistics>
    ## Command: "show system statistics bridge"
    get_system_bridge_statistics => $NO_ARGS,

    ## Method : <get-system-stats-extended>
    ## Returns: <extended-system-stats>
    ## Command: "show system statistics extended"
    get_system_stats_extended => {
	ipv4 => $TOGGLE,
	ipv6 => $TOGGLE,
    },

    ## Method : <get-system-storage>
    ## Returns: <system-storage-information>
    ## Command: "show system storage"
    get_system_storage => {
	detail => $TOGGLE,
    },

    ## Method : <get-system-storage-partitions>
    ## Returns: <system-storage-information>
    ## Command: "show system storage partitions"
    get_system_storage_partitions => $NO_ARGS,

    ## Method : <get-switchover-information>
    ## Returns: <switchover-information>
    ## Command: "show system switchover"
    get_switchover_information => $NO_ARGS,

    ## Method : <get-system-services-reverse-information>
    ## Returns: <system-services-reverse-information>
    ## Command: "show system services reverse"
    get_system_services_reverse_information => $NO_ARGS,

    ## Method : <get-system-memory-information>
    ## Returns: <system-memory-information>
    ## Command: "show system memory"
    get_system_memory_information => $NO_ARGS,

    ## Method : <get-system-virtual-memory-information>
    ## Returns: <system-virtual-memory-information>
    ## Command: "show system virtual-memory"
    get_system_virtual_memory_information => $NO_ARGS,

    ## Method : <get-system-users-information>
    ## Returns: <system-users-information>
    ## Command: "show system users"
    get_system_users_information => {
	no_resolve => $TOGGLE,
    },

    ## Method : <get-system-resource-cleanup-processes-information>
    ## Returns: <system-resource-cleanup-processes-information>
    ## Command: "show system resource-cleanup processes"
    get_system_resource_cleanup_processes_information => {
	detail => $TOGGLE,
	process_name => $STRING,
	pid => $STRING,
    },

    ## Method : <get-subscriber-management-summary-information>
    ## Returns: <subscriber-management-summary-information>
    ## Command: "show system subscriber-management summary"
    get_subscriber_management_summary_information => $NO_ARGS,

    ## Method : <get-pfe-information>
    ## Returns: <pfe-information>
    ## Command: "show pfe terse"
    get_pfe_information => $NO_ARGS,

    ## Method : <get-pfe-statistics>
    ## Returns: <pfe-statistics>
    ## Command: "show pfe statistics traffic"
    get_pfe_statistics => {
	sfm => $STRING,
	feb => $STRING,
	lcc => $STRING,
	fpc => $STRING,
    },

    ## Method : <get-accounting-profile-information>
    ## Returns: <accounting-profile-information>
    ## Command: "show accounting profile"
    get_accounting_profile_information => {
	profile => $STRING,
    },

    ## Method : <get-accounting-record-information>
    ## Returns: <accounting-record-information>
    ## Command: "show accounting records"
    get_accounting_record_information => {
	profile => $STRING,
	since => $STRING,
	utc_timestamp => $TOGGLE,
    },

    ## Method : <get-virtual-machine-information>
    ## Returns: <sdk-vmmd-vm-information>
    ## Command: "show app-engine virtual-machine instance"
    get_virtual_machine_information => {
	detail => $TOGGLE,
	brief => $TOGGLE,
	instance_name => $STRING,
    },

    ## Method : <get-virtual-machine-package-information>
    ## Returns: <sdk-vmmd-vm-pkg-information>
    ## Command: "show app-engine virtual-machine package"
    get_virtual_machine_package_information => {
	pkg_name => $STRING,
    },

    ## Method : <get-snmp-object>
    ## Returns: <snmp-object-information>
    ## Command: "show snmp mib get"
    get_snmp_object => {
	decimal => $TOGGLE,
	ascii => $TOGGLE,
	snmp_object_name => $STRING,
    },

    ## Method : <next-snmp-object>
    ## Returns: <snmp-object-information>
    ## Command: "show snmp mib get-next"
    next_snmp_object => {
	decimal => $TOGGLE,
	ascii => $TOGGLE,
	snmp_object_name => $STRING,
    },

    ## Method : <walk-snmp-object>
    ## Returns: <snmp-object-information>
    ## Command: "show snmp mib walk"
    walk_snmp_object => {
	decimal => $TOGGLE,
	ascii => $TOGGLE,
	snmp_object_name => $STRING,
    },

    ## Method : <get-snmp-information>
    ## Returns: <snmp-statistics>
    ## Command: "show snmp statistics"
    get_snmp_information => $NO_ARGS,

    ## Method : <get-rmon-information>
    ## Returns: <rmon-information>
    ## Command: "show snmp rmon"
    get_rmon_information => $NO_ARGS,

    ## Method : <get-rmon-history-information>
    ## Returns: <rmon-history-information>
    ## Command: "show snmp rmon history"
    get_rmon_history_information => {
	index => $STRING,
	sample_index => $STRING,
    },

    ## Method : <get-rmon-alarm-information>
    ## Returns: <rmon-alarm-information>
    ## Command: "show snmp rmon alarms"
    get_rmon_alarm_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-rmon-event-information>
    ## Returns: <rmon-event-information>
    ## Command: "show snmp rmon events"
    get_rmon_event_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-rmon-log-information>
    ## Returns: <rmon-log-information>
    ## Command: "show snmp rmon logs"
    get_rmon_log_information => $NO_ARGS,

    ## Method : <get-health-monitor-information>
    ## Returns: <health-monitor-information>
    ## Command: "show snmp health-monitor"
    get_health_monitor_information => $NO_ARGS,

    ## Method : <get-health-monitor-alarm-information>
    ## Returns: <rmon-alarm-information>
    ## Command: "show snmp health-monitor alarms"
    get_health_monitor_alarm_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-health-monitor-log-information>
    ## Returns: <rmon-log-information>
    ## Command: "show snmp health-monitor logs"
    get_health_monitor_log_information => $NO_ARGS,

    ## Method : <get-snmp-v3-information>
    ## Returns: <snmp-v3-information>
    ## Command: "show snmp v3"
    get_snmp_v3_information => $NO_ARGS,

    ## Method : <get-snmp-v3-general-information>
    ## Returns: <snmp-v3-general-information>
    ## Command: "show snmp v3 general"
    get_snmp_v3_general_information => $NO_ARGS,

    ## Method : <get-snmp-v3-group-information>
    ## Returns: <snmp-v3-group-information>
    ## Command: "show snmp v3 groups"
    get_snmp_v3_group_information => $NO_ARGS,

    ## Method : <get-snmp-v3-usm-user-information>
    ## Returns: <snmp-v3-usm-user-information>
    ## Command: "show snmp v3 users"
    get_snmp_v3_usm_user_information => $NO_ARGS,

    ## Method : <get-snmp-v3-access-information>
    ## Returns: <snmp-v3-access-information>
    ## Command: "show snmp v3 access"
    get_snmp_v3_access_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-snmp-v3-community-information>
    ## Returns: <snmp-v3-community-information>
    ## Command: "show snmp v3 community"
    get_snmp_v3_community_information => $NO_ARGS,

    ## Method : <get-snmp-v3-target-information>
    ## Returns: <snmp-v3-target-information>
    ## Command: "show snmp v3 target"
    get_snmp_v3_target_information => $NO_ARGS,

    ## Method : <get-snmp-v3-target-address-information>
    ## Returns: <snmp-v3-target-address-information>
    ## Command: "show snmp v3 target address"
    get_snmp_v3_target_address_information => $NO_ARGS,

    ## Method : <get-snmp-v3-target-parameters-information>
    ## Returns: <snmp-v3-target-parameters-information>
    ## Command: "show snmp v3 target parameters"
    get_snmp_v3_target_parameters_information => $NO_ARGS,

    ## Method : <get-snmp-v3-notify-information>
    ## Returns: <snmp-v3-notify-information>
    ## Command: "show snmp v3 notify"
    get_snmp_v3_notify_information => $NO_ARGS,

    ## Method : <get-snmp-v3-notify-filter-information>
    ## Returns: <snmp-v3-notify-filter-information>
    ## Command: "show snmp v3 notify filter"
    get_snmp_v3_notify_filter_information => $NO_ARGS,

    ## Method : <get-snmp-inform-statistics>
    ## Returns: <snmp-inform-statistics>
    ## Command: "show snmp inform-statistics"
    get_snmp_inform_statistics => $NO_ARGS,

    ## Method : <get-snmp-proxy-information>
    ## Returns: <snmp-proxy-information>
    ## Command: "show snmp proxy"
    get_snmp_proxy_information => $NO_ARGS,

    ## Method : <get-subscribers>
    ## Returns: <subscriber>
    ## Command: "show subscribers"
    get_subscribers => {
	address => $STRING,
	interface => $STRING,
	physical_interface => $STRING,
	user_name => $STRING,
	logical_system => $STRING,
	routing_instance => $STRING,
	profile_name => $STRING,
	agent_circuit_identifier => $STRING,
	aci_interface_set_name => $STRING,
	stacked_vlan_id => $STRING,
	vlan_id => $STRING,
	vpi => $STRING,
	vci => $STRING,
	id => $STRING,
	mac_address => $STRING,
	client_type => $STRING,
	subscriber_state => $STRING,
	terse => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	count => $TOGGLE,
    },

    ## Method : <get-subscribers-summary>
    ## Returns: <subscriber>
    ## Command: "show subscribers summary"
    get_subscribers_summary => {
	logical_system => $STRING,
	routing_instance => $STRING,
	physical_interface => $STRING,
	port => $TOGGLE,
	pic => $TOGGLE,
	slot => $TOGGLE,
	all => $TOGGLE,
    },

    ## Method : <get-vrrp-information>
    ## Returns: <vrrp-information>
    ## Command: "show vrrp"
    get_vrrp_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	summary => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <get-vrrp-interface-information>
    ## Returns: <vrrp-information>
    ## Command: "show vrrp interface"
    get_vrrp_interface_information => {
	interface_name => $STRING,
	group => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-vrrp-track-interfaces>
    ## Returns: <vrrp-information>
    ## Command: "show vrrp track"
    get_vrrp_track_interfaces => {
	interfaces => $TOGGLE,
	summary => $TOGGLE,
	detail => $TOGGLE,
	logical_system => $STRING,
    },

    ## Method : <clear-ddos-protocols-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols statistics"
    clear_ddos_protocols_statistics => $NO_ARGS,

    ## Method : <clear-ddos-protocols-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols states"
    clear_ddos_protocols_states => $NO_ARGS,

    ## Method : <clear-ddos-protocols-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols culprit-flows"
    clear_ddos_protocols_flows => $NO_ARGS,

    ## Method : <clear-ddos-dynvlan-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dynamic-vlan statistics"
    clear_ddos_dynvlan_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dynvlan-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dynamic-vlan states"
    clear_ddos_dynvlan_states => $NO_ARGS,

    ## Method : <clear-ddos-dynvlan-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dynamic-vlan culprit-flows"
    clear_ddos_dynvlan_flows => $NO_ARGS,

    ## Method : <clear-ddos-dynvlan-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dynamic-vlan aggregate statistics"
    clear_ddos_dynvlan_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dynvlan-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dynamic-vlan aggregate states"
    clear_ddos_dynvlan_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-dynvlan-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dynamic-vlan aggregate culprit-flows"
    clear_ddos_dynvlan_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ppp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp statistics"
    clear_ddos_ppp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ppp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp states"
    clear_ddos_ppp_states => $NO_ARGS,

    ## Method : <clear-ddos-ppp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp culprit-flows"
    clear_ddos_ppp_flows => $NO_ARGS,

    ## Method : <clear-ddos-ppp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp aggregate statistics"
    clear_ddos_ppp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ppp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp aggregate states"
    clear_ddos_ppp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ppp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp aggregate culprit-flows"
    clear_ddos_ppp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ppp-unclass-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp unclassified statistics"
    clear_ddos_ppp_unclass_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ppp-unclass-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp unclassified states"
    clear_ddos_ppp_unclass_states => $NO_ARGS,

    ## Method : <clear-ddos-ppp-unclass-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp unclassified culprit-flows"
    clear_ddos_ppp_unclass_flows => $NO_ARGS,

    ## Method : <clear-ddos-ppp-lcp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp lcp statistics"
    clear_ddos_ppp_lcp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ppp-lcp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp lcp states"
    clear_ddos_ppp_lcp_states => $NO_ARGS,

    ## Method : <clear-ddos-ppp-lcp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp lcp culprit-flows"
    clear_ddos_ppp_lcp_flows => $NO_ARGS,

    ## Method : <clear-ddos-ppp-auth-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp authentication statistics"
    clear_ddos_ppp_auth_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ppp-auth-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp authentication states"
    clear_ddos_ppp_auth_states => $NO_ARGS,

    ## Method : <clear-ddos-ppp-auth-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp authentication culprit-flows"
    clear_ddos_ppp_auth_flows => $NO_ARGS,

    ## Method : <clear-ddos-ppp-ipcp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp ipcp statistics"
    clear_ddos_ppp_ipcp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ppp-ipcp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp ipcp states"
    clear_ddos_ppp_ipcp_states => $NO_ARGS,

    ## Method : <clear-ddos-ppp-ipcp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp ipcp culprit-flows"
    clear_ddos_ppp_ipcp_flows => $NO_ARGS,

    ## Method : <clear-ddos-ppp-ipv6cp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp ipv6cp statistics"
    clear_ddos_ppp_ipv6cp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ppp-ipv6cp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp ipv6cp states"
    clear_ddos_ppp_ipv6cp_states => $NO_ARGS,

    ## Method : <clear-ddos-ppp-ipv6cp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp ipv6cp culprit-flows"
    clear_ddos_ppp_ipv6cp_flows => $NO_ARGS,

    ## Method : <clear-ddos-ppp-mplscp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp mplscp statistics"
    clear_ddos_ppp_mplscp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ppp-mplscp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp mplscp states"
    clear_ddos_ppp_mplscp_states => $NO_ARGS,

    ## Method : <clear-ddos-ppp-mplscp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp mplscp culprit-flows"
    clear_ddos_ppp_mplscp_flows => $NO_ARGS,

    ## Method : <clear-ddos-ppp-isis-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp isis statistics"
    clear_ddos_ppp_isis_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ppp-isis-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp isis states"
    clear_ddos_ppp_isis_states => $NO_ARGS,

    ## Method : <clear-ddos-ppp-isis-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp isis culprit-flows"
    clear_ddos_ppp_isis_flows => $NO_ARGS,

    ## Method : <clear-ddos-ppp-echo-req-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp echo-req statistics"
    clear_ddos_ppp_echo_req_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ppp-echo-req-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp echo-req states"
    clear_ddos_ppp_echo_req_states => $NO_ARGS,

    ## Method : <clear-ddos-ppp-echo-req-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp echo-req culprit-flows"
    clear_ddos_ppp_echo_req_flows => $NO_ARGS,

    ## Method : <clear-ddos-ppp-echo-rep-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp echo-rep statistics"
    clear_ddos_ppp_echo_rep_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ppp-echo-rep-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp echo-rep states"
    clear_ddos_ppp_echo_rep_states => $NO_ARGS,

    ## Method : <clear-ddos-ppp-echo-rep-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp echo-rep culprit-flows"
    clear_ddos_ppp_echo_rep_flows => $NO_ARGS,

    ## Method : <clear-ddos-ppp-mlppp-lcp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp mlppp-lcp statistics"
    clear_ddos_ppp_mlppp_lcp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ppp-mlppp-lcp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp mlppp-lcp states"
    clear_ddos_ppp_mlppp_lcp_states => $NO_ARGS,

    ## Method : <clear-ddos-ppp-mlppp-lcp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ppp mlppp-lcp culprit-flows"
    clear_ddos_ppp_mlppp_lcp_flows => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe statistics"
    clear_ddos_pppoe_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe states"
    clear_ddos_pppoe_states => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe culprit-flows"
    clear_ddos_pppoe_flows => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe aggregate statistics"
    clear_ddos_pppoe_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe aggregate states"
    clear_ddos_pppoe_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe aggregate culprit-flows"
    clear_ddos_pppoe_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-padi-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe padi statistics"
    clear_ddos_pppoe_padi_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-padi-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe padi states"
    clear_ddos_pppoe_padi_states => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-padi-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe padi culprit-flows"
    clear_ddos_pppoe_padi_flows => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-pado-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe pado statistics"
    clear_ddos_pppoe_pado_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-pado-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe pado states"
    clear_ddos_pppoe_pado_states => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-pado-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe pado culprit-flows"
    clear_ddos_pppoe_pado_flows => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-padr-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe padr statistics"
    clear_ddos_pppoe_padr_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-padr-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe padr states"
    clear_ddos_pppoe_padr_states => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-padr-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe padr culprit-flows"
    clear_ddos_pppoe_padr_flows => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-pads-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe pads statistics"
    clear_ddos_pppoe_pads_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-pads-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe pads states"
    clear_ddos_pppoe_pads_states => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-pads-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe pads culprit-flows"
    clear_ddos_pppoe_pads_flows => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-padt-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe padt statistics"
    clear_ddos_pppoe_padt_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-padt-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe padt states"
    clear_ddos_pppoe_padt_states => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-padt-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe padt culprit-flows"
    clear_ddos_pppoe_padt_flows => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-padm-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe padm statistics"
    clear_ddos_pppoe_padm_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-padm-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe padm states"
    clear_ddos_pppoe_padm_states => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-padm-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe padm culprit-flows"
    clear_ddos_pppoe_padm_flows => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-padn-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe padn statistics"
    clear_ddos_pppoe_padn_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-padn-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe padn states"
    clear_ddos_pppoe_padn_states => $NO_ARGS,

    ## Method : <clear-ddos-pppoe-padn-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pppoe padn culprit-flows"
    clear_ddos_pppoe_padn_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 statistics"
    clear_ddos_dhcpv4_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 states"
    clear_ddos_dhcpv4_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 culprit-flows"
    clear_ddos_dhcpv4_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 aggregate statistics"
    clear_ddos_dhcpv4_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 aggregate states"
    clear_ddos_dhcpv4_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 aggregate culprit-flows"
    clear_ddos_dhcpv4_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-unclass-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 unclassified statistics"
    clear_ddos_dhcpv4_unclass_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-unclass-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 unclassified states"
    clear_ddos_dhcpv4_unclass_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-unclass-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 unclassified culprit-flows"
    clear_ddos_dhcpv4_unclass_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-discover-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 discover statistics"
    clear_ddos_dhcpv4_discover_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-discover-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 discover states"
    clear_ddos_dhcpv4_discover_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-discover-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 discover culprit-flows"
    clear_ddos_dhcpv4_discover_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-offer-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 offer statistics"
    clear_ddos_dhcpv4_offer_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-offer-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 offer states"
    clear_ddos_dhcpv4_offer_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-offer-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 offer culprit-flows"
    clear_ddos_dhcpv4_offer_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-request-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 request statistics"
    clear_ddos_dhcpv4_request_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-request-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 request states"
    clear_ddos_dhcpv4_request_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-request-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 request culprit-flows"
    clear_ddos_dhcpv4_request_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-decline-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 decline statistics"
    clear_ddos_dhcpv4_decline_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-decline-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 decline states"
    clear_ddos_dhcpv4_decline_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-decline-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 decline culprit-flows"
    clear_ddos_dhcpv4_decline_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-ack-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 ack statistics"
    clear_ddos_dhcpv4_ack_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-ack-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 ack states"
    clear_ddos_dhcpv4_ack_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-ack-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 ack culprit-flows"
    clear_ddos_dhcpv4_ack_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-nak-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 nak statistics"
    clear_ddos_dhcpv4_nak_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-nak-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 nak states"
    clear_ddos_dhcpv4_nak_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-nak-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 nak culprit-flows"
    clear_ddos_dhcpv4_nak_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-release-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 release statistics"
    clear_ddos_dhcpv4_release_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-release-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 release states"
    clear_ddos_dhcpv4_release_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-release-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 release culprit-flows"
    clear_ddos_dhcpv4_release_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-inform-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 inform statistics"
    clear_ddos_dhcpv4_inform_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-inform-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 inform states"
    clear_ddos_dhcpv4_inform_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-inform-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 inform culprit-flows"
    clear_ddos_dhcpv4_inform_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-renew-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 renew statistics"
    clear_ddos_dhcpv4_renew_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-renew-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 renew states"
    clear_ddos_dhcpv4_renew_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-renew-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 renew culprit-flows"
    clear_ddos_dhcpv4_renew_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-forcerenew-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 force-renew statistics"
    clear_ddos_dhcpv4_forcerenew_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-forcerenew-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 force-renew states"
    clear_ddos_dhcpv4_forcerenew_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-forcerenew-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 force-renew culprit-flows"
    clear_ddos_dhcpv4_forcerenew_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-leasequery-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 lease-query statistics"
    clear_ddos_dhcpv4_leasequery_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-leasequery-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 lease-query states"
    clear_ddos_dhcpv4_leasequery_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-leasequery-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 lease-query culprit-flows"
    clear_ddos_dhcpv4_leasequery_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-leaseuna-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 lease-unassigned statistics"
    clear_ddos_dhcpv4_leaseuna_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-leaseuna-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 lease-unassigned states"
    clear_ddos_dhcpv4_leaseuna_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-leaseuna-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 lease-unassigned culprit-flows"
    clear_ddos_dhcpv4_leaseuna_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-leaseunk-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 lease-unknown statistics"
    clear_ddos_dhcpv4_leaseunk_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-leaseunk-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 lease-unknown states"
    clear_ddos_dhcpv4_leaseunk_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-leaseunk-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 lease-unknown culprit-flows"
    clear_ddos_dhcpv4_leaseunk_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-leaseact-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 lease-active statistics"
    clear_ddos_dhcpv4_leaseact_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-leaseact-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 lease-active states"
    clear_ddos_dhcpv4_leaseact_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-leaseact-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 lease-active culprit-flows"
    clear_ddos_dhcpv4_leaseact_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-bootp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 bootp statistics"
    clear_ddos_dhcpv4_bootp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-bootp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 bootp states"
    clear_ddos_dhcpv4_bootp_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-bootp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 bootp culprit-flows"
    clear_ddos_dhcpv4_bootp_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-no-msgtype-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 no-message-type statistics"
    clear_ddos_dhcpv4_no_msgtype_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-no-msgtype-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 no-message-type states"
    clear_ddos_dhcpv4_no_msgtype_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-no-msgtype-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 no-message-type culprit-flows"
    clear_ddos_dhcpv4_no_msgtype_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-bad-pack-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 bad-packets statistics"
    clear_ddos_dhcpv4_bad_pack_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-bad-pack-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 bad-packets states"
    clear_ddos_dhcpv4_bad_pack_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv4-bad-pack-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv4 bad-packets culprit-flows"
    clear_ddos_dhcpv4_bad_pack_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 statistics"
    clear_ddos_dhcpv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 states"
    clear_ddos_dhcpv6_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 culprit-flows"
    clear_ddos_dhcpv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 aggregate statistics"
    clear_ddos_dhcpv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 aggregate states"
    clear_ddos_dhcpv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 aggregate culprit-flows"
    clear_ddos_dhcpv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-unclass-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 unclassified statistics"
    clear_ddos_dhcpv6_unclass_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-unclass-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 unclassified states"
    clear_ddos_dhcpv6_unclass_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-unclass-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 unclassified culprit-flows"
    clear_ddos_dhcpv6_unclass_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-solicit-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 solicit statistics"
    clear_ddos_dhcpv6_solicit_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-solicit-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 solicit states"
    clear_ddos_dhcpv6_solicit_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-solicit-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 solicit culprit-flows"
    clear_ddos_dhcpv6_solicit_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-advertise-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 advertise statistics"
    clear_ddos_dhcpv6_advertise_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-advertise-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 advertise states"
    clear_ddos_dhcpv6_advertise_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-advertise-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 advertise culprit-flows"
    clear_ddos_dhcpv6_advertise_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-request-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 request statistics"
    clear_ddos_dhcpv6_request_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-request-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 request states"
    clear_ddos_dhcpv6_request_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-request-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 request culprit-flows"
    clear_ddos_dhcpv6_request_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-confirm-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 confirm statistics"
    clear_ddos_dhcpv6_confirm_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-confirm-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 confirm states"
    clear_ddos_dhcpv6_confirm_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-confirm-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 confirm culprit-flows"
    clear_ddos_dhcpv6_confirm_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-renew-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 renew statistics"
    clear_ddos_dhcpv6_renew_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-renew-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 renew states"
    clear_ddos_dhcpv6_renew_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-renew-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 renew culprit-flows"
    clear_ddos_dhcpv6_renew_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-rebind-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 rebind statistics"
    clear_ddos_dhcpv6_rebind_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-rebind-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 rebind states"
    clear_ddos_dhcpv6_rebind_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-rebind-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 rebind culprit-flows"
    clear_ddos_dhcpv6_rebind_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-reply-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 reply statistics"
    clear_ddos_dhcpv6_reply_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-reply-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 reply states"
    clear_ddos_dhcpv6_reply_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-reply-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 reply culprit-flows"
    clear_ddos_dhcpv6_reply_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-release-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 release statistics"
    clear_ddos_dhcpv6_release_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-release-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 release states"
    clear_ddos_dhcpv6_release_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-release-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 release culprit-flows"
    clear_ddos_dhcpv6_release_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-decline-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 decline statistics"
    clear_ddos_dhcpv6_decline_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-decline-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 decline states"
    clear_ddos_dhcpv6_decline_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-decline-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 decline culprit-flows"
    clear_ddos_dhcpv6_decline_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-reconfig-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 reconfigure statistics"
    clear_ddos_dhcpv6_reconfig_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-reconfig-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 reconfigure states"
    clear_ddos_dhcpv6_reconfig_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-reconfig-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 reconfigure culprit-flows"
    clear_ddos_dhcpv6_reconfig_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-info-req-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 information-request statistics"
    clear_ddos_dhcpv6_info_req_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-info-req-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 information-request states"
    clear_ddos_dhcpv6_info_req_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-info-req-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 information-request culprit-flows"
    clear_ddos_dhcpv6_info_req_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-relay-for-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 relay-forward statistics"
    clear_ddos_dhcpv6_relay_for_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-relay-for-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 relay-forward states"
    clear_ddos_dhcpv6_relay_for_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-relay-for-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 relay-forward culprit-flows"
    clear_ddos_dhcpv6_relay_for_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-relay-rep-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 relay-reply statistics"
    clear_ddos_dhcpv6_relay_rep_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-relay-rep-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 relay-reply states"
    clear_ddos_dhcpv6_relay_rep_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-relay-rep-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 relay-reply culprit-flows"
    clear_ddos_dhcpv6_relay_rep_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-leasequery-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 leasequery statistics"
    clear_ddos_dhcpv6_leasequery_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-leasequery-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 leasequery states"
    clear_ddos_dhcpv6_leasequery_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-leasequery-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 leasequery culprit-flows"
    clear_ddos_dhcpv6_leasequery_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-leaseq-re-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 leasequery-reply statistics"
    clear_ddos_dhcpv6_leaseq_re_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-leaseq-re-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 leasequery-reply states"
    clear_ddos_dhcpv6_leaseq_re_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-leaseq-re-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 leasequery-reply culprit-flows"
    clear_ddos_dhcpv6_leaseq_re_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-leaseq-do-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 leasequery-done statistics"
    clear_ddos_dhcpv6_leaseq_do_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-leaseq-do-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 leasequery-done states"
    clear_ddos_dhcpv6_leaseq_do_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-leaseq-do-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 leasequery-done culprit-flows"
    clear_ddos_dhcpv6_leaseq_do_flows => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-leaseq-da-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 leasequery-data statistics"
    clear_ddos_dhcpv6_leaseq_da_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-leaseq-da-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 leasequery-data states"
    clear_ddos_dhcpv6_leaseq_da_states => $NO_ARGS,

    ## Method : <clear-ddos-dhcpv6-leaseq-da-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dhcpv6 leasequery-data culprit-flows"
    clear_ddos_dhcpv6_leaseq_da_flows => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis statistics"
    clear_ddos_vchassis_statistics => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis states"
    clear_ddos_vchassis_states => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis culprit-flows"
    clear_ddos_vchassis_flows => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis aggregate statistics"
    clear_ddos_vchassis_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis aggregate states"
    clear_ddos_vchassis_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis aggregate culprit-flows"
    clear_ddos_vchassis_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-unclass-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis unclassified statistics"
    clear_ddos_vchassis_unclass_statistics => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-unclass-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis unclassified states"
    clear_ddos_vchassis_unclass_states => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-unclass-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis unclassified culprit-flows"
    clear_ddos_vchassis_unclass_flows => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-control-hi-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis control-high statistics"
    clear_ddos_vchassis_control_hi_statistics => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-control-hi-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis control-high states"
    clear_ddos_vchassis_control_hi_states => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-control-hi-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis control-high culprit-flows"
    clear_ddos_vchassis_control_hi_flows => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-control-lo-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis control-low statistics"
    clear_ddos_vchassis_control_lo_statistics => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-control-lo-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis control-low states"
    clear_ddos_vchassis_control_lo_states => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-control-lo-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis control-low culprit-flows"
    clear_ddos_vchassis_control_lo_flows => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-vc-packets-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis vc-packets statistics"
    clear_ddos_vchassis_vc_packets_statistics => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-vc-packets-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis vc-packets states"
    clear_ddos_vchassis_vc_packets_states => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-vc-packets-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis vc-packets culprit-flows"
    clear_ddos_vchassis_vc_packets_flows => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-vc-ttl-err-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis vc-ttl-errors statistics"
    clear_ddos_vchassis_vc_ttl_err_statistics => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-vc-ttl-err-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis vc-ttl-errors states"
    clear_ddos_vchassis_vc_ttl_err_states => $NO_ARGS,

    ## Method : <clear-ddos-vchassis-vc-ttl-err-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols virtual-chassis vc-ttl-errors culprit-flows"
    clear_ddos_vchassis_vc_ttl_err_flows => $NO_ARGS,

    ## Method : <clear-ddos-icmp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols icmp statistics"
    clear_ddos_icmp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-icmp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols icmp states"
    clear_ddos_icmp_states => $NO_ARGS,

    ## Method : <clear-ddos-icmp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols icmp culprit-flows"
    clear_ddos_icmp_flows => $NO_ARGS,

    ## Method : <clear-ddos-icmp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols icmp aggregate statistics"
    clear_ddos_icmp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-icmp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols icmp aggregate states"
    clear_ddos_icmp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-icmp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols icmp aggregate culprit-flows"
    clear_ddos_icmp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-igmp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmp statistics"
    clear_ddos_igmp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-igmp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmp states"
    clear_ddos_igmp_states => $NO_ARGS,

    ## Method : <clear-ddos-igmp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmp culprit-flows"
    clear_ddos_igmp_flows => $NO_ARGS,

    ## Method : <clear-ddos-igmp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmp aggregate statistics"
    clear_ddos_igmp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-igmp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmp aggregate states"
    clear_ddos_igmp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-igmp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmp aggregate culprit-flows"
    clear_ddos_igmp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ospf-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ospf statistics"
    clear_ddos_ospf_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ospf-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ospf states"
    clear_ddos_ospf_states => $NO_ARGS,

    ## Method : <clear-ddos-ospf-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ospf culprit-flows"
    clear_ddos_ospf_flows => $NO_ARGS,

    ## Method : <clear-ddos-ospf-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ospf aggregate statistics"
    clear_ddos_ospf_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ospf-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ospf aggregate states"
    clear_ddos_ospf_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ospf-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ospf aggregate culprit-flows"
    clear_ddos_ospf_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-rsvp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rsvp statistics"
    clear_ddos_rsvp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-rsvp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rsvp states"
    clear_ddos_rsvp_states => $NO_ARGS,

    ## Method : <clear-ddos-rsvp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rsvp culprit-flows"
    clear_ddos_rsvp_flows => $NO_ARGS,

    ## Method : <clear-ddos-rsvp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rsvp aggregate statistics"
    clear_ddos_rsvp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-rsvp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rsvp aggregate states"
    clear_ddos_rsvp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-rsvp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rsvp aggregate culprit-flows"
    clear_ddos_rsvp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-pim-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pim statistics"
    clear_ddos_pim_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pim-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pim states"
    clear_ddos_pim_states => $NO_ARGS,

    ## Method : <clear-ddos-pim-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pim culprit-flows"
    clear_ddos_pim_flows => $NO_ARGS,

    ## Method : <clear-ddos-pim-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pim aggregate statistics"
    clear_ddos_pim_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pim-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pim aggregate states"
    clear_ddos_pim_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-pim-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pim aggregate culprit-flows"
    clear_ddos_pim_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-rip-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rip statistics"
    clear_ddos_rip_statistics => $NO_ARGS,

    ## Method : <clear-ddos-rip-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rip states"
    clear_ddos_rip_states => $NO_ARGS,

    ## Method : <clear-ddos-rip-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rip culprit-flows"
    clear_ddos_rip_flows => $NO_ARGS,

    ## Method : <clear-ddos-rip-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rip aggregate statistics"
    clear_ddos_rip_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-rip-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rip aggregate states"
    clear_ddos_rip_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-rip-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rip aggregate culprit-flows"
    clear_ddos_rip_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ptp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ptp statistics"
    clear_ddos_ptp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ptp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ptp states"
    clear_ddos_ptp_states => $NO_ARGS,

    ## Method : <clear-ddos-ptp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ptp culprit-flows"
    clear_ddos_ptp_flows => $NO_ARGS,

    ## Method : <clear-ddos-ptp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ptp aggregate statistics"
    clear_ddos_ptp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ptp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ptp aggregate states"
    clear_ddos_ptp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ptp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ptp aggregate culprit-flows"
    clear_ddos_ptp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-bfd-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bfd statistics"
    clear_ddos_bfd_statistics => $NO_ARGS,

    ## Method : <clear-ddos-bfd-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bfd states"
    clear_ddos_bfd_states => $NO_ARGS,

    ## Method : <clear-ddos-bfd-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bfd culprit-flows"
    clear_ddos_bfd_flows => $NO_ARGS,

    ## Method : <clear-ddos-bfd-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bfd aggregate statistics"
    clear_ddos_bfd_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-bfd-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bfd aggregate states"
    clear_ddos_bfd_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-bfd-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bfd aggregate culprit-flows"
    clear_ddos_bfd_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-lmp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lmp statistics"
    clear_ddos_lmp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-lmp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lmp states"
    clear_ddos_lmp_states => $NO_ARGS,

    ## Method : <clear-ddos-lmp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lmp culprit-flows"
    clear_ddos_lmp_flows => $NO_ARGS,

    ## Method : <clear-ddos-lmp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lmp aggregate statistics"
    clear_ddos_lmp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-lmp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lmp aggregate states"
    clear_ddos_lmp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-lmp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lmp aggregate culprit-flows"
    clear_ddos_lmp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ldp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ldp statistics"
    clear_ddos_ldp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ldp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ldp states"
    clear_ddos_ldp_states => $NO_ARGS,

    ## Method : <clear-ddos-ldp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ldp culprit-flows"
    clear_ddos_ldp_flows => $NO_ARGS,

    ## Method : <clear-ddos-ldp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ldp aggregate statistics"
    clear_ddos_ldp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ldp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ldp aggregate states"
    clear_ddos_ldp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ldp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ldp aggregate culprit-flows"
    clear_ddos_ldp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-msdp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols msdp statistics"
    clear_ddos_msdp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-msdp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols msdp states"
    clear_ddos_msdp_states => $NO_ARGS,

    ## Method : <clear-ddos-msdp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols msdp culprit-flows"
    clear_ddos_msdp_flows => $NO_ARGS,

    ## Method : <clear-ddos-msdp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols msdp aggregate statistics"
    clear_ddos_msdp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-msdp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols msdp aggregate states"
    clear_ddos_msdp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-msdp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols msdp aggregate culprit-flows"
    clear_ddos_msdp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-bgp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bgp statistics"
    clear_ddos_bgp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-bgp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bgp states"
    clear_ddos_bgp_states => $NO_ARGS,

    ## Method : <clear-ddos-bgp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bgp culprit-flows"
    clear_ddos_bgp_flows => $NO_ARGS,

    ## Method : <clear-ddos-bgp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bgp aggregate statistics"
    clear_ddos_bgp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-bgp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bgp aggregate states"
    clear_ddos_bgp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-bgp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bgp aggregate culprit-flows"
    clear_ddos_bgp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-vrrp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols vrrp statistics"
    clear_ddos_vrrp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-vrrp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols vrrp states"
    clear_ddos_vrrp_states => $NO_ARGS,

    ## Method : <clear-ddos-vrrp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols vrrp culprit-flows"
    clear_ddos_vrrp_flows => $NO_ARGS,

    ## Method : <clear-ddos-vrrp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols vrrp aggregate statistics"
    clear_ddos_vrrp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-vrrp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols vrrp aggregate states"
    clear_ddos_vrrp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-vrrp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols vrrp aggregate culprit-flows"
    clear_ddos_vrrp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-telnet-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols telnet statistics"
    clear_ddos_telnet_statistics => $NO_ARGS,

    ## Method : <clear-ddos-telnet-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols telnet states"
    clear_ddos_telnet_states => $NO_ARGS,

    ## Method : <clear-ddos-telnet-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols telnet culprit-flows"
    clear_ddos_telnet_flows => $NO_ARGS,

    ## Method : <clear-ddos-telnet-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols telnet aggregate statistics"
    clear_ddos_telnet_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-telnet-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols telnet aggregate states"
    clear_ddos_telnet_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-telnet-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols telnet aggregate culprit-flows"
    clear_ddos_telnet_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ftp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ftp statistics"
    clear_ddos_ftp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ftp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ftp states"
    clear_ddos_ftp_states => $NO_ARGS,

    ## Method : <clear-ddos-ftp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ftp culprit-flows"
    clear_ddos_ftp_flows => $NO_ARGS,

    ## Method : <clear-ddos-ftp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ftp aggregate statistics"
    clear_ddos_ftp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ftp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ftp aggregate states"
    clear_ddos_ftp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ftp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ftp aggregate culprit-flows"
    clear_ddos_ftp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ssh-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ssh statistics"
    clear_ddos_ssh_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ssh-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ssh states"
    clear_ddos_ssh_states => $NO_ARGS,

    ## Method : <clear-ddos-ssh-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ssh culprit-flows"
    clear_ddos_ssh_flows => $NO_ARGS,

    ## Method : <clear-ddos-ssh-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ssh aggregate statistics"
    clear_ddos_ssh_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ssh-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ssh aggregate states"
    clear_ddos_ssh_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ssh-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ssh aggregate culprit-flows"
    clear_ddos_ssh_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-snmp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols snmp statistics"
    clear_ddos_snmp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-snmp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols snmp states"
    clear_ddos_snmp_states => $NO_ARGS,

    ## Method : <clear-ddos-snmp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols snmp culprit-flows"
    clear_ddos_snmp_flows => $NO_ARGS,

    ## Method : <clear-ddos-snmp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols snmp aggregate statistics"
    clear_ddos_snmp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-snmp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols snmp aggregate states"
    clear_ddos_snmp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-snmp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols snmp aggregate culprit-flows"
    clear_ddos_snmp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ancp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ancp statistics"
    clear_ddos_ancp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ancp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ancp states"
    clear_ddos_ancp_states => $NO_ARGS,

    ## Method : <clear-ddos-ancp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ancp culprit-flows"
    clear_ddos_ancp_flows => $NO_ARGS,

    ## Method : <clear-ddos-ancp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ancp aggregate statistics"
    clear_ddos_ancp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ancp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ancp aggregate states"
    clear_ddos_ancp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ancp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ancp aggregate culprit-flows"
    clear_ddos_ancp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-igmpv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmpv6 statistics"
    clear_ddos_igmpv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-igmpv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmpv6 states"
    clear_ddos_igmpv6_states => $NO_ARGS,

    ## Method : <clear-ddos-igmpv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmpv6 culprit-flows"
    clear_ddos_igmpv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-igmpv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmpv6 aggregate statistics"
    clear_ddos_igmpv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-igmpv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmpv6 aggregate states"
    clear_ddos_igmpv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-igmpv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmpv6 aggregate culprit-flows"
    clear_ddos_igmpv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-egpv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols egpv6 statistics"
    clear_ddos_egpv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-egpv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols egpv6 states"
    clear_ddos_egpv6_states => $NO_ARGS,

    ## Method : <clear-ddos-egpv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols egpv6 culprit-flows"
    clear_ddos_egpv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-egpv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols egpv6 aggregate statistics"
    clear_ddos_egpv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-egpv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols egpv6 aggregate states"
    clear_ddos_egpv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-egpv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols egpv6 aggregate culprit-flows"
    clear_ddos_egpv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-rsvpv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rsvpv6 statistics"
    clear_ddos_rsvpv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-rsvpv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rsvpv6 states"
    clear_ddos_rsvpv6_states => $NO_ARGS,

    ## Method : <clear-ddos-rsvpv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rsvpv6 culprit-flows"
    clear_ddos_rsvpv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-rsvpv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rsvpv6 aggregate statistics"
    clear_ddos_rsvpv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-rsvpv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rsvpv6 aggregate states"
    clear_ddos_rsvpv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-rsvpv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rsvpv6 aggregate culprit-flows"
    clear_ddos_rsvpv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-igmpv4v6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmpv4v6 statistics"
    clear_ddos_igmpv4v6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-igmpv4v6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmpv4v6 states"
    clear_ddos_igmpv4v6_states => $NO_ARGS,

    ## Method : <clear-ddos-igmpv4v6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmpv4v6 culprit-flows"
    clear_ddos_igmpv4v6_flows => $NO_ARGS,

    ## Method : <clear-ddos-igmpv4v6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmpv4v6 aggregate statistics"
    clear_ddos_igmpv4v6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-igmpv4v6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmpv4v6 aggregate states"
    clear_ddos_igmpv4v6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-igmpv4v6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmpv4v6 aggregate culprit-flows"
    clear_ddos_igmpv4v6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ripv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ripv6 statistics"
    clear_ddos_ripv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ripv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ripv6 states"
    clear_ddos_ripv6_states => $NO_ARGS,

    ## Method : <clear-ddos-ripv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ripv6 culprit-flows"
    clear_ddos_ripv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-ripv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ripv6 aggregate statistics"
    clear_ddos_ripv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ripv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ripv6 aggregate states"
    clear_ddos_ripv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ripv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ripv6 aggregate culprit-flows"
    clear_ddos_ripv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-bfdv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bfdv6 statistics"
    clear_ddos_bfdv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-bfdv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bfdv6 states"
    clear_ddos_bfdv6_states => $NO_ARGS,

    ## Method : <clear-ddos-bfdv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bfdv6 culprit-flows"
    clear_ddos_bfdv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-bfdv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bfdv6 aggregate statistics"
    clear_ddos_bfdv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-bfdv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bfdv6 aggregate states"
    clear_ddos_bfdv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-bfdv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bfdv6 aggregate culprit-flows"
    clear_ddos_bfdv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-lmpv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lmpv6 statistics"
    clear_ddos_lmpv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-lmpv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lmpv6 states"
    clear_ddos_lmpv6_states => $NO_ARGS,

    ## Method : <clear-ddos-lmpv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lmpv6 culprit-flows"
    clear_ddos_lmpv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-lmpv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lmpv6 aggregate statistics"
    clear_ddos_lmpv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-lmpv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lmpv6 aggregate states"
    clear_ddos_lmpv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-lmpv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lmpv6 aggregate culprit-flows"
    clear_ddos_lmpv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ldpv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ldpv6 statistics"
    clear_ddos_ldpv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ldpv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ldpv6 states"
    clear_ddos_ldpv6_states => $NO_ARGS,

    ## Method : <clear-ddos-ldpv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ldpv6 culprit-flows"
    clear_ddos_ldpv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-ldpv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ldpv6 aggregate statistics"
    clear_ddos_ldpv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ldpv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ldpv6 aggregate states"
    clear_ddos_ldpv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ldpv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ldpv6 aggregate culprit-flows"
    clear_ddos_ldpv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-msdpv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols msdpv6 statistics"
    clear_ddos_msdpv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-msdpv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols msdpv6 states"
    clear_ddos_msdpv6_states => $NO_ARGS,

    ## Method : <clear-ddos-msdpv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols msdpv6 culprit-flows"
    clear_ddos_msdpv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-msdpv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols msdpv6 aggregate statistics"
    clear_ddos_msdpv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-msdpv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols msdpv6 aggregate states"
    clear_ddos_msdpv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-msdpv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols msdpv6 aggregate culprit-flows"
    clear_ddos_msdpv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-bgpv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bgpv6 statistics"
    clear_ddos_bgpv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-bgpv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bgpv6 states"
    clear_ddos_bgpv6_states => $NO_ARGS,

    ## Method : <clear-ddos-bgpv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bgpv6 culprit-flows"
    clear_ddos_bgpv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-bgpv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bgpv6 aggregate statistics"
    clear_ddos_bgpv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-bgpv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bgpv6 aggregate states"
    clear_ddos_bgpv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-bgpv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols bgpv6 aggregate culprit-flows"
    clear_ddos_bgpv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-vrrpv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols vrrpv6 statistics"
    clear_ddos_vrrpv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-vrrpv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols vrrpv6 states"
    clear_ddos_vrrpv6_states => $NO_ARGS,

    ## Method : <clear-ddos-vrrpv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols vrrpv6 culprit-flows"
    clear_ddos_vrrpv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-vrrpv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols vrrpv6 aggregate statistics"
    clear_ddos_vrrpv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-vrrpv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols vrrpv6 aggregate states"
    clear_ddos_vrrpv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-vrrpv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols vrrpv6 aggregate culprit-flows"
    clear_ddos_vrrpv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-telnetv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols telnetv6 statistics"
    clear_ddos_telnetv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-telnetv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols telnetv6 states"
    clear_ddos_telnetv6_states => $NO_ARGS,

    ## Method : <clear-ddos-telnetv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols telnetv6 culprit-flows"
    clear_ddos_telnetv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-telnetv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols telnetv6 aggregate statistics"
    clear_ddos_telnetv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-telnetv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols telnetv6 aggregate states"
    clear_ddos_telnetv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-telnetv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols telnetv6 aggregate culprit-flows"
    clear_ddos_telnetv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ftpv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ftpv6 statistics"
    clear_ddos_ftpv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ftpv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ftpv6 states"
    clear_ddos_ftpv6_states => $NO_ARGS,

    ## Method : <clear-ddos-ftpv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ftpv6 culprit-flows"
    clear_ddos_ftpv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-ftpv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ftpv6 aggregate statistics"
    clear_ddos_ftpv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ftpv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ftpv6 aggregate states"
    clear_ddos_ftpv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ftpv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ftpv6 aggregate culprit-flows"
    clear_ddos_ftpv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-sshv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sshv6 statistics"
    clear_ddos_sshv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-sshv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sshv6 states"
    clear_ddos_sshv6_states => $NO_ARGS,

    ## Method : <clear-ddos-sshv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sshv6 culprit-flows"
    clear_ddos_sshv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-sshv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sshv6 aggregate statistics"
    clear_ddos_sshv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-sshv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sshv6 aggregate states"
    clear_ddos_sshv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-sshv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sshv6 aggregate culprit-flows"
    clear_ddos_sshv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-snmpv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols snmpv6 statistics"
    clear_ddos_snmpv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-snmpv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols snmpv6 states"
    clear_ddos_snmpv6_states => $NO_ARGS,

    ## Method : <clear-ddos-snmpv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols snmpv6 culprit-flows"
    clear_ddos_snmpv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-snmpv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols snmpv6 aggregate statistics"
    clear_ddos_snmpv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-snmpv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols snmpv6 aggregate states"
    clear_ddos_snmpv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-snmpv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols snmpv6 aggregate culprit-flows"
    clear_ddos_snmpv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ancpv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ancpv6 statistics"
    clear_ddos_ancpv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ancpv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ancpv6 states"
    clear_ddos_ancpv6_states => $NO_ARGS,

    ## Method : <clear-ddos-ancpv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ancpv6 culprit-flows"
    clear_ddos_ancpv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-ancpv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ancpv6 aggregate statistics"
    clear_ddos_ancpv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ancpv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ancpv6 aggregate states"
    clear_ddos_ancpv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ancpv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ancpv6 aggregate culprit-flows"
    clear_ddos_ancpv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ospfv3v6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ospfv3v6 statistics"
    clear_ddos_ospfv3v6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ospfv3v6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ospfv3v6 states"
    clear_ddos_ospfv3v6_states => $NO_ARGS,

    ## Method : <clear-ddos-ospfv3v6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ospfv3v6 culprit-flows"
    clear_ddos_ospfv3v6_flows => $NO_ARGS,

    ## Method : <clear-ddos-ospfv3v6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ospfv3v6 aggregate statistics"
    clear_ddos_ospfv3v6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ospfv3v6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ospfv3v6 aggregate states"
    clear_ddos_ospfv3v6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ospfv3v6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ospfv3v6 aggregate culprit-flows"
    clear_ddos_ospfv3v6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-lacp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lacp statistics"
    clear_ddos_lacp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-lacp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lacp states"
    clear_ddos_lacp_states => $NO_ARGS,

    ## Method : <clear-ddos-lacp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lacp culprit-flows"
    clear_ddos_lacp_flows => $NO_ARGS,

    ## Method : <clear-ddos-lacp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lacp aggregate statistics"
    clear_ddos_lacp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-lacp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lacp aggregate states"
    clear_ddos_lacp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-lacp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lacp aggregate culprit-flows"
    clear_ddos_lacp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-stp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols stp statistics"
    clear_ddos_stp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-stp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols stp states"
    clear_ddos_stp_states => $NO_ARGS,

    ## Method : <clear-ddos-stp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols stp culprit-flows"
    clear_ddos_stp_flows => $NO_ARGS,

    ## Method : <clear-ddos-stp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols stp aggregate statistics"
    clear_ddos_stp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-stp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols stp aggregate states"
    clear_ddos_stp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-stp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols stp aggregate culprit-flows"
    clear_ddos_stp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-esmc-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols esmc statistics"
    clear_ddos_esmc_statistics => $NO_ARGS,

    ## Method : <clear-ddos-esmc-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols esmc states"
    clear_ddos_esmc_states => $NO_ARGS,

    ## Method : <clear-ddos-esmc-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols esmc culprit-flows"
    clear_ddos_esmc_flows => $NO_ARGS,

    ## Method : <clear-ddos-esmc-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols esmc aggregate statistics"
    clear_ddos_esmc_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-esmc-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols esmc aggregate states"
    clear_ddos_esmc_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-esmc-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols esmc aggregate culprit-flows"
    clear_ddos_esmc_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-oam-lfm-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols oam-lfm statistics"
    clear_ddos_oam_lfm_statistics => $NO_ARGS,

    ## Method : <clear-ddos-oam-lfm-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols oam-lfm states"
    clear_ddos_oam_lfm_states => $NO_ARGS,

    ## Method : <clear-ddos-oam-lfm-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols oam-lfm culprit-flows"
    clear_ddos_oam_lfm_flows => $NO_ARGS,

    ## Method : <clear-ddos-oam-lfm-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols oam-lfm aggregate statistics"
    clear_ddos_oam_lfm_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-oam-lfm-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols oam-lfm aggregate states"
    clear_ddos_oam_lfm_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-oam-lfm-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols oam-lfm aggregate culprit-flows"
    clear_ddos_oam_lfm_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-eoam-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols eoam statistics"
    clear_ddos_eoam_statistics => $NO_ARGS,

    ## Method : <clear-ddos-eoam-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols eoam states"
    clear_ddos_eoam_states => $NO_ARGS,

    ## Method : <clear-ddos-eoam-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols eoam culprit-flows"
    clear_ddos_eoam_flows => $NO_ARGS,

    ## Method : <clear-ddos-eoam-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols eoam aggregate statistics"
    clear_ddos_eoam_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-eoam-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols eoam aggregate states"
    clear_ddos_eoam_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-eoam-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols eoam aggregate culprit-flows"
    clear_ddos_eoam_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-lldp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lldp statistics"
    clear_ddos_lldp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-lldp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lldp states"
    clear_ddos_lldp_states => $NO_ARGS,

    ## Method : <clear-ddos-lldp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lldp culprit-flows"
    clear_ddos_lldp_flows => $NO_ARGS,

    ## Method : <clear-ddos-lldp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lldp aggregate statistics"
    clear_ddos_lldp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-lldp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lldp aggregate states"
    clear_ddos_lldp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-lldp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols lldp aggregate culprit-flows"
    clear_ddos_lldp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-mvrp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mvrp statistics"
    clear_ddos_mvrp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-mvrp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mvrp states"
    clear_ddos_mvrp_states => $NO_ARGS,

    ## Method : <clear-ddos-mvrp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mvrp culprit-flows"
    clear_ddos_mvrp_flows => $NO_ARGS,

    ## Method : <clear-ddos-mvrp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mvrp aggregate statistics"
    clear_ddos_mvrp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-mvrp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mvrp aggregate states"
    clear_ddos_mvrp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-mvrp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mvrp aggregate culprit-flows"
    clear_ddos_mvrp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-pmvrp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pmvrp statistics"
    clear_ddos_pmvrp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pmvrp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pmvrp states"
    clear_ddos_pmvrp_states => $NO_ARGS,

    ## Method : <clear-ddos-pmvrp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pmvrp culprit-flows"
    clear_ddos_pmvrp_flows => $NO_ARGS,

    ## Method : <clear-ddos-pmvrp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pmvrp aggregate statistics"
    clear_ddos_pmvrp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pmvrp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pmvrp aggregate states"
    clear_ddos_pmvrp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-pmvrp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pmvrp aggregate culprit-flows"
    clear_ddos_pmvrp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-arp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols arp statistics"
    clear_ddos_arp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-arp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols arp states"
    clear_ddos_arp_states => $NO_ARGS,

    ## Method : <clear-ddos-arp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols arp culprit-flows"
    clear_ddos_arp_flows => $NO_ARGS,

    ## Method : <clear-ddos-arp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols arp aggregate statistics"
    clear_ddos_arp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-arp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols arp aggregate states"
    clear_ddos_arp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-arp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols arp aggregate culprit-flows"
    clear_ddos_arp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-pvstp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pvstp statistics"
    clear_ddos_pvstp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pvstp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pvstp states"
    clear_ddos_pvstp_states => $NO_ARGS,

    ## Method : <clear-ddos-pvstp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pvstp culprit-flows"
    clear_ddos_pvstp_flows => $NO_ARGS,

    ## Method : <clear-ddos-pvstp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pvstp aggregate statistics"
    clear_ddos_pvstp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pvstp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pvstp aggregate states"
    clear_ddos_pvstp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-pvstp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pvstp aggregate culprit-flows"
    clear_ddos_pvstp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-isis-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols isis statistics"
    clear_ddos_isis_statistics => $NO_ARGS,

    ## Method : <clear-ddos-isis-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols isis states"
    clear_ddos_isis_states => $NO_ARGS,

    ## Method : <clear-ddos-isis-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols isis culprit-flows"
    clear_ddos_isis_flows => $NO_ARGS,

    ## Method : <clear-ddos-isis-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols isis aggregate statistics"
    clear_ddos_isis_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-isis-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols isis aggregate states"
    clear_ddos_isis_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-isis-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols isis aggregate culprit-flows"
    clear_ddos_isis_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-pos-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pos statistics"
    clear_ddos_pos_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pos-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pos states"
    clear_ddos_pos_states => $NO_ARGS,

    ## Method : <clear-ddos-pos-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pos culprit-flows"
    clear_ddos_pos_flows => $NO_ARGS,

    ## Method : <clear-ddos-pos-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pos aggregate statistics"
    clear_ddos_pos_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pos-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pos aggregate states"
    clear_ddos_pos_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-pos-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pos aggregate culprit-flows"
    clear_ddos_pos_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-mlp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mlp statistics"
    clear_ddos_mlp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-mlp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mlp states"
    clear_ddos_mlp_states => $NO_ARGS,

    ## Method : <clear-ddos-mlp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mlp culprit-flows"
    clear_ddos_mlp_flows => $NO_ARGS,

    ## Method : <clear-ddos-mlp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mlp aggregate statistics"
    clear_ddos_mlp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-mlp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mlp aggregate states"
    clear_ddos_mlp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-mlp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mlp aggregate culprit-flows"
    clear_ddos_mlp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-mlp-unclass-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mlp unclassified statistics"
    clear_ddos_mlp_unclass_statistics => $NO_ARGS,

    ## Method : <clear-ddos-mlp-unclass-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mlp unclassified states"
    clear_ddos_mlp_unclass_states => $NO_ARGS,

    ## Method : <clear-ddos-mlp-unclass-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mlp unclassified culprit-flows"
    clear_ddos_mlp_unclass_flows => $NO_ARGS,

    ## Method : <clear-ddos-mlp-packets-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mlp packets statistics"
    clear_ddos_mlp_packets_statistics => $NO_ARGS,

    ## Method : <clear-ddos-mlp-packets-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mlp packets states"
    clear_ddos_mlp_packets_states => $NO_ARGS,

    ## Method : <clear-ddos-mlp-packets-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mlp packets culprit-flows"
    clear_ddos_mlp_packets_flows => $NO_ARGS,

    ## Method : <clear-ddos-mlp-aging-exc-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mlp aging-exception statistics"
    clear_ddos_mlp_aging_exc_statistics => $NO_ARGS,

    ## Method : <clear-ddos-mlp-aging-exc-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mlp aging-exception states"
    clear_ddos_mlp_aging_exc_states => $NO_ARGS,

    ## Method : <clear-ddos-mlp-aging-exc-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mlp aging-exception culprit-flows"
    clear_ddos_mlp_aging_exc_flows => $NO_ARGS,

    ## Method : <clear-ddos-jfm-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols jfm statistics"
    clear_ddos_jfm_statistics => $NO_ARGS,

    ## Method : <clear-ddos-jfm-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols jfm states"
    clear_ddos_jfm_states => $NO_ARGS,

    ## Method : <clear-ddos-jfm-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols jfm culprit-flows"
    clear_ddos_jfm_flows => $NO_ARGS,

    ## Method : <clear-ddos-jfm-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols jfm aggregate statistics"
    clear_ddos_jfm_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-jfm-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols jfm aggregate states"
    clear_ddos_jfm_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-jfm-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols jfm aggregate culprit-flows"
    clear_ddos_jfm_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-atm-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols atm statistics"
    clear_ddos_atm_statistics => $NO_ARGS,

    ## Method : <clear-ddos-atm-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols atm states"
    clear_ddos_atm_states => $NO_ARGS,

    ## Method : <clear-ddos-atm-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols atm culprit-flows"
    clear_ddos_atm_flows => $NO_ARGS,

    ## Method : <clear-ddos-atm-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols atm aggregate statistics"
    clear_ddos_atm_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-atm-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols atm aggregate states"
    clear_ddos_atm_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-atm-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols atm aggregate culprit-flows"
    clear_ddos_atm_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-pfe-alive-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pfe-alive statistics"
    clear_ddos_pfe_alive_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pfe-alive-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pfe-alive states"
    clear_ddos_pfe_alive_states => $NO_ARGS,

    ## Method : <clear-ddos-pfe-alive-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pfe-alive culprit-flows"
    clear_ddos_pfe_alive_flows => $NO_ARGS,

    ## Method : <clear-ddos-pfe-alive-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pfe-alive aggregate statistics"
    clear_ddos_pfe_alive_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pfe-alive-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pfe-alive aggregate states"
    clear_ddos_pfe_alive_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-pfe-alive-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pfe-alive aggregate culprit-flows"
    clear_ddos_pfe_alive_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ttl-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ttl statistics"
    clear_ddos_ttl_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ttl-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ttl states"
    clear_ddos_ttl_states => $NO_ARGS,

    ## Method : <clear-ddos-ttl-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ttl culprit-flows"
    clear_ddos_ttl_flows => $NO_ARGS,

    ## Method : <clear-ddos-ttl-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ttl aggregate statistics"
    clear_ddos_ttl_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ttl-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ttl aggregate states"
    clear_ddos_ttl_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ttl-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ttl aggregate culprit-flows"
    clear_ddos_ttl_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ip-opt-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-options statistics"
    clear_ddos_ip_opt_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ip-opt-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-options states"
    clear_ddos_ip_opt_states => $NO_ARGS,

    ## Method : <clear-ddos-ip-opt-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-options culprit-flows"
    clear_ddos_ip_opt_flows => $NO_ARGS,

    ## Method : <clear-ddos-ip-opt-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-options aggregate statistics"
    clear_ddos_ip_opt_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ip-opt-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-options aggregate states"
    clear_ddos_ip_opt_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ip-opt-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-options aggregate culprit-flows"
    clear_ddos_ip_opt_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ip-opt-unclass-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-options unclassified statistics"
    clear_ddos_ip_opt_unclass_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ip-opt-unclass-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-options unclassified states"
    clear_ddos_ip_opt_unclass_states => $NO_ARGS,

    ## Method : <clear-ddos-ip-opt-unclass-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-options unclassified culprit-flows"
    clear_ddos_ip_opt_unclass_flows => $NO_ARGS,

    ## Method : <clear-ddos-ip-opt-rt-alert-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-options router-alert statistics"
    clear_ddos_ip_opt_rt_alert_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ip-opt-rt-alert-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-options router-alert states"
    clear_ddos_ip_opt_rt_alert_states => $NO_ARGS,

    ## Method : <clear-ddos-ip-opt-rt-alert-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-options router-alert culprit-flows"
    clear_ddos_ip_opt_rt_alert_flows => $NO_ARGS,

    ## Method : <clear-ddos-ip-opt-non-v4v6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-options non-v4v6 statistics"
    clear_ddos_ip_opt_non_v4v6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ip-opt-non-v4v6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-options non-v4v6 states"
    clear_ddos_ip_opt_non_v4v6_states => $NO_ARGS,

    ## Method : <clear-ddos-ip-opt-non-v4v6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-options non-v4v6 culprit-flows"
    clear_ddos_ip_opt_non_v4v6_flows => $NO_ARGS,

    ## Method : <clear-ddos-redirect-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols redirect statistics"
    clear_ddos_redirect_statistics => $NO_ARGS,

    ## Method : <clear-ddos-redirect-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols redirect states"
    clear_ddos_redirect_states => $NO_ARGS,

    ## Method : <clear-ddos-redirect-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols redirect culprit-flows"
    clear_ddos_redirect_flows => $NO_ARGS,

    ## Method : <clear-ddos-redirect-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols redirect aggregate statistics"
    clear_ddos_redirect_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-redirect-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols redirect aggregate states"
    clear_ddos_redirect_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-redirect-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols redirect aggregate culprit-flows"
    clear_ddos_redirect_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-mac-host-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mac-host statistics"
    clear_ddos_mac_host_statistics => $NO_ARGS,

    ## Method : <clear-ddos-mac-host-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mac-host states"
    clear_ddos_mac_host_states => $NO_ARGS,

    ## Method : <clear-ddos-mac-host-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mac-host culprit-flows"
    clear_ddos_mac_host_flows => $NO_ARGS,

    ## Method : <clear-ddos-mac-host-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mac-host aggregate statistics"
    clear_ddos_mac_host_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-mac-host-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mac-host aggregate states"
    clear_ddos_mac_host_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-mac-host-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols mac-host aggregate culprit-flows"
    clear_ddos_mac_host_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-tun-frag-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tunnel-fragment statistics"
    clear_ddos_tun_frag_statistics => $NO_ARGS,

    ## Method : <clear-ddos-tun-frag-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tunnel-fragment states"
    clear_ddos_tun_frag_states => $NO_ARGS,

    ## Method : <clear-ddos-tun-frag-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tunnel-fragment culprit-flows"
    clear_ddos_tun_frag_flows => $NO_ARGS,

    ## Method : <clear-ddos-tun-frag-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tunnel-fragment aggregate statistics"
    clear_ddos_tun_frag_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-tun-frag-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tunnel-fragment aggregate states"
    clear_ddos_tun_frag_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-tun-frag-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tunnel-fragment aggregate culprit-flows"
    clear_ddos_tun_frag_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-igmp-snoop-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmp-snoop statistics"
    clear_ddos_igmp_snoop_statistics => $NO_ARGS,

    ## Method : <clear-ddos-igmp-snoop-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmp-snoop states"
    clear_ddos_igmp_snoop_states => $NO_ARGS,

    ## Method : <clear-ddos-igmp-snoop-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmp-snoop culprit-flows"
    clear_ddos_igmp_snoop_flows => $NO_ARGS,

    ## Method : <clear-ddos-igmp-snoop-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmp-snoop aggregate statistics"
    clear_ddos_igmp_snoop_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-igmp-snoop-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmp-snoop aggregate states"
    clear_ddos_igmp_snoop_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-igmp-snoop-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols igmp-snoop aggregate culprit-flows"
    clear_ddos_igmp_snoop_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-services-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols services statistics"
    clear_ddos_services_statistics => $NO_ARGS,

    ## Method : <clear-ddos-services-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols services states"
    clear_ddos_services_states => $NO_ARGS,

    ## Method : <clear-ddos-services-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols services culprit-flows"
    clear_ddos_services_flows => $NO_ARGS,

    ## Method : <clear-ddos-services-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols services aggregate statistics"
    clear_ddos_services_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-services-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols services aggregate states"
    clear_ddos_services_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-services-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols services aggregate culprit-flows"
    clear_ddos_services_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-demuxauto-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols demux-autosense statistics"
    clear_ddos_demuxauto_statistics => $NO_ARGS,

    ## Method : <clear-ddos-demuxauto-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols demux-autosense states"
    clear_ddos_demuxauto_states => $NO_ARGS,

    ## Method : <clear-ddos-demuxauto-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols demux-autosense culprit-flows"
    clear_ddos_demuxauto_flows => $NO_ARGS,

    ## Method : <clear-ddos-demuxauto-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols demux-autosense aggregate statistics"
    clear_ddos_demuxauto_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-demuxauto-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols demux-autosense aggregate states"
    clear_ddos_demuxauto_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-demuxauto-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols demux-autosense aggregate culprit-flows"
    clear_ddos_demuxauto_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-reject-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols reject statistics"
    clear_ddos_reject_statistics => $NO_ARGS,

    ## Method : <clear-ddos-reject-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols reject states"
    clear_ddos_reject_states => $NO_ARGS,

    ## Method : <clear-ddos-reject-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols reject culprit-flows"
    clear_ddos_reject_flows => $NO_ARGS,

    ## Method : <clear-ddos-reject-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols reject aggregate statistics"
    clear_ddos_reject_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-reject-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols reject aggregate states"
    clear_ddos_reject_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-reject-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols reject aggregate culprit-flows"
    clear_ddos_reject_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-rejectv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rejectv6 statistics"
    clear_ddos_rejectv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-rejectv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rejectv6 states"
    clear_ddos_rejectv6_states => $NO_ARGS,

    ## Method : <clear-ddos-rejectv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rejectv6 culprit-flows"
    clear_ddos_rejectv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-rejectv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rejectv6 aggregate statistics"
    clear_ddos_rejectv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-rejectv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rejectv6 aggregate states"
    clear_ddos_rejectv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-rejectv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols rejectv6 aggregate culprit-flows"
    clear_ddos_rejectv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-fw-host-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols firewall-host statistics"
    clear_ddos_fw_host_statistics => $NO_ARGS,

    ## Method : <clear-ddos-fw-host-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols firewall-host states"
    clear_ddos_fw_host_states => $NO_ARGS,

    ## Method : <clear-ddos-fw-host-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols firewall-host culprit-flows"
    clear_ddos_fw_host_flows => $NO_ARGS,

    ## Method : <clear-ddos-fw-host-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols firewall-host aggregate statistics"
    clear_ddos_fw_host_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-fw-host-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols firewall-host aggregate states"
    clear_ddos_fw_host_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-fw-host-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols firewall-host aggregate culprit-flows"
    clear_ddos_fw_host_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-tcp-flags-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tcp-flags statistics"
    clear_ddos_tcp_flags_statistics => $NO_ARGS,

    ## Method : <clear-ddos-tcp-flags-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tcp-flags states"
    clear_ddos_tcp_flags_states => $NO_ARGS,

    ## Method : <clear-ddos-tcp-flags-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tcp-flags culprit-flows"
    clear_ddos_tcp_flags_flows => $NO_ARGS,

    ## Method : <clear-ddos-tcp-flags-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tcp-flags aggregate statistics"
    clear_ddos_tcp_flags_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-tcp-flags-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tcp-flags aggregate states"
    clear_ddos_tcp_flags_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-tcp-flags-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tcp-flags aggregate culprit-flows"
    clear_ddos_tcp_flags_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-tcp-flags-unclass-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tcp-flags unclassified statistics"
    clear_ddos_tcp_flags_unclass_statistics => $NO_ARGS,

    ## Method : <clear-ddos-tcp-flags-unclass-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tcp-flags unclassified states"
    clear_ddos_tcp_flags_unclass_states => $NO_ARGS,

    ## Method : <clear-ddos-tcp-flags-unclass-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tcp-flags unclassified culprit-flows"
    clear_ddos_tcp_flags_unclass_flows => $NO_ARGS,

    ## Method : <clear-ddos-tcp-flags-initial-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tcp-flags initial statistics"
    clear_ddos_tcp_flags_initial_statistics => $NO_ARGS,

    ## Method : <clear-ddos-tcp-flags-initial-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tcp-flags initial states"
    clear_ddos_tcp_flags_initial_states => $NO_ARGS,

    ## Method : <clear-ddos-tcp-flags-initial-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tcp-flags initial culprit-flows"
    clear_ddos_tcp_flags_initial_flows => $NO_ARGS,

    ## Method : <clear-ddos-tcp-flags-establish-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tcp-flags established statistics"
    clear_ddos_tcp_flags_establish_statistics => $NO_ARGS,

    ## Method : <clear-ddos-tcp-flags-establish-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tcp-flags established states"
    clear_ddos_tcp_flags_establish_states => $NO_ARGS,

    ## Method : <clear-ddos-tcp-flags-establish-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tcp-flags established culprit-flows"
    clear_ddos_tcp_flags_establish_flows => $NO_ARGS,

    ## Method : <clear-ddos-dtcp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dtcp statistics"
    clear_ddos_dtcp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dtcp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dtcp states"
    clear_ddos_dtcp_states => $NO_ARGS,

    ## Method : <clear-ddos-dtcp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dtcp culprit-flows"
    clear_ddos_dtcp_flows => $NO_ARGS,

    ## Method : <clear-ddos-dtcp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dtcp aggregate statistics"
    clear_ddos_dtcp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dtcp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dtcp aggregate states"
    clear_ddos_dtcp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-dtcp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dtcp aggregate culprit-flows"
    clear_ddos_dtcp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-radius-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols radius statistics"
    clear_ddos_radius_statistics => $NO_ARGS,

    ## Method : <clear-ddos-radius-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols radius states"
    clear_ddos_radius_states => $NO_ARGS,

    ## Method : <clear-ddos-radius-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols radius culprit-flows"
    clear_ddos_radius_flows => $NO_ARGS,

    ## Method : <clear-ddos-radius-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols radius aggregate statistics"
    clear_ddos_radius_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-radius-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols radius aggregate states"
    clear_ddos_radius_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-radius-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols radius aggregate culprit-flows"
    clear_ddos_radius_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-radius-server-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols radius server statistics"
    clear_ddos_radius_server_statistics => $NO_ARGS,

    ## Method : <clear-ddos-radius-server-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols radius server states"
    clear_ddos_radius_server_states => $NO_ARGS,

    ## Method : <clear-ddos-radius-server-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols radius server culprit-flows"
    clear_ddos_radius_server_flows => $NO_ARGS,

    ## Method : <clear-ddos-radius-account-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols radius accounting statistics"
    clear_ddos_radius_account_statistics => $NO_ARGS,

    ## Method : <clear-ddos-radius-account-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols radius accounting states"
    clear_ddos_radius_account_states => $NO_ARGS,

    ## Method : <clear-ddos-radius-account-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols radius accounting culprit-flows"
    clear_ddos_radius_account_flows => $NO_ARGS,

    ## Method : <clear-ddos-radius-auth-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols radius authorization statistics"
    clear_ddos_radius_auth_statistics => $NO_ARGS,

    ## Method : <clear-ddos-radius-auth-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols radius authorization states"
    clear_ddos_radius_auth_states => $NO_ARGS,

    ## Method : <clear-ddos-radius-auth-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols radius authorization culprit-flows"
    clear_ddos_radius_auth_flows => $NO_ARGS,

    ## Method : <clear-ddos-ntp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ntp statistics"
    clear_ddos_ntp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ntp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ntp states"
    clear_ddos_ntp_states => $NO_ARGS,

    ## Method : <clear-ddos-ntp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ntp culprit-flows"
    clear_ddos_ntp_flows => $NO_ARGS,

    ## Method : <clear-ddos-ntp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ntp aggregate statistics"
    clear_ddos_ntp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ntp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ntp aggregate states"
    clear_ddos_ntp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ntp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ntp aggregate culprit-flows"
    clear_ddos_ntp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-tacacs-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tacacs statistics"
    clear_ddos_tacacs_statistics => $NO_ARGS,

    ## Method : <clear-ddos-tacacs-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tacacs states"
    clear_ddos_tacacs_states => $NO_ARGS,

    ## Method : <clear-ddos-tacacs-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tacacs culprit-flows"
    clear_ddos_tacacs_flows => $NO_ARGS,

    ## Method : <clear-ddos-tacacs-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tacacs aggregate statistics"
    clear_ddos_tacacs_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-tacacs-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tacacs aggregate states"
    clear_ddos_tacacs_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-tacacs-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols tacacs aggregate culprit-flows"
    clear_ddos_tacacs_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-dns-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dns statistics"
    clear_ddos_dns_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dns-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dns states"
    clear_ddos_dns_states => $NO_ARGS,

    ## Method : <clear-ddos-dns-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dns culprit-flows"
    clear_ddos_dns_flows => $NO_ARGS,

    ## Method : <clear-ddos-dns-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dns aggregate statistics"
    clear_ddos_dns_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-dns-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dns aggregate states"
    clear_ddos_dns_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-dns-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols dns aggregate culprit-flows"
    clear_ddos_dns_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-diameter-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols diameter statistics"
    clear_ddos_diameter_statistics => $NO_ARGS,

    ## Method : <clear-ddos-diameter-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols diameter states"
    clear_ddos_diameter_states => $NO_ARGS,

    ## Method : <clear-ddos-diameter-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols diameter culprit-flows"
    clear_ddos_diameter_flows => $NO_ARGS,

    ## Method : <clear-ddos-diameter-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols diameter aggregate statistics"
    clear_ddos_diameter_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-diameter-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols diameter aggregate states"
    clear_ddos_diameter_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-diameter-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols diameter aggregate culprit-flows"
    clear_ddos_diameter_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ip-frag-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-fragments statistics"
    clear_ddos_ip_frag_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ip-frag-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-fragments states"
    clear_ddos_ip_frag_states => $NO_ARGS,

    ## Method : <clear-ddos-ip-frag-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-fragments culprit-flows"
    clear_ddos_ip_frag_flows => $NO_ARGS,

    ## Method : <clear-ddos-ip-frag-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-fragments aggregate statistics"
    clear_ddos_ip_frag_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ip-frag-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-fragments aggregate states"
    clear_ddos_ip_frag_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ip-frag-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-fragments aggregate culprit-flows"
    clear_ddos_ip_frag_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ip-frag-first-frag-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-fragments first-fragment statistics"
    clear_ddos_ip_frag_first_frag_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ip-frag-first-frag-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-fragments first-fragment states"
    clear_ddos_ip_frag_first_frag_states => $NO_ARGS,

    ## Method : <clear-ddos-ip-frag-first-frag-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-fragments first-fragment culprit-flows"
    clear_ddos_ip_frag_first_frag_flows => $NO_ARGS,

    ## Method : <clear-ddos-ip-frag-trail-frag-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-fragments trail-fragment statistics"
    clear_ddos_ip_frag_trail_frag_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ip-frag-trail-frag-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-fragments trail-fragment states"
    clear_ddos_ip_frag_trail_frag_states => $NO_ARGS,

    ## Method : <clear-ddos-ip-frag-trail-frag-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ip-fragments trail-fragment culprit-flows"
    clear_ddos_ip_frag_trail_frag_flows => $NO_ARGS,

    ## Method : <clear-ddos-l2tp-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols l2tp statistics"
    clear_ddos_l2tp_statistics => $NO_ARGS,

    ## Method : <clear-ddos-l2tp-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols l2tp states"
    clear_ddos_l2tp_states => $NO_ARGS,

    ## Method : <clear-ddos-l2tp-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols l2tp culprit-flows"
    clear_ddos_l2tp_flows => $NO_ARGS,

    ## Method : <clear-ddos-l2tp-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols l2tp aggregate statistics"
    clear_ddos_l2tp_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-l2tp-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols l2tp aggregate states"
    clear_ddos_l2tp_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-l2tp-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols l2tp aggregate culprit-flows"
    clear_ddos_l2tp_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-gre-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols gre statistics"
    clear_ddos_gre_statistics => $NO_ARGS,

    ## Method : <clear-ddos-gre-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols gre states"
    clear_ddos_gre_states => $NO_ARGS,

    ## Method : <clear-ddos-gre-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols gre culprit-flows"
    clear_ddos_gre_flows => $NO_ARGS,

    ## Method : <clear-ddos-gre-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols gre aggregate statistics"
    clear_ddos_gre_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-gre-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols gre aggregate states"
    clear_ddos_gre_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-gre-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols gre aggregate culprit-flows"
    clear_ddos_gre_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-pimv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pimv6 statistics"
    clear_ddos_pimv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pimv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pimv6 states"
    clear_ddos_pimv6_states => $NO_ARGS,

    ## Method : <clear-ddos-pimv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pimv6 culprit-flows"
    clear_ddos_pimv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-pimv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pimv6 aggregate statistics"
    clear_ddos_pimv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-pimv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pimv6 aggregate states"
    clear_ddos_pimv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-pimv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols pimv6 aggregate culprit-flows"
    clear_ddos_pimv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-icmpv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols icmpv6 statistics"
    clear_ddos_icmpv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-icmpv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols icmpv6 states"
    clear_ddos_icmpv6_states => $NO_ARGS,

    ## Method : <clear-ddos-icmpv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols icmpv6 culprit-flows"
    clear_ddos_icmpv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-icmpv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols icmpv6 aggregate statistics"
    clear_ddos_icmpv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-icmpv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols icmpv6 aggregate states"
    clear_ddos_icmpv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-icmpv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols icmpv6 aggregate culprit-flows"
    clear_ddos_icmpv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-ndpv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ndpv6 statistics"
    clear_ddos_ndpv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ndpv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ndpv6 states"
    clear_ddos_ndpv6_states => $NO_ARGS,

    ## Method : <clear-ddos-ndpv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ndpv6 culprit-flows"
    clear_ddos_ndpv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-ndpv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ndpv6 aggregate statistics"
    clear_ddos_ndpv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-ndpv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ndpv6 aggregate states"
    clear_ddos_ndpv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-ndpv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols ndpv6 aggregate culprit-flows"
    clear_ddos_ndpv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-sample-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample statistics"
    clear_ddos_sample_statistics => $NO_ARGS,

    ## Method : <clear-ddos-sample-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample states"
    clear_ddos_sample_states => $NO_ARGS,

    ## Method : <clear-ddos-sample-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample culprit-flows"
    clear_ddos_sample_flows => $NO_ARGS,

    ## Method : <clear-ddos-sample-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample aggregate statistics"
    clear_ddos_sample_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-sample-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample aggregate states"
    clear_ddos_sample_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-sample-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample aggregate culprit-flows"
    clear_ddos_sample_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-sample-syslog-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample syslog statistics"
    clear_ddos_sample_syslog_statistics => $NO_ARGS,

    ## Method : <clear-ddos-sample-syslog-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample syslog states"
    clear_ddos_sample_syslog_states => $NO_ARGS,

    ## Method : <clear-ddos-sample-syslog-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample syslog culprit-flows"
    clear_ddos_sample_syslog_flows => $NO_ARGS,

    ## Method : <clear-ddos-sample-host-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample host statistics"
    clear_ddos_sample_host_statistics => $NO_ARGS,

    ## Method : <clear-ddos-sample-host-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample host states"
    clear_ddos_sample_host_states => $NO_ARGS,

    ## Method : <clear-ddos-sample-host-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample host culprit-flows"
    clear_ddos_sample_host_flows => $NO_ARGS,

    ## Method : <clear-ddos-sample-pfe-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample pfe statistics"
    clear_ddos_sample_pfe_statistics => $NO_ARGS,

    ## Method : <clear-ddos-sample-pfe-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample pfe states"
    clear_ddos_sample_pfe_states => $NO_ARGS,

    ## Method : <clear-ddos-sample-pfe-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample pfe culprit-flows"
    clear_ddos_sample_pfe_flows => $NO_ARGS,

    ## Method : <clear-ddos-sample-tap-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample tap statistics"
    clear_ddos_sample_tap_statistics => $NO_ARGS,

    ## Method : <clear-ddos-sample-tap-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample tap states"
    clear_ddos_sample_tap_states => $NO_ARGS,

    ## Method : <clear-ddos-sample-tap-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols sample tap culprit-flows"
    clear_ddos_sample_tap_flows => $NO_ARGS,

    ## Method : <clear-ddos-fab-probe-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols fab-probe statistics"
    clear_ddos_fab_probe_statistics => $NO_ARGS,

    ## Method : <clear-ddos-fab-probe-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols fab-probe states"
    clear_ddos_fab_probe_states => $NO_ARGS,

    ## Method : <clear-ddos-fab-probe-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols fab-probe culprit-flows"
    clear_ddos_fab_probe_flows => $NO_ARGS,

    ## Method : <clear-ddos-fab-probe-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols fab-probe aggregate statistics"
    clear_ddos_fab_probe_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-fab-probe-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols fab-probe aggregate states"
    clear_ddos_fab_probe_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-fab-probe-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols fab-probe aggregate culprit-flows"
    clear_ddos_fab_probe_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-uncls-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified statistics"
    clear_ddos_uncls_statistics => $NO_ARGS,

    ## Method : <clear-ddos-uncls-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified states"
    clear_ddos_uncls_states => $NO_ARGS,

    ## Method : <clear-ddos-uncls-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified culprit-flows"
    clear_ddos_uncls_flows => $NO_ARGS,

    ## Method : <clear-ddos-uncls-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified aggregate statistics"
    clear_ddos_uncls_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-uncls-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified aggregate states"
    clear_ddos_uncls_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-uncls-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified aggregate culprit-flows"
    clear_ddos_uncls_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-uncls-other-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified other statistics"
    clear_ddos_uncls_other_statistics => $NO_ARGS,

    ## Method : <clear-ddos-uncls-other-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified other states"
    clear_ddos_uncls_other_states => $NO_ARGS,

    ## Method : <clear-ddos-uncls-other-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified other culprit-flows"
    clear_ddos_uncls_other_flows => $NO_ARGS,

    ## Method : <clear-ddos-uncls-resolve-v4-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified resolve-v4 statistics"
    clear_ddos_uncls_resolve_v4_statistics => $NO_ARGS,

    ## Method : <clear-ddos-uncls-resolve-v4-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified resolve-v4 states"
    clear_ddos_uncls_resolve_v4_states => $NO_ARGS,

    ## Method : <clear-ddos-uncls-resolve-v4-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified resolve-v4 culprit-flows"
    clear_ddos_uncls_resolve_v4_flows => $NO_ARGS,

    ## Method : <clear-ddos-uncls-resolve-v6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified resolve-v6 statistics"
    clear_ddos_uncls_resolve_v6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-uncls-resolve-v6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified resolve-v6 states"
    clear_ddos_uncls_resolve_v6_states => $NO_ARGS,

    ## Method : <clear-ddos-uncls-resolve-v6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified resolve-v6 culprit-flows"
    clear_ddos_uncls_resolve_v6_flows => $NO_ARGS,

    ## Method : <clear-ddos-uncls-control-v4-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified control-v4 statistics"
    clear_ddos_uncls_control_v4_statistics => $NO_ARGS,

    ## Method : <clear-ddos-uncls-control-v4-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified control-v4 states"
    clear_ddos_uncls_control_v4_states => $NO_ARGS,

    ## Method : <clear-ddos-uncls-control-v4-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified control-v4 culprit-flows"
    clear_ddos_uncls_control_v4_flows => $NO_ARGS,

    ## Method : <clear-ddos-uncls-control-v6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified control-v6 statistics"
    clear_ddos_uncls_control_v6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-uncls-control-v6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified control-v6 states"
    clear_ddos_uncls_control_v6_states => $NO_ARGS,

    ## Method : <clear-ddos-uncls-control-v6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified control-v6 culprit-flows"
    clear_ddos_uncls_control_v6_flows => $NO_ARGS,

    ## Method : <clear-ddos-uncls-host-rt-v4-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified host-route-v4 statistics"
    clear_ddos_uncls_host_rt_v4_statistics => $NO_ARGS,

    ## Method : <clear-ddos-uncls-host-rt-v4-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified host-route-v4 states"
    clear_ddos_uncls_host_rt_v4_states => $NO_ARGS,

    ## Method : <clear-ddos-uncls-host-rt-v4-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified host-route-v4 culprit-flows"
    clear_ddos_uncls_host_rt_v4_flows => $NO_ARGS,

    ## Method : <clear-ddos-uncls-host-rt-v6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified host-route-v6 statistics"
    clear_ddos_uncls_host_rt_v6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-uncls-host-rt-v6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified host-route-v6 states"
    clear_ddos_uncls_host_rt_v6_states => $NO_ARGS,

    ## Method : <clear-ddos-uncls-host-rt-v6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified host-route-v6 culprit-flows"
    clear_ddos_uncls_host_rt_v6_flows => $NO_ARGS,

    ## Method : <clear-ddos-uncls-filter-v4-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified filter-v4 statistics"
    clear_ddos_uncls_filter_v4_statistics => $NO_ARGS,

    ## Method : <clear-ddos-uncls-filter-v4-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified filter-v4 states"
    clear_ddos_uncls_filter_v4_states => $NO_ARGS,

    ## Method : <clear-ddos-uncls-filter-v4-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified filter-v4 culprit-flows"
    clear_ddos_uncls_filter_v4_flows => $NO_ARGS,

    ## Method : <clear-ddos-uncls-filter-v6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified filter-v6 statistics"
    clear_ddos_uncls_filter_v6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-uncls-filter-v6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified filter-v6 states"
    clear_ddos_uncls_filter_v6_states => $NO_ARGS,

    ## Method : <clear-ddos-uncls-filter-v6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified filter-v6 culprit-flows"
    clear_ddos_uncls_filter_v6_flows => $NO_ARGS,

    ## Method : <clear-ddos-uncls-control-l2-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified control-layer2 statistics"
    clear_ddos_uncls_control_l2_statistics => $NO_ARGS,

    ## Method : <clear-ddos-uncls-control-l2-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified control-layer2 states"
    clear_ddos_uncls_control_l2_states => $NO_ARGS,

    ## Method : <clear-ddos-uncls-control-l2-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified control-layer2 culprit-flows"
    clear_ddos_uncls_control_l2_flows => $NO_ARGS,

    ## Method : <clear-ddos-uncls-fw-host-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified fw-host statistics"
    clear_ddos_uncls_fw_host_statistics => $NO_ARGS,

    ## Method : <clear-ddos-uncls-fw-host-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified fw-host states"
    clear_ddos_uncls_fw_host_states => $NO_ARGS,

    ## Method : <clear-ddos-uncls-fw-host-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified fw-host culprit-flows"
    clear_ddos_uncls_fw_host_flows => $NO_ARGS,

    ## Method : <clear-ddos-uncls-mcast-copy-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified mcast-copy statistics"
    clear_ddos_uncls_mcast_copy_statistics => $NO_ARGS,

    ## Method : <clear-ddos-uncls-mcast-copy-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified mcast-copy states"
    clear_ddos_uncls_mcast_copy_states => $NO_ARGS,

    ## Method : <clear-ddos-uncls-mcast-copy-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols unclassified mcast-copy culprit-flows"
    clear_ddos_uncls_mcast_copy_flows => $NO_ARGS,

    ## Method : <clear-ddos-l2pt-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols l2pt statistics"
    clear_ddos_l2pt_statistics => $NO_ARGS,

    ## Method : <clear-ddos-l2pt-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols l2pt states"
    clear_ddos_l2pt_states => $NO_ARGS,

    ## Method : <clear-ddos-l2pt-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols l2pt culprit-flows"
    clear_ddos_l2pt_flows => $NO_ARGS,

    ## Method : <clear-ddos-l2pt-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols l2pt aggregate statistics"
    clear_ddos_l2pt_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-l2pt-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols l2pt aggregate states"
    clear_ddos_l2pt_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-l2pt-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols l2pt aggregate culprit-flows"
    clear_ddos_l2pt_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-keepalive-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols keepalive statistics"
    clear_ddos_keepalive_statistics => $NO_ARGS,

    ## Method : <clear-ddos-keepalive-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols keepalive states"
    clear_ddos_keepalive_states => $NO_ARGS,

    ## Method : <clear-ddos-keepalive-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols keepalive culprit-flows"
    clear_ddos_keepalive_flows => $NO_ARGS,

    ## Method : <clear-ddos-keepalive-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols keepalive aggregate statistics"
    clear_ddos_keepalive_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-keepalive-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols keepalive aggregate states"
    clear_ddos_keepalive_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-keepalive-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols keepalive aggregate culprit-flows"
    clear_ddos_keepalive_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-inline-ka-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols inline-ka statistics"
    clear_ddos_inline_ka_statistics => $NO_ARGS,

    ## Method : <clear-ddos-inline-ka-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols inline-ka states"
    clear_ddos_inline_ka_states => $NO_ARGS,

    ## Method : <clear-ddos-inline-ka-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols inline-ka culprit-flows"
    clear_ddos_inline_ka_flows => $NO_ARGS,

    ## Method : <clear-ddos-inline-ka-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols inline-ka aggregate statistics"
    clear_ddos_inline_ka_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-inline-ka-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols inline-ka aggregate states"
    clear_ddos_inline_ka_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-inline-ka-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols inline-ka aggregate culprit-flows"
    clear_ddos_inline_ka_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-inline-svcs-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols inline-svcs statistics"
    clear_ddos_inline_svcs_statistics => $NO_ARGS,

    ## Method : <clear-ddos-inline-svcs-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols inline-svcs states"
    clear_ddos_inline_svcs_states => $NO_ARGS,

    ## Method : <clear-ddos-inline-svcs-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols inline-svcs culprit-flows"
    clear_ddos_inline_svcs_flows => $NO_ARGS,

    ## Method : <clear-ddos-inline-svcs-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols inline-svcs aggregate statistics"
    clear_ddos_inline_svcs_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-inline-svcs-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols inline-svcs aggregate states"
    clear_ddos_inline_svcs_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-inline-svcs-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols inline-svcs aggregate culprit-flows"
    clear_ddos_inline_svcs_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-frame-relay-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols frame-relay statistics"
    clear_ddos_frame_relay_statistics => $NO_ARGS,

    ## Method : <clear-ddos-frame-relay-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols frame-relay states"
    clear_ddos_frame_relay_states => $NO_ARGS,

    ## Method : <clear-ddos-frame-relay-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols frame-relay culprit-flows"
    clear_ddos_frame_relay_flows => $NO_ARGS,

    ## Method : <clear-ddos-frame-relay-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols frame-relay aggregate statistics"
    clear_ddos_frame_relay_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-frame-relay-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols frame-relay aggregate states"
    clear_ddos_frame_relay_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-frame-relay-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols frame-relay aggregate culprit-flows"
    clear_ddos_frame_relay_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-frame-relay-frf15-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols frame-relay frf15 statistics"
    clear_ddos_frame_relay_frf15_statistics => $NO_ARGS,

    ## Method : <clear-ddos-frame-relay-frf15-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols frame-relay frf15 states"
    clear_ddos_frame_relay_frf15_states => $NO_ARGS,

    ## Method : <clear-ddos-frame-relay-frf15-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols frame-relay frf15 culprit-flows"
    clear_ddos_frame_relay_frf15_flows => $NO_ARGS,

    ## Method : <clear-ddos-frame-relay-frf16-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols frame-relay frf16 statistics"
    clear_ddos_frame_relay_frf16_statistics => $NO_ARGS,

    ## Method : <clear-ddos-frame-relay-frf16-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols frame-relay frf16 states"
    clear_ddos_frame_relay_frf16_states => $NO_ARGS,

    ## Method : <clear-ddos-frame-relay-frf16-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols frame-relay frf16 culprit-flows"
    clear_ddos_frame_relay_frf16_flows => $NO_ARGS,

    ## Method : <clear-ddos-amtv4-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols amtv4 statistics"
    clear_ddos_amtv4_statistics => $NO_ARGS,

    ## Method : <clear-ddos-amtv4-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols amtv4 states"
    clear_ddos_amtv4_states => $NO_ARGS,

    ## Method : <clear-ddos-amtv4-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols amtv4 culprit-flows"
    clear_ddos_amtv4_flows => $NO_ARGS,

    ## Method : <clear-ddos-amtv4-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols amtv4 aggregate statistics"
    clear_ddos_amtv4_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-amtv4-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols amtv4 aggregate states"
    clear_ddos_amtv4_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-amtv4-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols amtv4 aggregate culprit-flows"
    clear_ddos_amtv4_aggregate_flows => $NO_ARGS,

    ## Method : <clear-ddos-amtv6-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols amtv6 statistics"
    clear_ddos_amtv6_statistics => $NO_ARGS,

    ## Method : <clear-ddos-amtv6-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols amtv6 states"
    clear_ddos_amtv6_states => $NO_ARGS,

    ## Method : <clear-ddos-amtv6-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols amtv6 culprit-flows"
    clear_ddos_amtv6_flows => $NO_ARGS,

    ## Method : <clear-ddos-amtv6-aggregate-statistics>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols amtv6 aggregate statistics"
    clear_ddos_amtv6_aggregate_statistics => $NO_ARGS,

    ## Method : <clear-ddos-amtv6-aggregate-states>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols amtv6 aggregate states"
    clear_ddos_amtv6_aggregate_states => $NO_ARGS,

    ## Method : <clear-ddos-amtv6-aggregate-flows>
    ## Returns: <none>
    ## Command: "clear ddos-protection protocols amtv6 aggregate culprit-flows"
    clear_ddos_amtv6_aggregate_flows => $NO_ARGS,

    ## Method : <clear-dhcp-service-statistics-information>
    ## Returns: <none>
    ## Command: "clear dhcp statistics"
    clear_dhcp_service_statistics_information => {
	interface => $STRING,
    },

    ## Method : <clear-dhcp-relay-binding-information>
    ## Returns: <none>
    ## Command: "clear dhcp relay binding"
    clear_dhcp_relay_binding_information => {
	address => $STRING,
	interfaces_wildcard => $STRING,
	interfaces_vlan => $STRING,
	all => $TOGGLE,
	routing_instance => $STRING,
	bridge_domain => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-dhcp-interface-bindings>
    ## Returns: <none>
    ## Command: "clear dhcp relay binding interface"
    clear_dhcp_interface_bindings => {
	interface_name => $STRING,
    },

    ## Method : <clear-dhcp-relay-statistics-information>
    ## Returns: <none>
    ## Command: "clear dhcp relay statistics"
    clear_dhcp_relay_statistics_information => {
	routing_instance => $STRING,
	bridge_domain => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-dhcp-server-binding-information>
    ## Returns: <none>
    ## Command: "clear dhcp server binding"
    clear_dhcp_server_binding_information => {
	address => $STRING,
	interfaces_wildcard => $STRING,
	interfaces_vlan => $STRING,
	all => $TOGGLE,
	routing_instance => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-dhcp-server-binding-interface>
    ## Returns: <none>
    ## Command: "clear dhcp server binding interface"
    clear_dhcp_server_binding_interface => {
	interface_name => $STRING,
    },

    ## Method : <clear-server-statistics-information>
    ## Returns: <none>
    ## Command: "clear dhcp server statistics"
    clear_server_statistics_information => {
	routing_instance => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-dhcpv6-service-statistics-information>
    ## Returns: <none>
    ## Command: "clear dhcpv6 statistics"
    clear_dhcpv6_service_statistics_information => {
	interface => $STRING,
    },

    ## Method : <clear-dhcpv6-relay-binding-information>
    ## Returns: <none>
    ## Command: "clear dhcpv6 relay binding"
    clear_dhcpv6_relay_binding_information => {
	address => $STRING,
	interfaces_wildcard => $STRING,
	interfaces_vlan => $STRING,
	all => $TOGGLE,
	routing_instance => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-dhcpv6-relay-binding-interface>
    ## Returns: <none>
    ## Command: "clear dhcpv6 relay binding interface"
    clear_dhcpv6_relay_binding_interface => {
	interface_name => $STRING,
    },

    ## Method : <clear-dhcpv6-relay-statistics-information>
    ## Returns: <none>
    ## Command: "clear dhcpv6 relay statistics"
    clear_dhcpv6_relay_statistics_information => {
	routing_instance => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-dhcpv6-server-binding-information>
    ## Returns: <none>
    ## Command: "clear dhcpv6 server binding"
    clear_dhcpv6_server_binding_information => {
	address => $STRING,
	interfaces_wildcard => $STRING,
	interfaces_vlan => $STRING,
	all => $TOGGLE,
	routing_instance => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-dhcpv6-server-binding-interface>
    ## Returns: <none>
    ## Command: "clear dhcpv6 server binding interface"
    clear_dhcpv6_server_binding_interface => {
	interface_name => $STRING,
    },

    ## Method : <clear-dhcpv6-server-statistics-information>
    ## Returns: <none>
    ## Command: "clear dhcpv6 server statistics"
    clear_dhcpv6_server_statistics_information => {
	routing_instance => $STRING,
	logical_system => $STRING,
    },

    ## Method : <get-services-subscriber-sessions>
    ## Returns: <packet-triggered-subscribers-information>
    ## Command: "clear services subscriber sessions"
    get_services_subscriber_sessions => {
	client_id => $STRING,
    },

    ## Method : <clear-local-policy-decision-function-statistics-interface>
    ## Returns: <none>
    ## Command: "clear services local-policy-decision-function statistics interface"
    clear_local_policy_decision_function_statistics_interface => {
	interface_name => $STRING,
    },

    ## Method : <clear-local-policy-decision-function-statistics-subscriber>
    ## Returns: <none>
    ## Command: "clear services local-policy-decision-function statistics subscriber"
    clear_local_policy_decision_function_statistics_subscriber => {
	subscriber => $STRING,
    },

    ## Method : <clear-application-aware-access-list-statistics-interface>
    ## Returns: <none>
    ## Command: "clear services application-aware-access-list statistics interface"
    clear_application_aware_access_list_statistics_interface => {
	interface_name => $STRING,
    },

    ## Method : <clear-application-aware-access-list-statistics-subscriber>
    ## Returns: <none>
    ## Command: "clear services application-aware-access-list statistics subscriber"
    clear_application_aware_access_list_statistics_subscriber => {
	subscriber => $STRING,
    },

    ## Method : <clear-twamp-information>
    ## Returns: <none>
    ## Command: "clear services rpm twamp"
    clear_twamp_information => $NO_ARGS,

    ## Method : <clear-twamp-server-information>
    ## Returns: <none>
    ## Command: "clear services rpm twamp server"
    clear_twamp_server_information => $NO_ARGS,

    ## Method : <clear-twamp-server-connection-information>
    ## Returns: <none>
    ## Command: "clear services rpm twamp server connection"
    clear_twamp_server_connection_information => {
	connection_id => $STRING,
    },

    ## Method : <clear-lacp-statistics>
    ## Returns: <none>
    ## Command: "clear lacp statistics"
    clear_lacp_statistics => $NO_ARGS,

    ## Method : <clear-lacp-interface-statistics>
    ## Returns: <none>
    ## Command: "clear lacp statistics interfaces"
    clear_lacp_interface_statistics => {
	interface_name => $STRING,
    },

    ## Method : <clear-lacp-timeouts>
    ## Returns: <none>
    ## Command: "clear lacp timeouts"
    clear_lacp_timeouts => $NO_ARGS,

    ## Method : <clear-lacp-interface-timeouts>
    ## Returns: <none>
    ## Command: "clear lacp timeouts interfaces"
    clear_lacp_interface_timeouts => {
	interface_name => $STRING,
    },

    ## Method : <clear-lfmd-statistics>
    ## Returns: <lfmd-clear-output>
    ## Command: "clear oam ethernet link-fault-management statistics"
    clear_lfmd_statistics => {
	interface_name => $STRING,
    },

    ## Method : <clear-lfmd-action-profile-statistics>
    ## Returns: <lfmd-clear-output>
    ## Command: "clear oam ethernet link-fault-management statistics action-profile"
    clear_lfmd_action_profile_statistics => {
	action_profile_name => $STRING,
    },

    ## Method : <clear-lfmd-state>
    ## Returns: <lfmd-clear-output>
    ## Command: "clear oam ethernet link-fault-management state"
    clear_lfmd_state => {
	interface_name => $STRING,
    },

    ## Method : <clear-arp-table>
    ## Returns: <clear-arp-table-results>
    ## Command: "clear arp"
    clear_arp_table => {
	hostname => $STRING,
	interface => $STRING,
	vpn => $STRING,
	logical_system => $STRING,
    },

    ## Method : <clear-interfaces-interval>
    ## Returns: <none>
    ## Command: "clear interfaces interval"
    clear_interfaces_interval => {
	interface_name => $STRING,
    },

    ## Method : <clear-interfaces-statistics>
    ## Returns: <none>
    ## Command: "clear interfaces statistics"
    clear_interfaces_statistics => {
	switch_port => $STRING,
	interface_name => $STRING,
    },

    ## Method : <clear-interfaces-statistics-all>
    ## Returns: <none>
    ## Command: "clear interfaces statistics all"
    clear_interfaces_statistics_all => $NO_ARGS,

    ## Method : <clear-interface-set-statistics>
    ## Returns: <none>
    ## Command: "clear interfaces interface-set statistics"
    clear_interface_set_statistics => {
	interface_set_name => $STRING,
    },

    ## Method : <clear-interface-set-statistics-all>
    ## Returns: <none>
    ## Command: "clear interfaces interface-set statistics all"
    clear_interface_set_statistics_all => $NO_ARGS,

    ## Method : <clear-interfaces-mac-database>
    ## Returns: <none>
    ## Command: "clear interfaces mac-database"
    clear_interfaces_mac_database => {
	interface_name => $STRING,
	mac_address => $STRING,
    },

    ## Method : <clear-interface-mac-database-statistics>
    ## Returns: <none>
    ## Command: "clear interfaces mac-database statistics"
    clear_interface_mac_database_statistics => {
	interface_name => $STRING,
    },

    ## Method : <clear-interface-mac-database-statistics-all>
    ## Returns: <none>
    ## Command: "clear interfaces mac-database statistics all"
    clear_interface_mac_database_statistics_all => $NO_ARGS,

    ## Method : <clear-interface-aggregate-fwd-options>
    ## Returns: <none>
    ## Command: "clear forwarding-options interface aggregate"
    clear_interface_aggregate_fwd_options => {
	interface_name => $STRING,
    },

    ## Method : <clear-interface-aggregate-fwd-options-all>
    ## Returns: <none>
    ## Command: "clear forwarding-options interface aggregate all"
    clear_interface_aggregate_fwd_options_all => $NO_ARGS,

    ## Method : <clear-reboot>
    ## Returns: <clear-reboot-status>
    ## Command: "clear system reboot"
    clear_reboot => {
	both_routing_engines => $TOGGLE,
    },

    ## Method : <clear-system-services-reverse-information>
    ## Returns: <none>
    ## Command: "clear system services reverse"
    clear_system_services_reverse_information => $NO_ARGS,

    ## Method : <clear-snmp-statistics>
    ## Returns: <none>
    ## Command: "clear snmp statistics"
    clear_snmp_statistics => $NO_ARGS,

    ## Method : <clear-snmp-history>
    ## Returns: <none>
    ## Command: "clear snmp history"
    clear_snmp_history => {
	all => $TOGGLE,
	index => $TOGGLE,
    },

    ## Method : <clear-vrrp-information>
    ## Returns: <vrrp-message>
    ## Command: "clear vrrp"
    clear_vrrp_information => {
	all => $TOGGLE,
    },

    ## Method : <clear-vrrp-interface-statistics>
    ## Returns: <vrrp-message>
    ## Command: "clear vrrp interface"
    clear_vrrp_interface_statistics => {
	interface_name => $STRING,
    },

    ## Method : <request-dhcp-server-reconfigure-information>
    ## Returns: <none>
    ## Command: "request dhcp server reconfigure"
    request_dhcp_server_reconfigure_information => {
	address => $STRING,
	all => $TOGGLE,
	routing_instance => $STRING,
	logical_system => $STRING,
    },

    ## Method : <request-dhcp-server-reconfigure-interface>
    ## Returns: <none>
    ## Command: "request dhcp server reconfigure interface"
    request_dhcp_server_reconfigure_interface => {
	interface_name => $STRING,
    },

    ## Method : <request-dhcpv6-server-reconfigure-information>
    ## Returns: <none>
    ## Command: "request dhcpv6 server reconfigure"
    request_dhcpv6_server_reconfigure_information => {
	address => $STRING,
	all => $TOGGLE,
	routing_instance => $STRING,
	logical_system => $STRING,
    },

    ## Method : <request-dhcpv6-server-reconfigure-interface>
    ## Returns: <none>
    ## Command: "request dhcpv6 server reconfigure interface"
    request_dhcpv6_server_reconfigure_interface => {
	interface_name => $STRING,
    },

    ## Method : <set-services-subscriber-profile>
    ## Returns: <packet-triggered-subscribers-information>
    ## Command: "request services subscriber set subscriber-profile"
    set_services_subscriber_profile => {
	client_id => $STRING,
	profile_name => $STRING,
    },

    ## Method : <clear-services-subscriber-profile>
    ## Returns: <packet-triggered-subscribers-information>
    ## Command: "request services subscriber clear subscriber-profile"
    clear_services_subscriber_profile => {
	client_id => $STRING,
    },

    ## Method : <request-static-subscribers-login>
    ## Returns: <static-subscribers-information>
    ## Command: "request services static-subscribers login"
    request_static_subscribers_login => {
	interface => $STRING,
	group => $STRING,
    },

    ## Method : <request-static-subscribers-logout>
    ## Returns: <static-subscribers-information>
    ## Command: "request services static-subscribers logout"
    request_static_subscribers_logout => {
	interface => $STRING,
	group => $STRING,
    },

    ## Method : <request-local-policy-decision-function-library-reload>
    ## Returns: nothing
    ## Command: "request services local-policy-decision-function library-reload"
    request_local_policy_decision_function_library_reload => $NO_ARGS,

    ## Method : <request-lacp-link-protection-switchover>
    ## Returns: <lacp-link-switchover>
    ## Command: "request lacp link-switchover"
    request_lacp_link_protection_switchover => {
	interface_name => $STRING,
    },

    ## Method : <request-interface-mcae-switchover>
    ## Returns: <interface-mcae-switchover>
    ## Command: "request interface mc-ae switchover"
    request_interface_mcae_switchover => {
	mcae_id => $STRING,
    },

    ## Method : <request-interface-mcae-switchover-immediate>
    ## Returns: <interface-mcae-switchover-immediate>
    ## Command: "request interface mc-ae switchover immediate"
    request_interface_mcae_switchover_immediate => {
	mcae_id => $STRING,
    },

    ## Method : <request-reboot>
    ## Returns: <request-reboot-results>
    ## Command: "request system reboot"
    request_reboot => {
	re0 => $TOGGLE,
	re1 => $TOGGLE,
	at => $STRING,
	in => $STRING,
	message => $STRING,
	power_off => $STRING,
	media => $STRING,
	slice => $STRING,
	both_routing_engines => $TOGGLE,
	other_routing_engine => $TOGGLE,
	node => $STRING,
    },

    ## Method : <request-halt>
    ## Returns: <none>
    ## Command: "request system halt"
    request_halt => {
	at => $STRING,
	in => $STRING,
	message => $STRING,
	power_off => $STRING,
	media => $STRING,
	slice => $STRING,
	both_routing_engines => $TOGGLE,
	other_routing_engine => $TOGGLE,
    },

    ## Method : <request-power-off>
    ## Returns: <none>
    ## Command: "request system power-off"
    request_power_off => {
	at => $STRING,
	in => $STRING,
	message => $STRING,
	power_off => $STRING,
	media => $STRING,
	slice => $STRING,
	both_routing_engines => $TOGGLE,
	other_routing_engine => $TOGGLE,
    },

    ## Method : <request-snapshot>
    ## Returns: <snapshot-information>
    ## Command: "request system snapshot"
    request_snapshot => {
	partition => $TOGGLE,
	factory => $TOGGLE,
	as_primary => $TOGGLE,
	swap_size => $STRING,
	config_size => $STRING,
	root_size => $STRING,
	data_size => $STRING,
	slice => $STRING,
	media => $STRING,
    },

    ## Method : <request-save-rescue-configuration>
    ## Returns: <rescue-management-results>
    ## Command: "request system configuration rescue save"
    request_save_rescue_configuration => $NO_ARGS,

    ## Method : <request-delete-rescue-configuration>
    ## Returns: <rescue-management-results>
    ## Command: "request system configuration rescue delete"
    request_delete_rescue_configuration => $NO_ARGS,

    ## Method : <request-system-storage-cleanup>
    ## Returns: <system-storage-cleanup-information>
    ## Command: "request system storage cleanup"
    request_system_storage_cleanup => {
	dry_run => $TOGGLE,
    },

    ## Method : <remove-qfabric-repository-contents>
    ## Returns: <system-storage-cleanup-information>
    ## Command: "request system storage cleanup qfabric"
    remove_qfabric_repository_contents => {
	staging_area => $TOGGLE,
	repository => $STRING,
	name_tag => $STRING,
	prune => $TOGGLE,
	dry_run => $TOGGLE,
	component => $STRING,
    },

    ## Method : <transfer-control>
    ## Returns: <transfer-control-diagnostics>
    ## Command: "request system diagnostics transfer-control"
    transfer_control => {
	operation => $STRING,
	component => $STRING,
	transfer_id => $STRING,
    },

    ## Method : <request-routing-engine-login>
    ## Returns: <none>
    ## Command: "request routing-engine login"
    request_routing_engine_login => {
	re0 => $TOGGLE,
	re1 => $TOGGLE,
	master => $TOGGLE,
	backup => $TOGGLE,
    },

    ## Method : <request-login-to-other-routing-engine>
    ## Returns: <none>
    ## Command: "request routing-engine login other-routing-engine"
    request_login_to_other_routing_engine => $NO_ARGS,

    ## Method : <request-snmp-spoof-trap>
    ## Returns: <snmp-spoof-trap-results>
    ## Command: "request snmp spoof-trap"
    request_snmp_spoof_trap => {
	trap => $STRING,
	variable_bindings => $STRING,
    },

    ## Method : <traceroute>
    ## Returns: nothing
    ## Command: "traceroute"
    traceroute => {
	gateway => $STRING,
	ttl => $STRING,
	wait => $STRING,
	no_resolve => $TOGGLE,
	source => $STRING,
	tos => $STRING,
	as_number_lookup => $TOGGLE,
	bypass_routing => $TOGGLE,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
	interface => $STRING,
	routing_instance => $STRING,
	propagate_ttl => $TOGGLE,
	host => $STRING,
	logical_system => $STRING,
    },

    ## Method : <ping>
    ## Returns: <ping-results>
    ## Command: "ping"
    ping => {
	count => $STRING,
	wait => $STRING,
	no_resolve => $TOGGLE,
	rapid => $TOGGLE,
	record_route => $TOGGLE,
	detail => $TOGGLE,
	do_not_fragment => $TOGGLE,
	interface => $STRING,
	interval => $STRING,
	source => $STRING,
	pattern => $STRING,
	size => $STRING,
	strict => $TOGGLE,
	ttl => $STRING,
	verbose => $TOGGLE,
	tos => $STRING,
	bypass_routing => $TOGGLE,
	inet => $TOGGLE,
	inet6 => $TOGGLE,
	routing_instance => $STRING,
	mac_address => $STRING,
	host => $STRING,
	logical_system => $STRING,
    },

);
1;
