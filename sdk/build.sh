# build
## 1. go to app folder
cd gen3-poc_v2/sdk

## 2. delete json
find /tmp -name 'json*' | xargs rm ;

## 3. upload credentials.json
### copy credentials.json to current Folder and '~/.gen3/ Folder
cp credentials.json ~/.gen3/ 
tar xzvf tcga_data.tgz

## 4. create program
### repleace gen7.biobank.org.tw to your domain name, and replace the command that contains gen7.biobank.org.tw to your domain name below
https://gen7.biobank.org.tw/_root


## 5. create project 
php 10-gdc_project_add.php TCGA

## 6. create experiment
php 11-gdc_experiment_add.php TCGA

## 7. buid manifest
php 01-gdc_manifest_add.php TCGA > tmp_add.sh
chmod 755 tmp_add.sh
sleep 2
cat tmp_add.sh | parallel -j 36
sleep 2
find /tmp -name 'json*' | xargs rm ;

## 8. create metadata
### conda activate g3po4
### export GEN3_URL=https://gen7.biobank.org.tw/
gen3_metadata_add () {
 echo 'test' > tmp_add.sh
 for i in {1..5};
 do
  if [ -s tmp_add.sh ]; then
   echo Round: $i
   php $app $program > tmp_add.sh
   chmod 755 tmp_add.sh
   sleep 2
   cat tmp_add.sh | parallel -j $jobs
   sleep 2
   find /tmp -name 'json*' | xargs rm ;
  fi
 done
}

### 8.1 case
program='TCGA'
app='12-gdc_case_add.php'
jobs=36
gen3_metadata_add

### 8.2 demographic
program='TCGA'
app='13-gdc_demographic_add.php'
jobs=36
gen3_metadata_add

### 8.3 diagnosis
program='TCGA'
app='14-gdc_diagnosis_add.php'
jobs=36
gen3_metadata_add

### 8.4 samples
program='TCGA'
app='15-gdc_samples_add.php'
jobs=36
gen3_metadata_add

### 8.5 slide
program='TCGA'
app='16-gdc_slide_add.php'
jobs=36
gen3_metadata_add

### 8.6 slide_image
program='TCGA'
app='17-gdc_slide_image_add_submit_id.php'
jobs=36
gen3_metadata_add







