package test

import (
	"github.com/gruntwork-io/terratest/modules/gcp"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"strconv"
	"testing"
)

func TestGceDevProject(t *testing.T) {
	project_id := "193960632328"
	instance_name := "test-instance"
	machine_type := "e2-medium"
	zone := "asia-east1-b"
	network := "dev-vpc"
	subnetwork := "dev-subnet-asia-east1"
	tags := []string{"test-tag"}
	boot_disk_name := "instance-1"
	auto_delete := true
	image_name := "ubuntu-os-pro-cloud/ubuntu-pro-2204-lts"
	disk_size := 50
	disk_type := "pd-standard"
	subnetwork_project := "193960632328"

	variables := map[string]interface{}{
		"project_id":         project_id,
		"instance_name":      instance_name,
		"machine_type":       machine_type,
		"zone":               zone,
		"network":            network,
		"subnetwork":         subnetwork,
		"tags":               tags,
		"boot_disk_name":     boot_disk_name,
		"auto_delete":        auto_delete,
		"image_name":         image_name,
		"disk_size":          disk_size,
		"disk_type":          disk_type,
		"subnetwork_project": subnetwork_project,
	}

	opt := &terraform.Options{
		TerraformDir: "../examples",
		Vars:         variables,
	}

	defer terraform.Destroy(t, opt)
	terraform.InitAndApply(t, opt)
	instance := gcp.FetchInstance(t, project_id, instance_name)

	instance_name = terraform.Output(t, opt, "gce_instance_name")
	if instance_name != "projects/193960632328/zones/asia-east1-b/instances/"+instance.Name {
		t.Errorf("Expected gce_instance_name to be test-instance but got %s", instance_name)
	}

	gce_instance_id := terraform.Output(t, opt, "gce_instance_id")
	if gce_instance_id != strconv.Itoa(int(instance.Id)) {
		t.Errorf("Expected gce_instance_id to be test-instance but got %s", gce_instance_id)
	}
	gce_instance_self_link := terraform.Output(t, opt, "gce_instance_self_link")
	if gce_instance_self_link != instance.SelfLink {
		t.Errorf("Expected gce_instance_self_link to be empty but got %s", gce_instance_self_link)
	}
}
