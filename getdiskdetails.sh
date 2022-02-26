##gcloud get Unattached PVC details
##Author Suave Bajaj
for nameofproject in `cat <file_name>`;
do 
 echo "Get the project name :$nameofproject"
 diskname=`gcloud compute disks list --filter="-users:*" --project=$nameofproject | grep -i READY | awk '{print $1 "," $2}'`
 for disk_name in $diskname;
 do
 echo $disk_name
 diskzone=`echo $disk_name | awk -F "," '{print $2}'`
 name_disk=`echo $disk_name | awk -F "," '{print $1}'`
 echo "Disk Name is = $name_disk", 
 echo "Zone is = $diskzone"
 desc=`gcloud compute disks describe $name_disk --project=$nameofproject --zone=$diskzone | grep Timestamp`
 echo $desc "\n"
 done
done
