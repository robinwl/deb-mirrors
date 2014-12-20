FROM 				ubuntu:trusty
MAINTAINER 			Robin <robin@naas.io>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
	nginx-full \
	geoip-database

# clean up some unneeded conf
RUN apt-get clean
RUN rm -fr /etc/nginx/
RUN	mkdir /etc/nginx

# add conf
ADD conf/ /etc/nginx/

# add html
add html/ /usr/share/nginx/html/

WORKDIR /etc/nginx
CMD ["nginx"]

EXPOSE 80



