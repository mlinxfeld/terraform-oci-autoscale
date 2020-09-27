output "FoggyKitchenPublicLoadBalancer_Public_IP" {
  value = [oci_load_balancer_load_balancer.FoggyKitchenPublicLoadBalancer.ip_addresses]
}

output "FoggyKitchenBastionServer_PublicIP" {
   value = [data.oci_core_vnic.FoggyKitchenBastionServer_VNIC1.public_ip_address]
}

output "FoggyKitchenWebserver_PrivateIP" {
   value = [data.oci_core_vnic.FoggyKitchenWebserver_VNIC1.private_ip_address]
}