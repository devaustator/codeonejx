#########################################################################
## Mandatory connection settings.
## Replace with your OCI account details.
#########################################################################

#tenancy_ocid = "<Replace with your oci tenancy OCID>"
#user_ocid = "<Replace with your oci user OCID>"
#fingerprint = "<Replace with your pem public key fingerprint>"
#private_key_path = "<Replace with Path to your pem private key>"
#compartment_ocid = "<Replace with your oci compartment OCID>"
#region = "<Replace with your region name, e.g: eu-frankfurt-1>"

tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaajcdy6fi7oj46pv4do4qdwtlwu6qevvx43hud5u6jcno3o77sybja"
compartment_ocid = "ocid1.compartment.oc1..aaaaaaaarzcm6ho6wobet5mai3xqsh3ztzbpk47vvlo7sskc5qvaeyq4wz7q"
fingerprint = "96:0e:07:34:4e:d1:ca:af:cc:a5:a9:b5:f4:f7:92:96"
private_key_path = "/home/opc/.oci/oci_api_key.pem"
private_key_password = "1q2w3e4r"
user_ocid = "ocid1.user.oc1..aaaaaaaanqxiapr3rvc5vocczl5pnnstwrlk4b4urmwap2adszshyz3kuzqa"
region = "eu-frankfurt-1"

#########################################################################
## Custom settings.
## Uncomment and change to your own values to override default settings.
#########################################################################


## VCN values
#vcn_name="vcn_oke"
#vcn_dns_label="vcnoke"
#cidr_vcn="10.0.0.0/16"


## Subnet workers
#subnet_workers_ad1_name="workers_1"
#subnet_workers_ad2_name="workers_2"
#subnet_workers_ad3_name="workers_3"
#subnet_workers_ad1_dnslabel="workers1"
#subnet_workers_ad2_dnslabel="workers2"
#subnet_workers_ad3_dnslabel="workers3"
#cidr_subnet_workers_ad1="10.0.10.0/24"
#cidr_subnet_workers_ad2="10.0.11.0/24"
#cidr_subnet_workers_ad3="10.0.12.0/24"


## Subnet Loadbalancers (lbrs)
#subnet_lbrs_ad1_name="lbrs_1"
#subnet_lbrs_ad2_name="lbrs_2"
#subnet_lbrs_ad1_dnslabel="lbrs1"
#subnet_lbrs_ad2_dnslabel="lbrs2"
#cidr_subnet_lbrs_ad1="10.0.20.0/24"
#cidr_subnet_lbrs_ad2="10.0.21.0/24"


## Internet Gateway
#ig_name="gateway-0"

## Route table
#rt_display_name="routetable-0"

## Security Lists
# sl_worker_name="sl_workers"
# sl_lbr_name="sl_lbrs"



# Security List ICMP options
#sl_ingress_icmp_options_type="3"
#sl_ingress_icmp_options_code="4"
