resource "oci_core_instance_pool" "FoggyKitchenInstancePool" {
    compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
    instance_configuration_id = oci_core_instance_configuration.FoggyKitchenWebserverInstanceConfiguration.id  
    placement_configurations {
        availability_domain = lookup(data.oci_identity_availability_domains.ADs.availability_domains[1], "name")
        primary_subnet_id = oci_core_subnet.FoggyKitchenWebSubnet.id

    }
    size = "2"
    display_name = "FoggyKitchenInstancePool"
    load_balancers {
        backend_set_name = oci_load_balancer_backendset.FoggyKitchenPublicLoadBalancerBackendset.name
        load_balancer_id = oci_load_balancer_load_balancer.FoggyKitchenPublicLoadBalancer.id
        port = "80"
        vnic_selection = "PrimaryVnic"
    }
}
