#!/usr/bin/env bats

load helpers

@test "Check for valid pod netns CIDR" {
	start_ocid
	run ocic pod run --config "$TESTDATA"/sandbox_config.json
	echo "$output"
	[ "$status" -eq 0 ]
	pod_id="$output"

	check_pod_cidr $pod_id

	cleanup_pods
	stop_ocid
}

@test "Ping pod from the host" {
	start_ocid
	run ocic pod run --config "$TESTDATA"/sandbox_config.json
	echo "$output"
	[ "$status" -eq 0 ]
	pod_id="$output"

	ping_pod $pod_id

	cleanup_pods
	stop_ocid
}

@test "Ping pod from another pod" {
	start_ocid
	run ocic pod run --config "$TESTDATA"/sandbox_config.json
	echo "$output"
	[ "$status" -eq 0 ]
	pod1_id="$output"

	temp_sandbox_conf cni_test

	run ocic pod run --config "$TESTDIR"/sandbox_config_cni_test.json
	echo "$output"
	[ "$status" -eq 0 ]
	pod2_id="$output"

	ping_pod_from_pod $pod1_id $pod2_id
	[ "$status" -eq 0 ]

	ping_pod_from_pod $pod2_id $pod1_id
	[ "$status" -eq 0 ]

	cleanup_pods
	stop_ocid
}

@test "Ensure correct CNI plugin namespace/name/container-id arguments" {
	start_ocid "" "" "" "prepare_plugin_test_args_network_conf"
	run ocic pod run --config "$TESTDATA"/sandbox_config.json
	[ "$status" -eq 0 ]

	. /tmp/plugin_test_args.out

	[ "$FOUND_CNI_CONTAINERID" != "redhat.test.ocid" ]
	[ "$FOUND_CNI_CONTAINERID" != "podsandbox1" ]
	[ "$FOUND_K8S_POD_NAMESPACE" = "redhat.test.ocid" ]
	[ "$FOUND_K8S_POD_NAME" = "podsandbox1" ]

	cleanup_pods
	stop_ocid
}
