package test

import (
	//"github.com/gruntwork-io/terratest/modules/gcp"
	//"github.com/gruntwork-io/terratest/modules/files"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"testing"
)

func TestRouter(t *testing.T) {

	//files.CopyFile("provider.tf", "../examples/provider.tf")

	variables := map[string]interface{}{
		"router_name":                        "test-router",
		"region":                             "asia-northeast1",
		"router_nat_name":                    "test-router-nat",
		"network":                            "dev-vpc",
		"nat_ip_allocate_option":             "AUTO_ONLY",
		"source_subnetwork_ip_ranges_to_nat": "ALL_SUBNETWORKS_ALL_IP_RANGES",
	}

	opt := &terraform.Options{
		TerraformDir: "../examples",
		Vars:         variables,
	}

	defer terraform.Destroy(t, opt)
	terraform.InitAndApply(t, opt)

	router_name := terraform.Output(t, opt, "router_name")
	expect_name := "projects/193960632328/regions/asia-northeast1/routers/" + "test-router"

	if router_name != expect_name {
		t.Errorf("Expected router_name to be %s , but got %s", expect_name, router_name)
	}

	router_nat_name := terraform.Output(t, opt, "router_nat_name")
	expect_name = "193960632328/asia-northeast1/test-router/test-router-nat"

	if router_nat_name != expect_name {
		t.Errorf("Expected route_nat_name to be %s, but got %s", expect_name, router_nat_name)
	}
}
