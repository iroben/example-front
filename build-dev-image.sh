#!/bin/bash
pwdStr=`pwd`
dirName=${pwdStr##*/}
buildTime=`date '+%Y%m%d%H%M'`
harborHost="{{docker registry}}"
latestTag=$harborHost/dev/${dirName}:latest
buildTimeTag=$harborHost/dev/${dirName}:${buildTime}
harborUser="user"
harborPasswd="passwd"

npm run build
docker build -t $latestTag -t $buildTimeTag .
docker login $harborHost -u"$harborUser" -p"$harborPasswd"
docker push $latestTag
docker push $buildTimeTag

echo "docker镜像名称： $latestTag"
echo "docker镜像名称： $buildTimeTag"

