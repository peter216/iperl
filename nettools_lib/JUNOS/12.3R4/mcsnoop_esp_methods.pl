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
# FILE: mcsnoop_esp_methods.pl -- generated automagikally; DO NOT EDIT
#

%mcsnoop_esp_methods = (
    ## Method : <get-igmp-snooping-membership-information>
    ## Returns: <igmp-snooping-membership-information>
    ## Command: "show igmp-snooping membership"
    get_igmp_snooping_membership_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	vlan => $STRING,
	interface => $STRING,
    },

    ## Method : <get-igmp-snooping-flow-information>
    ## Returns: <igmp-snooping-flow-information>
    ## Command: "show igmp-snooping flows"
    get_igmp_snooping_flow_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-igmp-snooping-vlan-information>
    ## Returns: <igmp-snooping-vlan-information>
    ## Command: "show igmp-snooping vlans"
    get_igmp_snooping_vlan_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	vlan => $STRING,
    },

    ## Method : <get-igmp-snooping-statistics-information>
    ## Returns: <igmp-snooping-statistics-information>
    ## Command: "show igmp-snooping statistics"
    get_igmp_snooping_statistics_information => {
	interface => $STRING,
	vlan => $STRING,
    },

    ## Method : <get-igmp-snooping-routing-information>
    ## Returns: <igmp-snooping-routing-information>
    ## Command: "show igmp-snooping route"
    get_igmp_snooping_routing_information => {
	ethernet_switching => $TOGGLE,
	inet => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	vlan => $STRING,
    },

    ## Method : <get-igmp-snooping-task-information>
    ## Returns: <task-summary-information>
    ## Command: "show igmp-snooping task"
    get_igmp_snooping_task_information => {
	summary => $TOGGLE,
    },

    ## Method : <get-igmp-snooping-task-accounting>
    ## Returns: <task-accounting-information>
    ## Command: "show igmp-snooping task accounting"
    get_igmp_snooping_task_accounting => {
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-igmp-snooping-task-io>
    ## Returns: <task-io-information>
    ## Command: "show igmp-snooping task io"
    get_igmp_snooping_task_io => $NO_ARGS,

    ## Method : <get-igmp-snooping-task-jobs>
    ## Returns: <task-jobs-information>
    ## Command: "show igmp-snooping task jobs"
    get_igmp_snooping_task_jobs => $NO_ARGS,

    ## Method : <get-igmp-snooping-task-timers>
    ## Returns: <task-timer-information>
    ## Command: "show igmp-snooping task timers"
    get_igmp_snooping_task_timers => {
	brief => $TOGGLE,
	expired => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-igmp-snooping-task-statistics>
    ## Returns: <task-statistics-information>
    ## Command: "show igmp-snooping task statistics"
    get_igmp_snooping_task_statistics => $NO_ARGS,

    ## Method : <get-igmp-snooping-task-memory>
    ## Returns: <task-memory-information>
    ## Command: "show igmp-snooping task memory"
    get_igmp_snooping_task_memory => {
	summary => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	history => $TOGGLE,
	fragmentation => $TOGGLE,
    },

    ## Method : <get-mld-snooping-membership-information>
    ## Returns: <mld-snooping-membership-information>
    ## Command: "show mld-snooping membership"
    get_mld_snooping_membership_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	vlan => $STRING,
	interface => $STRING,
    },

    ## Method : <get-mld-snooping-vlan-information>
    ## Returns: <mld-snooping-vlan-information>
    ## Command: "show mld-snooping vlans"
    get_mld_snooping_vlan_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	vlan => $STRING,
    },

    ## Method : <get-mld-snooping-statistics>
    ## Returns: <mld-snooping-statistics>
    ## Command: "show mld-snooping statistics"
    get_mld_snooping_statistics => {
	interface => $STRING,
	vlan => $STRING,
    },

    ## Method : <get-mld-snooping-routing-information>
    ## Returns: <mld-snooping-routing-information>
    ## Command: "show mld-snooping route"
    get_mld_snooping_routing_information => {
	ethernet_switching => $TOGGLE,
	inet6 => $TOGGLE,
	brief => $TOGGLE,
	detail => $TOGGLE,
	vlan => $STRING,
    },

    ## Method : <clear-igmp-snooping>
    ## Returns: <none>
    ## Command: "clear igmp-snooping"
    clear_igmp_snooping => $NO_ARGS,

    ## Method : <clear-igmp-snooping-membership>
    ## Returns: <none>
    ## Command: "clear igmp-snooping membership"
    clear_igmp_snooping_membership => {
	vlan => $STRING,
    },

    ## Method : <clear-igmp-snooping-statistics>
    ## Returns: <none>
    ## Command: "clear igmp-snooping statistics"
    clear_igmp_snooping_statistics => $NO_ARGS,

    ## Method : <clear-multicast-route-counter>
    ## Returns: <none>
    ## Command: "clear multicast route counter"
    clear_multicast_route_counter => $NO_ARGS,

    ## Method : <clear-mld-snooping>
    ## Returns: <none>
    ## Command: "clear mld-snooping"
    clear_mld_snooping => $NO_ARGS,

    ## Method : <clear-mld-snooping-membership>
    ## Returns: <none>
    ## Command: "clear mld-snooping membership"
    clear_mld_snooping_membership => {
	vlan => $STRING,
    },

    ## Method : <clear-mld-snooping-statistics>
    ## Returns: <none>
    ## Command: "clear mld-snooping statistics"
    clear_mld_snooping_statistics => $NO_ARGS,

    ## Method : <request-multicast-route-counter>
    ## Returns: <none>
    ## Command: "request multicast route counter"
    request_multicast_route_counter => {
	source => $STRING,
	group => $STRING,
	instance => $STRING,
    },

);
1;
