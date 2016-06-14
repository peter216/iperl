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
# FILE: pppd_methods.pl -- generated automagikally; DO NOT EDIT
#

%pppd_methods = (
    ## Method : <clear-ppp-statistics-information>
    ## Returns: <none>
    ## Command: "clear ppp statistics"
    clear_ppp_statistics_information => {
	memory => $TOGGLE,
    },

    ## Method : <get-ppp-address-pool-inforamation>
    ## Returns: <ppp-address-pool-information>
    ## Command: "show ppp address-pool"
    get_ppp_address_pool_inforamation => {
	detail => $TOGGLE,
	pool_name => $STRING,
    },

    ## Method : <get-ppp-interface-information>
    ## Returns: <ppp-interface-information>
    ## Command: "show ppp interface"
    get_ppp_interface_information => {
	interface_name => $STRING,
	extensive => $TOGGLE,
	terse => $TOGGLE,
    },

    ## Method : <get-ppp-statistics-information>
    ## Returns: <ppp-statistics-information>
    ## Command: "show ppp statistics"
    get_ppp_statistics_information => {
	detail => $TOGGLE,
	memory => $TOGGLE,
	recovery => $TOGGLE,
	extensive => $TOGGLE,
    },

    ## Method : <get-ppp-summary-information>
    ## Returns: <ppp-summary-information>
    ## Command: "show ppp summary"
    get_ppp_summary_information => $NO_ARGS,

);
1;
