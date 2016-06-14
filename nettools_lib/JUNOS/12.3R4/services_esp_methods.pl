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
# FILE: services_esp_methods.pl -- generated automagikally; DO NOT EDIT
#

%services_esp_methods = (
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

);
1;
