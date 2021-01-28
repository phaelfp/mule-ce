Supported tags and respective Dockerfile links
* [4.2.0](https://github.com/phaelfp/mule-ce/blob/4.2.0/Dockerfile) 
* [3.9.0](https://github.com/phaelfp/mule-ce/blob/3.9.0/Dockerfile) 
* [3.8.0](https://github.com/phaelfp/mule-ce/blob/3.8.0/Dockerfile)

This image contains MuleSoft Standalone
Alpine Operating System with OpenJDK 8

Example use
docker run -d --rm -p 80:80 -v /path/mule/project:/opt/mule/apps -v /path/mule/log:/opt/mule/log  --name mymule rfpereira/mule-ce
