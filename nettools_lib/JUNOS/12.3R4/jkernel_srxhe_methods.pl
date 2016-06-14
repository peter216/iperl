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
# FILE: jkernel_srxhe_methods.pl -- generated automagikally; DO NOT EDIT
#

%jkernel_srxhe_methods = (
    ## Method : <get-eedebug-action-profile>
    ## Returns: <eedebug-all-action-profile>
    ## Command: "show security datapath-debug action-profile"
    get_eedebug_action_profile => $NO_ARGS,

    ## Method : <get-eedebug-events>
    ## Returns: <eedebug-all-events>
    ## Command: "show security datapath-debug events"
    get_eedebug_events => $NO_ARGS,

    ## Method : <get-eedebug-counters>
    ## Returns: <eedebug-all-counters>
    ## Command: "show security datapath-debug counters"
    get_eedebug_counters => $NO_ARGS,

    ## Method : <show-eedebug-capture>
    ## Returns: <eedebug-capture-output>
    ## Command: "show security datapath-debug capture"
    show_eedebug_capture => $NO_ARGS,

    ## Method : <get-security-gprs-gtp-tunnels>
    ## Returns: <gtp-show-tunnel>
    ## Command: "show security gprs gtp tunnels"
    get_security_gprs_gtp_tunnels => {
	summary => $TOGGLE,
	brief => $TOGGLE,
    },

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

    ## Method : <clear-eedebug-counters>
    ## Returns: <clear-eedebug-counters-result>
    ## Command: "clear security datapath-debug counters"
    clear_eedebug_counters => $NO_ARGS,

    ## Method : <clear-security-gprs-gtp-tunnel>
    ## Returns: <gtp-clear-tunnel>
    ## Command: "clear security gprs gtp tunnel"
    clear_security_gprs_gtp_tunnel => {
	identifier => $STRING,
	all => $TOGGLE,
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

    ## Method : <request-eedebug-capture-start>
    ## Returns: <request-eedebug-capture-start-result>
    ## Command: "request security datapath-debug capture start"
    request_eedebug_capture_start => $NO_ARGS,

    ## Method : <request-eedebug-capture-stop>
    ## Returns: <request-eedebug-capture-stop-result>
    ## Command: "request security datapath-debug capture stop"
    request_eedebug_capture_stop => $NO_ARGS,

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
