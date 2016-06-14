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
# FILE: jkernel_jseries_methods.pl -- generated automagikally; DO NOT EDIT
#

%jkernel_jseries_methods = (
    ## Method : <request-tgm-login-fpc>
    ## Returns: <none>
    ## Command: "request tgm login fpc"
    request_tgm_login_fpc => {
	slot => $STRING,
	user => $STRING,
    },

    ## Method : <request-chassis-cluster-failover>
    ## Returns: <none>
    ## Command: "request chassis cluster failover"
    request_chassis_cluster_failover => {
	redundancy_group => $STRING,
	node => $STRING,
    },

    ## Method : <request-chassis-cluster-failover-reset>
    ## Returns: <none>
    ## Command: "request chassis cluster failover reset"
    request_chassis_cluster_failover_reset => {
	redundancy_group => $STRING,
    },

    ## Method : <request-chassis-cluster-in-service-upgrade>
    ## Returns: <none>
    ## Command: "request chassis cluster in-service-upgrade"
    request_chassis_cluster_in_service_upgrade => {
	abort => $TOGGLE,
    },

    ## Method : <get-dialer-interface-information>
    ## Returns: <dialer-interface-information>
    ## Command: "show dialer interfaces"
    get_dialer_interface_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface_name => $STRING,
    },

    ## Method : <get-dialer-pool-information>
    ## Returns: <dialer-pool-information>
    ## Command: "show dialer pools"
    get_dialer_pool_information => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	pool_name => $STRING,
    },

    ## Method : <get-dialer-defaults-information>
    ## Returns: <dialer-defaults-information>
    ## Command: "show dialer defaults"
    get_dialer_defaults_information => $NO_ARGS,

    ## Method : <get-isdn-q931-statistics>
    ## Returns: <q931-statistics>
    ## Command: "show isdn q931 statistics"
    get_isdn_q931_statistics => {
	interface => $STRING,
    },

    ## Method : <get-isdn-q921-statistics>
    ## Returns: <q921-statistics>
    ## Command: "show isdn q921 statistics"
    get_isdn_q921_statistics => {
	interface => $STRING,
    },

    ## Method : <get-isdn-calls>
    ## Returns: <isdn-calls>
    ## Command: "show isdn calls"
    get_isdn_calls => $NO_ARGS,

    ## Method : <get-isdn-call-history>
    ## Returns: <isdn-call-history>
    ## Command: "show isdn history"
    get_isdn_call_history => $NO_ARGS,

    ## Method : <get-isdn-status>
    ## Returns: <isdn-status>
    ## Command: "show isdn status"
    get_isdn_status => {
	brief => $TOGGLE,
	detail => $TOGGLE,
	interface => $STRING,
    },

    ## Method : <get-tgm-dynamic-cac-information>
    ## Returns: <tgm-dynamic-cac-information>
    ## Command: "show tgm dynamic-call-admission-control"
    get_tgm_dynamic_cac_information => $NO_ARGS,

    ## Method : <get-tgm-telephony-interface-module-status>
    ## Returns: <telephony-interface-module-status-information>
    ## Command: "show tgm telephony-interface-module"
    get_tgm_telephony_interface_module_status => {
	status => $TOGGLE,
    },

    ## Method : <get-tgm-information>
    ## Returns: <tgm-information>
    ## Command: "show tgm fpc"
    get_tgm_information => {
	slot => $STRING,
	media_gateway_controller => $TOGGLE,
	dsp_capacity => $TOGGLE,
    },

    ## Method : <get-llc2-redundancy>
    ## Returns: <llc2-redundancy>
    ## Command: "show llc2 redundancy"
    get_llc2_redundancy => {
	brief => $TOGGLE,
	detail => $TOGGLE,
    },

    ## Method : <get-llc2-redundancy-mac-translation-list>
    ## Returns: <llc2-redundancy-mac-translation-list>
    ## Command: "show llc2 redundancy mac-translation"
    get_llc2_redundancy_mac_translation_list => $NO_ARGS,

    ## Method : <get-llc2-redundancy-track-information>
    ## Returns: <llc2-redundancy-track-information>
    ## Command: "show llc2 redundancy track"
    get_llc2_redundancy_track_information => {
	interfaces => $TOGGLE,
	dlsw_remote_peer => $TOGGLE,
	dlsw_remote_destination => $TOGGLE,
    },

    ## Method : <get-llc2-redundancy-interface-statistics>
    ## Returns: <llc2-redundancy-interface-statistics>
    ## Command: "show llc2 redundancy interface statistics"
    get_llc2_redundancy_interface_statistics => $NO_ARGS,

    ## Method : <get-chassis-cluster-interfaces>
    ## Returns: <chassis-cluster-interface-statistics>
    ## Command: "show chassis cluster interfaces"
    get_chassis_cluster_interfaces => $NO_ARGS,

    ## Method : <get-chassis-cluster-control-plane-statistics>
    ## Returns: <chassis-cluster-statistics>
    ## Command: "show chassis cluster control-plane statistics"
    get_chassis_cluster_control_plane_statistics => $NO_ARGS,

    ## Method : <get-chassis-cluster-data-plane-statistics>
    ## Returns: <services-synchronized>
    ## Command: "show chassis cluster data-plane statistics"
    get_chassis_cluster_data_plane_statistics => $NO_ARGS,

    ## Method : <get-chassis-cluster-data-plane-interfaces>
    ## Returns: <chassis-cluster-dataplane-interfaces>
    ## Command: "show chassis cluster data-plane interfaces"
    get_chassis_cluster_data_plane_interfaces => $NO_ARGS,

    ## Method : <get-chassis-cluster-statistics>
    ## Returns: <chassis-cluster-statistics>
    ## Command: "show chassis cluster statistics"
    get_chassis_cluster_statistics => $NO_ARGS,

    ## Method : <get-chassis-cluster-status>
    ## Returns: <chassis-cluster-status>
    ## Command: "show chassis cluster status"
    get_chassis_cluster_status => {
	redundancy_group => $STRING,
    },

    ## Method : <get-chassis-cluster-ip-monitoring-status>
    ## Returns: <chassis-cluster-ip-monitoring>
    ## Command: "show chassis cluster ip-monitoring status"
    get_chassis_cluster_ip_monitoring_status => $NO_ARGS,

    ## Method : <get-chassis-cluster-ip-monitoring-status-redundancy-group>
    ## Returns: <chassis-cluster-ip-monitoring>
    ## Command: "show chassis cluster ip-monitoring status redundancy-group"
    get_chassis_cluster_ip_monitoring_status_redundancy_group => {
	redundancy_group_identifier => $STRING,
    },

    ## Method : <get-chassis-cluster-ethernet-switching-status>
    ## Returns: <chassis-cluster-ethernet-switching-status>
    ## Command: "show chassis cluster ethernet-switching status"
    get_chassis_cluster_ethernet_switching_status => $NO_ARGS,

    ## Method : <get-chassis-cluster-switch-fabric-probe-statistics>
    ## Returns: <chassis-cluster-switch-switching-statistics>
    ## Command: "show chassis cluster ethernet-switching statistics"
    get_chassis_cluster_switch_fabric_probe_statistics => $NO_ARGS,

    ## Method : <get-chassis-cluster-switch-fabric-link-interfaces>
    ## Returns: <chassis-cluster-switch-switching-interfaces>
    ## Command: "show chassis cluster ethernet-switching interfaces"
    get_chassis_cluster_switch_fabric_link_interfaces => $NO_ARGS,

    ## Method : <clear-isdn-q931-statistics>
    ## Returns: <none>
    ## Command: "clear isdn q931 statistics"
    clear_isdn_q931_statistics => {
	interface => $STRING,
    },

    ## Method : <clear-isdn-q921-statistics>
    ## Returns: <none>
    ## Command: "clear isdn q921 statistics"
    clear_isdn_q921_statistics => {
	interface => $STRING,
    },

    ## Method : <clear-tgm-media-gateway-controller>
    ## Returns: <none>
    ## Command: "clear tgm fpc"
    clear_tgm_media_gateway_controller => {
	slot => $STRING,
	media_gateway_controller => $TOGGLE,
    },

    ## Method : <clear-chassis-cluster-failover-count>
    ## Returns: <none>
    ## Command: "clear chassis cluster failover-count"
    clear_chassis_cluster_failover_count => $NO_ARGS,

    ## Method : <clear-chassis-cluster-control-plane-statistics>
    ## Returns: <none>
    ## Command: "clear chassis cluster control-plane statistics"
    clear_chassis_cluster_control_plane_statistics => $NO_ARGS,

    ## Method : <clear-chassis-cluster-data-plane-statistics>
    ## Returns: <none>
    ## Command: "clear chassis cluster data-plane statistics"
    clear_chassis_cluster_data_plane_statistics => $NO_ARGS,

    ## Method : <clear-chassis-cluster-switch-fabric-probe-statistics>
    ## Returns: <none>
    ## Command: "clear chassis cluster ethernet-switching statistics"
    clear_chassis_cluster_switch_fabric_probe_statistics => $NO_ARGS,

    ## Method : <clear-chassis-cluster-statistics>
    ## Returns: <none>
    ## Command: "clear chassis cluster statistics"
    clear_chassis_cluster_statistics => $NO_ARGS,

    ## Method : <clear-chassis-cluster-information>
    ## Returns: <none>
    ## Command: "clear chassis cluster information"
    clear_chassis_cluster_information => $NO_ARGS,

    ## Method : <clear-chassis-cluster-ip-monitoring-failure-count>
    ## Returns: <none>
    ## Command: "clear chassis cluster ip-monitoring failure-count"
    clear_chassis_cluster_ip_monitoring_failure_count => $NO_ARGS,

    ## Method : <clear-chassis-cluster-ip-monitoring-failure-count-ip-address>
    ## Returns: <none>
    ## Command: "clear chassis cluster ip-monitoring failure-count ip-address"
    clear_chassis_cluster_ip_monitoring_failure_count_ip_address => {
	ip_address_identifier => $STRING,
    },

    ## Method : <set-tgm-media-gateway-controller>
    ## Returns: <none>
    ## Command: "set tgm fpc"
    set_tgm_media_gateway_controller => {
	slot => $STRING,
    },

    ## Method : <set-chassis-cluster>
    ## Returns: <none>
    ## Command: "set chassis cluster"
    set_chassis_cluster => $NO_ARGS,

    ## Method : <set-chassis-cluster-enable>
    ## Returns: <none>
    ## Command: "set chassis cluster cluster-id"
    set_chassis_cluster_enable => {
	cluster_id => $STRING,
	node => $STRING,
	reboot => $TOGGLE,
    },

    ## Method : <set-chassis-cluster-disable>
    ## Returns: <none>
    ## Command: "set chassis cluster disable"
    set_chassis_cluster_disable => {
	reboot => $TOGGLE,
    },

);
1;
