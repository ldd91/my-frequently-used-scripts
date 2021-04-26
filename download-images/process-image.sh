#!/bin/bash
#source ./base.config
source ./base.config

install_fluidimage(){
        images=(dataset-controller:${fluid_version}
                        fluid-csi:${fluid_version}
                        init-users:${fluid_version}
                        alluxioruntime-controller:${fluid_version})
        #for imagename in $images; do
        for imagename in ${images[@]}; do
        docker pull  registry.aliyuncs.com/fluid/$imagename
        docker tag  registry.aliyuncs.com/fluid/$imagename harbor.unisound.ai/lvdongdong/$imagename
        docker save -o $imagename.tar harbor.unisound.ai/lvdongdong/$imagename
        done
}

install_alluxioimage(){
        images=(alluxio:${alluxio_version}
                        alluxio-fuse:${alluxio_version})
        #for imagename in $images; do
        for imagename in ${images[@]}; do
        docker pull  registry.aliyuncs.com/alluxio/$imagename
        docker tag  registry.aliyuncs.com/alluxio/$imagename harbor.unisound.ai/lvdongdong/$imagename
        docker save -o $imagename.tar harbor.unisound.ai/lvdongdong/$imagename
        done
}
main(){
echo "开始下载镜像"
  install_fluidimage
  install_alluxioimage
echo "镜像已经打包完毕"
echo "开始上传镜像到 10.10.20.230"
scp ./*tar  lvdongdong@10.10.20.230:/home/lvdongdong/import
echo "镜像上传完毕"
}
main

