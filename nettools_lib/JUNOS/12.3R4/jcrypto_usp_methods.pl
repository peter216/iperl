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
# FILE: jcrypto_usp_methods.pl -- generated automagikally; DO NOT EDIT
#

%jcrypto_usp_methods = (
    ## Method : <clear-ipsec-security-association>
    ## Returns: <none>
    ## Command: "clear security ipsec security-associations"
    clear_ipsec_security_association => {
	fpc => $STRING,
	pic => $STRING,
	kmd_instance => $STRING,
	index => $STRING,
    },

    ## Method : <clear-ipsec-statistics>
    ## Returns: <none>
    ## Command: "clear security ipsec statistics"
    clear_ipsec_statistics => {
	fpc => $STRING,
	pic => $STRING,
	index => $STRING,
    },

    ## Method : <clear-gvpn-ipsec-security-association>
    ## Returns: <none>
    ## Command: "clear security group-vpn member ipsec security-associations"
    clear_gvpn_ipsec_security_association => {
	fpc => $STRING,
	pic => $STRING,
	kmd_instance => $STRING,
	index => $STRING,
    },

    ## Method : <clear-gvpn-ipsec-statistics>
    ## Returns: <none>
    ## Command: "clear security group-vpn member ipsec statistics"
    clear_gvpn_ipsec_statistics => {
	fpc => $STRING,
	pic => $STRING,
	index => $STRING,
    },

    ## Method : <clear-group-vpn-ike-security-associations>
    ## Returns: <none>
    ## Command: "clear security group-vpn member ike security-associations"
    clear_group_vpn_ike_security_associations => {
	fpc => $STRING,
	pic => $STRING,
	kmd_instance => $STRING,
	peer_address => $STRING,
	index => $STRING,
    },

    ## Method : <clear-group-vpn-kek-security-associations>
    ## Returns: <none>
    ## Command: "clear security group-vpn member kek security-associations"
    clear_group_vpn_kek_security_associations => {
	fpc => $STRING,
	pic => $STRING,
	kmd_instance => $STRING,
	index => $STRING,
    },

    ## Method : <clear-security-group-vpn-server>
    ## Returns: <none>
    ## Command: "clear security group-vpn server"
    clear_security_group_vpn_server => {
	clear_security_group_vpn_server_group_name => $STRING,
	clear_security_group_vpn_server_group_id => $STRING,
	clear_security_group_vpn_server_now => $TOGGLE,
    },

    ## Method : <clear-ike-security-association>
    ## Returns: <none>
    ## Command: "clear security ike security-associations"
    clear_ike_security_association => {
	fpc => $STRING,
	pic => $STRING,
	kmd_instance => $STRING,
	peer_address => $STRING,
	index => $STRING,
	port => $STRING,
    },

    ## Method : <clear-ike-respond-bad-spi-count>
    ## Returns: <none>
    ## Command: "clear security ike respond-bad-spi-count"
    clear_ike_respond_bad_spi_count => {
	gw_name => $STRING,
    },

    ## Method : <clear-ssl-proxy-statistics>
    ## Returns: <none>
    ## Command: "clear services ssl proxy statistics"
    clear_ssl_proxy_statistics => $NO_ARGS,

    ## Method : <get-security-associations-information>
    ## Returns: <security-associations-information>
    ## Command: "show security ipsec security-associations"
    get_security_associations_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	family => $STRING,
	show_index_ipsec_security_association => $STRING,
	fpc => $STRING,
	pic => $STRING,
	kmd_instance => $STRING,
    },

    ## Method : <get-ipsec-statistics-information>
    ## Returns: <usp-ipsec-total-statistics-information>
    ## Command: "show security ipsec statistics"
    get_ipsec_statistics_information => {
	fpc => $STRING,
	pic => $STRING,
	show_index_ipsec_statistics => $STRING,
    },

    ## Method : <get-ipsec-next-hop-tunnel-information>
    ## Returns: <usp-ipsec-next-hop-tunnel-information>
    ## Command: "show security ipsec next-hop-tunnels"
    get_ipsec_next_hop_tunnel_information => {
	interface_name => $STRING,
    },

    ## Method : <get-pre-shared-key>
    ## Returns: <ike-show-pre-shared-key-information>
    ## Command: "show security ike pre-shared-key"
    get_pre_shared_key => {
	user_id => $STRING,
	master_key => $STRING,
    },

    ## Method : <get-ike-security-associations-information>
    ## Returns: <ike-security-associations-information>
    ## Command: "show security ike security-associations"
    get_ike_security_associations_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	peer_address => $STRING,
	index => $STRING,
	fpc => $STRING,
	pic => $STRING,
	kmd_instance => $STRING,
	family => $STRING,
    },

    ## Method : <get-ike-active-peers-information>
    ## Returns: <ike-active-peers-information>
    ## Command: "show security ike active-peer"
    get_ike_active_peers_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	peer_address => $STRING,
	port => $STRING,
	fpc => $STRING,
	pic => $STRING,
	kmd_instance => $STRING,
    },

    ## Method : <get-gvpn-security-associations-information>
    ## Returns: <security-associations-information>
    ## Command: "show security group-vpn member ipsec security-associations"
    get_gvpn_security_associations_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	show_gvpn_index_ipsec_security_association => $STRING,
	fpc => $STRING,
	pic => $STRING,
	kmd_instance => $STRING,
    },

    ## Method : <get-gvpn-ipsec-statistics-information>
    ## Returns: <usp-ipsec-total-statistics-information>
    ## Command: "show security group-vpn member ipsec statistics"
    get_gvpn_ipsec_statistics_information => {
	fpc => $STRING,
	pic => $STRING,
	show_gvpn_index_ipsec_statistics => $STRING,
    },

    ## Method : <get-gvpn-ike-security-associations-information>
    ## Returns: <ike-security-associations-information>
    ## Command: "show security group-vpn member ike security-associations"
    get_gvpn_ike_security_associations_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	peer_address => $STRING,
	index => $STRING,
	fpc => $STRING,
	pic => $STRING,
	kmd_instance => $STRING,
    },

    ## Method : <get-gvpn-kek-security-associations-information>
    ## Returns: <ike-security-associations-information>
    ## Command: "show security group-vpn member kek security-associations"
    get_gvpn_kek_security_associations_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	peer_address => $STRING,
	index => $STRING,
	fpc => $STRING,
	pic => $STRING,
	kmd_instance => $STRING,
    },

    ## Method : <get-security-group-vpn-server-registered-members>
    ## Returns: <security-group-vpn-server-registered-members>
    ## Command: "show security group-vpn server registered-members"
    get_security_group_vpn_server_registered_members => {
	show_security_group_vpn_server_reg_group_name => $STRING,
	show_security_group_vpn_server_reg_group_id => $STRING,
	fpc => $STRING,
	pic => $STRING,
	kmd_instance => $STRING,
    },

    ## Method : <get-security-group-vpn-server-kek-sa>
    ## Returns: <security-group-vpn-server-kek-sa>
    ## Command: "show security group-vpn server kek security-associations"
    get_security_group_vpn_server_kek_sa => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	group => $STRING,
	group_id => $STRING,
	index => $STRING,
	fpc => $STRING,
	pic => $STRING,
	kmd_instance => $STRING,
    },

    ## Method : <get-security-group-vpn-server-security-information>
    ## Returns: <security-group-vpn-server-security-information>
    ## Command: "show security group-vpn server ipsec security-associations"
    get_security_group_vpn_server_security_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	group => $STRING,
	group_id => $STRING,
	fpc => $STRING,
	pic => $STRING,
	kmd_instance => $STRING,
    },

    ## Method : <get-security-group-vpn-server-ike-security-associations-information>
    ## Returns: <security-group-vpn-server-ike-security-associations-information>
    ## Command: "show security group-vpn server ike security-associations"
    get_security_group_vpn_server_ike_security_associations_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	group => $STRING,
	group_id => $STRING,
	index => $STRING,
	fpc => $STRING,
	pic => $STRING,
	kmd_instance => $STRING,
    },

    ## Method : <get-ssl-proxy-statistics>
    ## Returns: <sslproxy-statistics-information>
    ## Command: "show services ssl proxy statistics"
    get_ssl_proxy_statistics => $NO_ARGS,

);
1;
