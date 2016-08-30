# Run from within the directory with the Dockerfile, NOT your home dir
# Change DOCKERCMD to meet your needs

# DOCKERCMD='ksu -k -e /usr/bin/docker'
DOCKERCMD='/usr/local/bin/docker'
$DOCKERCMD build -t iperl . && \
$DOCKERCMD run -it --name=iperl --rm -p 8889:8888 -v /Users/prubenstein1/notebooks:/notebooks iperl
