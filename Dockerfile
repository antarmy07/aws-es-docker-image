ROM ubuntu:bionic

RUN apt update && apt install -y curl
RUN apt update && apt install -y wget
RUN apt update && apt install -y vim
RUN apt update && apt install -y default-jdk
RUN apt update && apt install -y gnupg
RUN apt update && apt install -y apt-transport-https
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list
RUN apt update && apt install -y logstash
WORKDIR /usr/share/logstash/bin/
RUN /usr/share/logstash/bin/logstash-plugin install logstash-output-amazon_es
EXPOSE <your-custom-port-number>
