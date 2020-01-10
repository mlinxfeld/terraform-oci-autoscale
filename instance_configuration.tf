resource "oci_core_instance_configuration" "FoggyKitchenWebserverInstanceConfiguration" {
    compartment_id = oci_identity_compartment.FoggyKitchenCompartment.id
    display_name = "FoggyKitchenInstanceWebserverConfiguration"
    instance_id = oci_core_instance.FoggyKitchenWebserver.id
    source = "INSTANCE"
}