#/bin/bash
export MY_CONTAINER="testci02"
num=`docker ps -a|grep -w "$MY_CONTAINER$"|wc -l`
echo $num
echo $MY_CONTAINER
if [ 0 -eq $num ];then
    docker run \
        -e DISPLAY=unix$DISPLAY \
        --net=host \
        --pid=host \
            --shm-size 64g \
            --ulimit memlock=-1 \
        -v /sys/kernel/debug:/sys/kernel/debug \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /usr/bin/cnmon:/usr/bin/cnmon \
        -it \
        --privileged \
        --name $MY_CONTAINER \
        -v /home:/home \
        -v /share/project:/share/project \
        test_ssh \
           /bin/bash
else
    docker start $MY_CONTAINER
    docker exec -ti $MY_CONTAINER /bin/bash
fi
