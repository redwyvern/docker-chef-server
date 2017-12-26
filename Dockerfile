FROM docker.artifactory.weedon.org.au/redwyvern/ubuntu-base:xenial

EXPOSE 25/tcp 465/tcp 587/tcp

ENV DEBIAN_FRONTEND=noninteractive

# We disable IPv6 for now, IPv6 is available in Docker even if the host does not have IPv6 connectivity.
RUN 	apt-get update -q -q && \
 	apt-get --yes install \
	wget \
	cron \
	upstart
	
RUN	wget https://packages.chef.io/stable/ubuntu/16.04/chef-server-core_12.11.1-1_amd64.deb && \
	dpkg -i chef-server-core_12.11.1-1_amd64.deb && \
	rm chef-server-core_12.11.1-1_amd64.deb 

COPY reconfigure-chef.sh /root

ENTRYPOINT ["/root/reconfigure-chef.sh"]
