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
# FILE: jkernel_esp_methods.pl -- generated automagikally; DO NOT EDIT
#

%jkernel_esp_methods = (
    ## Method : <request-tdr-interface-diagnostics>
    ## Returns: <tdr-start-interface>
    ## Command: "request diagnostics tdr start interface"
    request_tdr_interface_diagnostics => {
	interface_name => $STRING,
    },

    ## Method : <abort-tdr-interface-diagnostics>
    ## Returns: <tdr-abort-interface>
    ## Command: "request diagnostics tdr abort interface"
    abort_tdr_interface_diagnostics => {
	interface_name => $STRING,
    },

    ## Method : <get-tdr-interface-information>
    ## Returns: <tdr-interface-information>
    ## Command: "show diagnostics tdr"
    get_tdr_interface_information => $NO_ARGS,

    ## Method : <get-tdr-interface-status>
    ## Returns: <tdr-interface-status>
    ## Command: "show diagnostics tdr interface"
    get_tdr_interface_status => {
	interface_name => $STRING,
    },

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

    ## Method : <get-fpc-version>
    ## Returns: <fpc-version>
    ## Command: "show version fpc"
    get_fpc_version => {
	fpc_slot => $STRING,
    },

    ## Method : <get-software-rollback-information>
    ## Returns: <rollback-information>
    ## Command: "show version rollback"
    get_software_rollback_information => $NO_ARGS,

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

);
1;
