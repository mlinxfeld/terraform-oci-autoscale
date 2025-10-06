resource "oci_autoscaling_auto_scaling_configuration" "FoggyKitchenThresholdAutoScalingConfiguration" {
    count = var.enable_threshold_autoscaling ? 1 : 0 
    auto_scaling_resources {

        id = oci_core_instance_pool.FoggyKitchenInstancePool[0].id
        type = "instancePool"
    }
    compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
    policies {
        display_name = "FoggyKitchenThresholdAutoScalingConfigurationPolicies"
        capacity {
            initial = "2"
            max = "4"
            min = "2"
        }

        policy_type = "threshold"
        
        rules {
            action {
                type = "CHANGE_COUNT_BY"
                value = "1"
            }
            display_name = "FoggyKitchenThresholdAutoScalingConfigurationPoliciesScaleOutRule"
            metric {
                metric_type = "CPU_UTILIZATION"
                threshold {
                    operator = "GT"
                    value = "80"
                }
            }
        }

        rules {
            action {
                type  = "CHANGE_COUNT_BY"
                value = "-1"
            }
            display_name = "FoggyKitchenThresholdAutoScalingConfigurationPoliciesScaleInRule"
            metric {
                metric_type = "CPU_UTILIZATION"
                threshold {
                    operator = "LT"
                    value = "20"
                }
            }
        }
    }
    cool_down_in_seconds = "300"
    display_name = "FoggyKitchenThresholdAutoScalingConfiguration"
}
