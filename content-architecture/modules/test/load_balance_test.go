package test

import (
	"github.com/gruntwork-io/terratest/modules/gcp"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"testing"
)

func TestLoadBalance(t *testing.T) {

	projectId := gcp.GetGoogleProjectIDFromEnvVar(t)

	env := map[string]string{
		"GOOGLE_CLOUD_PROJECT": projectId,
	}

	variables := map[string]interface{}{

		"firewall_name": "test-ssh-firewall",
		"network":       "dev-vpc",
		"port":          22,
		"source_ranges": []string{"0.0.0.0/0"},
		"target_tags":   []string{"allow-ssh"},
	}

	opts1 := &terraform.Options{
		TerraformDir: "../firewall",
		Vars:         variables,
		EnvVars:      env,
	}

	defer terraform.Destroy(t, opts1)
	terraform.InitAndApply(t, opts1)

	firewall_name := terraform.Output(t, opts1, "firewall_name")
	//firewall_self_link := terraform.Output(t, opts1, "firewall_self_link")

	if firewall_name != "projects/terraform-demo-347313/global/firewalls/test-ssh-firewall" {
		t.Errorf("Except firewall_name to be projects/terraform-demo-347313/global/firewalls/test-ssh-firewall, but got %s ", firewall_name)
	}
	// if firewall_self_link != "test-ssh-firewall" {
	// 	t.Errorf("Except firewall_self_link to be test-ssh-firewall, but got %s ", firewall_self_link)
	// }

	variables = map[string]interface{}{
		"instance_template_name":      "test-instance",
		"machine_type":                "e2-medium",
		"source_image":                "ubuntu-os-pro-cloud/ubuntu-pro-2204-lts",
		"network":                     "dev-vpc",
		"subnetwork":                  "dev-subnet-asia-northeast1",
		"instance_group_manager_name": "test-instance-group-manager",
		"base_instance_name":          "app",
		"target_size":                 2,
		"zone":                        "asia-northeast1-b",
		"region_autoscaler_name":      "test-auto-scaler",
		"region":                      "asia-northeast1",
		"max_replicas":                3,
		"min_replicas":                1,
		"cooldown_period":             60,
		"health_check_name":           "test-health-name",
		"port":                        80,
	}

	opts2 := &terraform.Options{
		TerraformDir: "../instance_group",
		Vars:         variables,
		EnvVars:      env,
	}

	defer terraform.Destroy(t, opts2)
	terraform.InitAndApply(t, opts2)

	instance_group_manager := terraform.Output(t, opts2, "instance_group_manager")

	if instance_group_manager != "https://www.googleapis.com/compute/v1/projects/terraform-demo-347313/regions/asia-northeast1/instanceGroups/test-instance-group-manager" {
		t.Errorf("Except instance_group_manager to be test-instance , but got %s", instance_group_manager)
	}

	health_check_name := terraform.Output(t, opts2, "health_check_self_link")

	variables = map[string]interface{}{
		"backend_service_name":        "test-backend-service",
		"instance_group_manager_name": instance_group_manager,
		"health_check_name":           []string{health_check_name},
		"url_map_name":                "test-url-map",
		"https_proxy_name":            "test-proxy-name",
		"forwarding_rule_name":        "test-forwarding-rule-name",
		"port_range":                  "443",
		"certificate_name":            "test-certificate-name",
		"dns_names":                   []string{"example.com"},
		"common_name":                 "example.com",
	}

	opts3 := &terraform.Options{
		TerraformDir: "../load_balance",
		Vars:         variables,
		EnvVars:      env,
	}

	defer terraform.Destroy(t, opts3)
	terraform.InitAndApply(t, opts3)

	backend_service_name := terraform.Output(t, opts3, "backend_service")

	if backend_service_name != "test-backend-service" {
		t.Errorf("Except backend_service_name to be test-backend-service but got %s", backend_service_name)
	}

}
