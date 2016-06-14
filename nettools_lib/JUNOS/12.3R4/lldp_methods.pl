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
# FILE: lldp_methods.pl -- generated automagikally; DO NOT EDIT
#

%lldp_methods = (
    ## Method : <clear-lldp-neighbors>
    ## Returns: <none>
    ## Command: "clear lldp neighbors"
    clear_lldp_neighbors => $NO_ARGS,

    ## Method : <clear-lldp-interface-neighbors>
    ## Returns: <none>
    ## Command: "clear lldp neighbors interface"
    clear_lldp_interface_neighbors => {
	interface_device => $STRING,
    },

    ## Method : <clear-lldp-statistics>
    ## Returns: <none>
    ## Command: "clear lldp statistics"
    clear_lldp_statistics => $NO_ARGS,

    ## Method : <clear-lldp-interface-statistics>
    ## Returns: <none>
    ## Command: "clear lldp statistics interface"
    clear_lldp_interface_statistics => {
	interface_device => $STRING,
    },

    ## Method : <get-lldp-information>
    ## Returns: <lldp-information>
    ## Command: "show lldp"
    get_lldp_information => $NO_ARGS,

    ## Method : <get-lldp-information-detail>
    ## Returns: <lldp-information-detail>
    ## Command: "show lldp detail"
    get_lldp_information_detail => $NO_ARGS,

    ## Method : <get-lldp-neighbors-information>
    ## Returns: <lldp-neighbors-information>
    ## Command: "show lldp neighbors"
    get_lldp_neighbors_information => $NO_ARGS,

    ## Method : <get-lldp-interface-neighbors>
    ## Returns: <lldp-neighbors-information>
    ## Command: "show lldp neighbors interface"
    get_lldp_interface_neighbors => {
	interface_device => $STRING,
    },

    ## Method : <get-lldp-statistics-information>
    ## Returns: <lldp-statistics-information>
    ## Command: "show lldp statistics"
    get_lldp_statistics_information => $NO_ARGS,

    ## Method : <get-lldp-interface-statistics>
    ## Returns: <lldp-statistics>
    ## Command: "show lldp statistics interface"
    get_lldp_interface_statistics => {
	interface_device => $STRING,
    },

    ## Method : <get-lldp-local-info>
    ## Returns: <lldp-local-info>
    ## Command: "show lldp local-information"
    get_lldp_local_info => $NO_ARGS,

    ## Method : <get-lldp-remote-global-statistics>
    ## Returns: <lldp-remote-global-statistics>
    ## Command: "show lldp remote-global-statistics"
    get_lldp_remote_global_statistics => $NO_ARGS,

);
1;
