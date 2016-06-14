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
# FILE: mcsnoop_methods.pl -- generated automagikally; DO NOT EDIT
#

%mcsnoop_methods = (
    ## Method : <clear-igmp-snooping-statistics>
    ## Returns: <none>
    ## Command: "clear igmp snooping statistics"
    clear_igmp_snooping_statistics => {
	interface => $STRING,
	vlan_id => $STRING,
	instance => $STRING,
	qualified_vlan => $STRING,
    },

    ## Method : <clear-igmp-snooping-bridge-domain-statistics>
    ## Returns: <none>
    ## Command: "clear igmp snooping statistics bridge-domain"
    clear_igmp_snooping_bridge_domain_statistics => {
	virtual_switch => $STRING,
	domain_name => $STRING,
	interface => $STRING,
	vlan_id => $STRING,
    },

    ## Method : <clear-igmp-snooping-vlan-statistics>
    ## Returns: <none>
    ## Command: "clear igmp snooping statistics vlan"
    clear_igmp_snooping_vlan_statistics => {
	virtual_switch => $STRING,
	vlan_name => $STRING,
	interface => $STRING,
	qualified_vlan => $STRING,
    },

    ## Method : <clear-igmp-snooping-membership>
    ## Returns: <none>
    ## Command: "clear igmp snooping membership"
    clear_igmp_snooping_membership => {
	group => $STRING,
	interface => $STRING,
	vlan_id => $STRING,
	instance => $STRING,
	qualified_vlan => $STRING,
    },

    ## Method : <clear-igmp-snooping-bridge-domain-membership>
    ## Returns: <none>
    ## Command: "clear igmp snooping membership bridge-domain"
    clear_igmp_snooping_bridge_domain_membership => {
	virtual_switch => $STRING,
	domain_name => $STRING,
	interface => $STRING,
	vlan_id => $STRING,
	group => $STRING,
    },

    ## Method : <clear-igmp-snooping-vlan-membership>
    ## Returns: <none>
    ## Command: "clear igmp snooping membership vlan"
    clear_igmp_snooping_vlan_membership => {
	virtual_switch => $STRING,
	vlan_name => $STRING,
	interface => $STRING,
	qualified_vlan => $STRING,
	group => $STRING,
    },

    ## Method : <clear-pim-snooping-join>
    ## Returns: <none>
    ## Command: "clear pim snooping join"
    clear_pim_snooping_join => {
	group => $STRING,
	vlan_id => $STRING,
	instance => $STRING,
    },

    ## Method : <clear-pim-snooping-statistics>
    ## Returns: <none>
    ## Command: "clear pim snooping statistics"
    clear_pim_snooping_statistics => {
	interface => $STRING,
	vlan_id => $STRING,
	instance => $STRING,
    },

    ## Method : <get-igmp-snooping-membership-information>
    ## Returns: <igmp-snooping-membership-information>
    ## Command: "show igmp snooping membership"
    get_igmp_snooping_membership_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	group => $STRING,
	interface => $STRING,
	vlan_id => $STRING,
	instance => $STRING,
	qualified_vlan => $STRING,
    },

    ## Method : <get-igmp-snooping-bridge-domain-membership>
    ## Returns: <igmp-snooping-membership-information>
    ## Command: "show igmp snooping membership bridge-domain"
    get_igmp_snooping_bridge_domain_membership => {
	virtual_switch => $STRING,
	domain_name => $STRING,
	interface => $STRING,
	vlan_id => $STRING,
	group => $STRING,
    },

    ## Method : <get-igmp-snooping-vlan-membership>
    ## Returns: <igmp-snooping-membership-information>
    ## Command: "show igmp snooping membership vlan"
    get_igmp_snooping_vlan_membership => {
	virtual_switch => $STRING,
	vlan_name => $STRING,
	interface => $STRING,
	qualified_vlan => $STRING,
	group => $STRING,
    },

    ## Method : <get-igmp-snooping-interface-information>
    ## Returns: <igmp-interface-information>
    ## Command: "show igmp snooping interface"
    get_igmp_snooping_interface_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface => $STRING,
	vlan_id => $STRING,
	instance => $STRING,
	qualified_vlan => $STRING,
    },

    ## Method : <get-igmp-snooping-bridge-domain-interface>
    ## Returns: <igmp-interface-information>
    ## Command: "show igmp snooping interface bridge-domain"
    get_igmp_snooping_bridge_domain_interface => {
	virtual_switch => $STRING,
	domain_name => $STRING,
	interface => $STRING,
	vlan_id => $STRING,
    },

    ## Method : <get-igmp-snooping-vlan-interface>
    ## Returns: <igmp-interface-information>
    ## Command: "show igmp snooping interface vlan"
    get_igmp_snooping_vlan_interface => {
	virtual_switch => $STRING,
	vlan_name => $STRING,
	interface => $STRING,
	qualified_vlan => $STRING,
    },

    ## Method : <get-igmp-snooping-statistics-information>
    ## Returns: <igmp-statistics-information>
    ## Command: "show igmp snooping statistics"
    get_igmp_snooping_statistics_information => {
	interface => $STRING,
	vlan_id => $STRING,
	instance => $STRING,
	qualified_vlan => $STRING,
    },

    ## Method : <get-igmp-snooping-bridge-domain-statistics>
    ## Returns: <igmp-statistics-information>
    ## Command: "show igmp snooping statistics bridge-domain"
    get_igmp_snooping_bridge_domain_statistics => {
	virtual_switch => $STRING,
	domain_name => $STRING,
	interface => $STRING,
	vlan_id => $STRING,
    },

    ## Method : <get-igmp-snooping-vlan-statistics>
    ## Returns: <igmp-statistics-information>
    ## Command: "show igmp snooping statistics vlan"
    get_igmp_snooping_vlan_statistics => {
	virtual_switch => $STRING,
	vlan_name => $STRING,
	interface => $STRING,
	qualified_vlan => $STRING,
    },

    ## Method : <get-pim-snooping-interfaces-information>
    ## Returns: <pim-interfaces-information>
    ## Command: "show pim snooping interfaces"
    get_pim_snooping_interfaces_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface => $STRING,
	vlan_id => $STRING,
	instance => $STRING,
    },

    ## Method : <get-pim-snooping-join-information>
    ## Returns: <pim-join-information>
    ## Command: "show pim snooping join"
    get_pim_snooping_join_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	group => $STRING,
	vlan_id => $STRING,
	instance => $STRING,
    },

    ## Method : <get-pim-snooping-neighbors-information>
    ## Returns: <pim-neighbors-information>
    ## Command: "show pim snooping neighbors"
    get_pim_snooping_neighbors_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface => $STRING,
	vlan_id => $STRING,
	instance => $STRING,
    },

    ## Method : <get-pim-snooping-statistics-information>
    ## Returns: <pim-statistics-information>
    ## Command: "show pim snooping statistics"
    get_pim_snooping_statistics_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface => $STRING,
	vlan_id => $STRING,
	instance => $STRING,
    },

    ## Method : <get-multicast-snooping-route-information>
    ## Returns: <multicast-route-information>
    ## Command: "show multicast snooping route"
    get_multicast_snooping_route_information => {
	all => $TOGGLE,
	active => $TOGGLE,
	inactive => $TOGGLE,
	control => $TOGGLE,
	data => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	extensive => $TOGGLE,
	vlan_id => $STRING,
	qualified_vlan => $STRING,
	mesh_group => $STRING,
	group => $STRING,
	source_prefix => $STRING,
	regexp => $STRING,
	bridge_domain => $STRING,
	vlan => $STRING,
	instance => $STRING,
    },

    ## Method : <get-multicast-snooping-next-hops-information>
    ## Returns: <multicast-next-hops-information>
    ## Command: "show multicast snooping next-hops"
    get_multicast_snooping_next_hops_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	identifier => $STRING,
    },

    ## Method : <request-snooping-core-dump>
    ## Returns: <none>
    ## Command: "request system core-dump snooping"
    request_snooping_core_dump => {
	logical_system => $STRING,
	fabric => $TOGGLE,
    },

    ## Method : <request-running-snooping-core-dump>
    ## Returns: <none>
    ## Command: "request system core-dump snooping running"
    request_running_snooping_core_dump => {
	logical_system => $STRING,
	fabric => $TOGGLE,
    },

    ## Method : <request-fatal-snooping-core-dump>
    ## Returns: <none>
    ## Command: "request system core-dump snooping fatal"
    request_fatal_snooping_core_dump => {
	logical_system => $STRING,
	fabric => $TOGGLE,
    },

);
1;
