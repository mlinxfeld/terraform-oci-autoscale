resource "oci_autoscaling_auto_scaling_configuration" "FoggyKitchenScheduledAutoScalingConfiguration" {
    count = var.enable_scheduled_autoscaling ? 1 : 0 
    auto_scaling_resources {

        id = oci_core_instance_pool.FoggyKitchenInstancePool[0].id
        type = "instancePool"
    }
    compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
    
    policies {
        display_name = "FoggyKitchenScheduledAutoScalingConfigurationScaleOutPolicy"
        capacity {
            initial = "4"
            max = "4"
            min = "2"
        }
        policy_type = "scheduled"
        execution_schedule {
            # 12:00, 28/10/2025
            expression = "0 0 12 28 10 ? 2025"
            timezone   = "UTC"
            type       = "cron"
        }

    }

    policies {
        display_name = "FoggyKitchenScheduledAutoScalingConfigurationScaleInPolicy"
        capacity {
            initial = "2"
            max = "2"
            min = "2"
        }
        policy_type = "scheduled"
        execution_schedule {
            # 12:15, 28/10/2025
            expression = "0 15 12 28 10 ? 2025"
            timezone   = "UTC"
            type       = "cron"
        }

    }

    cool_down_in_seconds = "300"
    display_name = "FoggyKitchenScheduledAutoScalingConfiguration"
}
