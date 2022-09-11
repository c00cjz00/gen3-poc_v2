Compose-Services
=== Build Gen3
* cd ~/
* git clone https://github.com/c00cjz00/gen3-poc_v2.git gen3-poc
* cd gen3-poc
* ./creds_setup.sh gen7.biobank.org.tw
* cp -rf patch/Secrets_biobank patch/Secrets
* ./patch.sh
* docker-compose down
* docker-compose up -d

=== Build TCGA data
* Read and excute build.sh



