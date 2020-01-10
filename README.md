# Terraform OCI Instance Autoscaling 

## Project description

In this repository, I have documented my hands on experience with Terrafrom for the purpose of OCI Instance Autoscaling deployment. This set of HCL based Terraform files whioch can customized according to any requirements.   
## How to use code 

### STEP 1.

Clone the repo from github by executing the command as follows and then go to terraform-oci-autoscale directory:

```
[opc@terraform-server opc]$ git clone https://github.com/mlinxfeld/terraform-oci-autoscale.git
Cloning into 'terraform-oci-autoscale'...
remote: Enumerating objects: 19, done.
remote: Counting objects: 100% (19/19), done.
remote: Compressing objects: 100% (16/16), done.
remote: Total 19 (delta 3), reused 19 (delta 3), pack-reused 0
Unpacking objects: 100% (19/19), done.

[opc@terraform-server opc]$ cd terraform-oci-autoscale/

[opc@terraform-server terraform-oci-autoscale]$ ls -latr
total 76
drwxrwxr-x. 4 opc opc   74 01-10 11:25 ..
-rw-rw-r--. 1 opc opc  290 01-10 11:25 README.md
-rw-rw-r--. 1 opc opc 1741 01-10 11:25 loadbalancer.tf
-rw-rw-r--. 1 opc opc  250 01-10 11:25 internet_gateway.tf
-rw-rw-r--. 1 opc opc  740 01-10 11:25 instance_pool.tf
-rw-rw-r--. 1 opc opc  313 01-10 11:25 instance_configuration.tf
-rw-rw-r--. 1 opc opc 1444 01-10 11:25 instance_autoscaling.tf
-rw-rw-r--. 1 opc opc  442 01-10 11:25 dhcp_options.tf
-rw-rw-r--. 1 opc opc  144 01-10 11:25 compartment.tf
-rwxrwxr-x. 1 opc opc 1115 01-10 11:25 bastionserver.tf
-rw-rw-r--. 1 opc opc 1080 01-10 11:25 webserver_instance.tf
-rw-rw-r--. 1 opc opc  225 01-10 11:25 vcn.tf
-rw-rw-r--. 1 opc opc 1056 01-10 11:25 variables.tf
-rw-rw-r--. 1 opc opc 1567 01-10 11:25 subnets.tf
-rw-rw-r--. 1 opc opc 1445 01-10 11:25 security_lists.tf
-rw-rw-r--. 1 opc opc  852 01-10 11:25 routes.tf
-rw-rw-r--. 1 opc opc  239 01-10 11:25 provider.tf
-rw-rw-r--. 1 opc opc  235 01-10 11:25 natgateway.tf
drwxrwxr-x. 8 opc opc 4096 01-10 11:25 .git
drwxrwxr-x. 3 opc opc 4096 01-10 11:25 .

```

### STEP 2.

Within web browser go to URL: https://www.terraform.io/downloads.html. Find your platform and download the latest version of your terraform runtime. Add directory of terraform binary into PATH and check terraform version:

```
[opc@terraform-server terraform-oci-autoscale]$ export PATH=$PATH:/home/opc/terraform

[opc@terraform-server terraform-oci-autoscale]$ terraform --version

Terraform v0.12.16

Your version of Terraform is out of date! The latest version
is 0.12.17. You can update by downloading from https://www.terraform.io/downloads.html
```

### STEP 3. 
Next create environment file with TF_VARs:

```
[opc@terraform-server terraform-oci-autoscale]$ vi setup_oci_tf_vars.sh
export TF_VAR_user_ocid="ocid1.user.oc1..aaaaaaaaob4qbf2(...)uunizjie4his4vgh3jx5jxa"
export TF_VAR_tenancy_ocid="ocid1.tenancy.oc1..aaaaaaaas(...)krj2s3gdbz7d2heqzzxn7pe64ksbia"
export TF_VAR_compartment_ocid="ocid1.tenancy.oc1..aaaaaaaasbktyckn(...)ldkrj2s3gdbz7d2heqzzxn7pe64ksbia"
export TF_VAR_fingerprint="00:f9:d1:41:bb:57(...)82:47:e6:00"
export TF_VAR_private_key_path="/tmp/oci_api_key.pem"
export TF_VAR_region="eu-frankfurt-1"
export TF_VAR_private_key_oci="/tmp/id_rsa"
export TF_VAR_public_key_oci="/tmp/id_rsa.pub"

[opc@terraform-server terraform-oci-autoscale]$ source setup_oci_tf_vars.sh
```

### STEP 4.
Run *terraform init* with upgrade option just to download the lastest neccesary providers:

```
[opc@terraform-server terraform-oci-autoscale]$ terraform init -upgrade

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "null" (hashicorp/null) 2.1.2...
- Downloading plugin for provider "oci" (hashicorp/oci) 3.54.0...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.null: version = "~> 2.1"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

### STEP 5.
Run *terraform apply* to provision the content of this lesson (type **yes** to confirm the the apply phase):

```
[opc@terraform-server terraform-oci-autoscale]$ terraform apply

(...)

```

### STEP 6.
After testing the environment you can remove the OCI autoscale infra. You should just run *terraform destroy* (type **yes** for confirmation of the destroy phase):

```
[opc@terraform-server terraform-oci-autoscale]$ terraform destroy

(...)

```
