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
# FILE: jappid_methods.pl -- generated automagikally; DO NOT EDIT
#

%jappid_methods = (
    ## Method : <clear-appid-application-system-cache>
    ## Returns: <clear-appid-application-system-cache-information>
    ## Command: "clear services application-identification application-system-cache"
    clear_appid_application_system_cache => {
	logical_system => $STRING,
    },

    ## Method : <clear-appid-counter>
    ## Returns: <none>
    ## Command: "clear services application-identification counter"
    clear_appid_counter => $NO_ARGS,

    ## Method : <clear-appid-counter-encrypted>
    ## Returns: <none>
    ## Command: "clear services application-identification counter ssl-encrypted-sessions"
    clear_appid_counter_encrypted => $NO_ARGS,

    ## Method : <clear-appid-application-statistics>
    ## Returns: <none>
    ## Command: "clear services application-identification statistics"
    clear_appid_application_statistics => $NO_ARGS,

    ## Method : <clear-appid-application-statistics-cumulative>
    ## Returns: <none>
    ## Command: "clear services application-identification statistics cumulative"
    clear_appid_application_statistics_cumulative => $NO_ARGS,

    ## Method : <clear-appid-application-statistics-interval>
    ## Returns: <none>
    ## Command: "clear services application-identification statistics interval"
    clear_appid_application_statistics_interval => $NO_ARGS,

    ## Method : <request-appid-application-package-download>
    ## Returns: <appid-download-status>
    ## Command: "request services application-identification download"
    request_appid_application_package_download => $NO_ARGS,

    ## Method : <request-appid-application-package-download-version>
    ## Returns: <appid-download-status>
    ## Command: "request services application-identification download version"
    request_appid_application_package_download_version => {
	version_value => $STRING,
    },

    ## Method : <request-appid-application-package-download-status>
    ## Returns: <appid-download-status>
    ## Command: "request services application-identification download status"
    request_appid_application_package_download_status => $NO_ARGS,

    ## Method : <request-appid-application-package-install>
    ## Returns: <appid-install-status>
    ## Command: "request services application-identification install"
    request_appid_application_package_install => $NO_ARGS,

    ## Method : <request-appid-application-package-install-status>
    ## Returns: <appid-install-status>
    ## Command: "request services application-identification install status"
    request_appid_application_package_install_status => $NO_ARGS,

    ## Method : <request-appid-application-package-uninstall>
    ## Returns: <appid-apppack-uinstall>
    ## Command: "request services application-identification uninstall"
    request_appid_application_package_uninstall => $NO_ARGS,

    ## Method : <request-appid-application-package-uninstall-status>
    ## Returns: <appid-uninstall-status>
    ## Command: "request services application-identification uninstall status"
    request_appid_application_package_uninstall_status => $NO_ARGS,

    ## Method : <request-appid-application-predefined-copy>
    ## Returns: <appid-application-predefined-copy>
    ## Command: "request services application-identification application copy"
    request_appid_application_predefined_copy => {
	application_name => $STRING,
    },

    ## Method : <request-appid-application-predefined-disable>
    ## Returns: <appid-application-predefined-disable>
    ## Command: "request services application-identification application disable"
    request_appid_application_predefined_disable => {
	application_name => $STRING,
	no_commit => $TOGGLE,
    },

    ## Method : <request-appid-application-predefined-enable>
    ## Returns: <appid-application-predefined-enable>
    ## Command: "request services application-identification application enable"
    request_appid_application_predefined_enable => {
	application_name => $STRING,
	no_commit => $TOGGLE,
    },

    ## Method : <request-appid-application-predefined-group-copy>
    ## Returns: <appid-application-predefined-group-copy>
    ## Command: "request services application-identification group copy"
    request_appid_application_predefined_group_copy => {
	group_name => $STRING,
    },

    ## Method : <request-appid-application-predefined-group-disable>
    ## Returns: <appid-application-predefined-group-disable>
    ## Command: "request services application-identification group disable"
    request_appid_application_predefined_group_disable => {
	group_name => $STRING,
    },

    ## Method : <request-appid-application-predefined-group-enable>
    ## Returns: <appid-application-predefined-group-enable>
    ## Command: "request services application-identification group enable"
    request_appid_application_predefined_group_enable => {
	group_name => $STRING,
    },

    ## Method : <get-appid-application-signature-detail>
    ## Returns: <appid-application-signature-detail>
    ## Command: "show services application-identification application detail"
    get_appid_application_signature_detail => {
	application_name => $STRING,
    },

    ## Method : <get-appid-application-signature-summary>
    ## Returns: <appid-application-signature-summary>
    ## Command: "show services application-identification application summary"
    get_appid_application_signature_summary => $NO_ARGS,

    ## Method : <get-appid-application-group-detail>
    ## Returns: <appid-application-group-detail>
    ## Command: "show services application-identification group detail"
    get_appid_application_group_detail => {
	group_name => $STRING,
    },

    ## Method : <get-appid-application-group-summary>
    ## Returns: <appid-application-group-summary>
    ## Command: "show services application-identification group summary"
    get_appid_application_group_summary => $NO_ARGS,

    ## Method : <get-appid-application-system-cache>
    ## Returns: <appid-application-system-cache-information>
    ## Command: "show services application-identification application-system-cache"
    get_appid_application_system_cache => {
	logical_system => $STRING,
	interface => $STRING,
    },

    ## Method : <get-appid-counter>
    ## Returns: <appid-counter-information>
    ## Command: "show services application-identification counter"
    get_appid_counter => {
	interface => $STRING,
    },

    ## Method : <get-appid-counter-encrypted>
    ## Returns: <appid-counter-information>
    ## Command: "show services application-identification counter ssl-encrypted-sessions"
    get_appid_counter_encrypted => $NO_ARGS,

    ## Method : <get-appid-application-statistics>
    ## Returns: <appid-application-statistics-information>
    ## Command: "show services application-identification statistics applications"
    get_appid_application_statistics => {
	interval => $STRING,
    },

    ## Method : <get-appid-application-group-statistics>
    ## Returns: <appid-application-group-statistics-information>
    ## Command: "show services application-identification statistics application-groups"
    get_appid_application_group_statistics => {
	interval => $STRING,
    },

    ## Method : <get-appid-package-version>
    ## Returns: <appid-package-version>
    ## Command: "show services application-identification version"
    get_appid_package_version => $NO_ARGS,

);
1;
