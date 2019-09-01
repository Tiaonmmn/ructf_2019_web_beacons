FROM phusion/baseimage
COPY files/ /tmp
RUN useradd -s /bin/false mongodb &&\
    tar xzvf /tmp/mongo_bins.tar.gz -C /usr/bin/ &&\
    chown -v root:root /usr/bin/mongo /usr/bin/mongod &&\
    mkdir /var/lib/mongodb &&\
    mkdir /var/mongo &&\
    chown -R -v mongodb:mongodb /var/lib/mongodb /var/mongo &&\
    # Config MongoDB.
    sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list &&\
    apt update &&\
    apt -y install python3-pip libcurl3 &&\
    pip3 install -r /tmp/src/requirements.txt -i https://pypi.douban.com/simple &&\
    useradd -s /bin/false beacons &&\
    mkdir /home/beacons &&\
    mv -v /tmp/src/* /home/beacons/ &&\
    chmod -R -v 660 /home/beacons/ &&\
    chmod -v 770 /home/beacons &&\
    chmod -v 770 /home/beacons/beacons &&\
    chmod -v 770 /home/beacons/beacons/controllers &&\
    chmod -v 770 /home/beacons/beacons/repositories &&\
    chmod -v 770 /home/beacons/beacons/static &&\
    chmod -v 770 /home/beacons/beacons/templates &&\
    chmod -v 770 /home/beacons/beacons/static/css &&\
    chmod -v 770 /home/beacons/beacons/static/images &&\
    chmod -v 770 /home/beacons/beacons/static/js &&\
    chmod -v 755 /home/beacons/main.py &&\
    chmod -v 755 /home/beacons/data_cleaner.py &&\
    chown -R -v beacons:beacons /home/beacons/ &&\
    # Config beacons service.
    mkdir /etc/service/mongodb &&\
    mv /tmp/mongodb_service /etc/service/mongodb/run &&\
    chmod +x /etc/service/mongodb/run &&\
    mkdir /etc/service/beacons &&\
    mv /tmp/beacons_service /etc/service/beacons/run &&\
    chmod +x /etc/service/beacons/run &&\
    # Run service after docker start.
    mv /tmp/random.py /usr/lib/python3.5/
EXPOSE 8000
