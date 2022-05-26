package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestDevProjectTest(t *testing.T) {

	project_id := "193960632328"
	network_name := "test-network"
	expect_network_name := fmt.Sprintf("projects/%s/global/networks/%s", project_id, network_name)
	subnet_name := "test-subnet"
	region := "asia-east1"
	expect_subnet_name := fmt.Sprintf("projects/%s/regions/%s/subnetworks/%s", project_id, region, subnet_name)
	variables := map[string]interface{}{
		"project_id":              project_id,
		"vpc_network_name":        network_name,
		"auto_create_subnetworks": true,
		"mtu":                     1400,
		"vpc_subnet_name":         subnet_name,
		"vpc_subnet_cidr":         "10.0.0.0/16",
		"region":                  region,
	}

	opt := &terraform.Options{
		TerraformDir: "../examples",
		Vars:         variables,
	}

	defer terraform.Destroy(t, opt)
	terraform.InitAndApply(t, opt)

	vpc_network_name := terraform.Output(t, opt, "vpc_network_name")

	if vpc_network_name != expect_network_name {
		t.Errorf("Expected vpc_network_name to be test-project but got %s", vpc_network_name)
	}

	vpc_subnet_name := terraform.Output(t, opt, "vpc_subnet_name")
	if vpc_subnet_name != expect_subnet_name {
		t.Errorf("Expected vpc_subnet_name to be test-subnet bug got %s", vpc_subnet_name)
	}

}
