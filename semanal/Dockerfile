FROM ubuntu:20.04
COPY . semanal
RUN apt update && apt upgrade -y
RUN apt install -y software-properties-common
RUN apt-get install sudo
RUN sudo apt-get install -y poppler-utils
RUN sudo apt-get install -y curl
VOLUME /var/shared_volume
WORKDIR ../semanal/scripts


RUN chmod +x requirements.sh
RUN chmod +x compocision_carteras_sem.sh
RUN chmod +x total_carteras_sem.sh


RUN ./requirements.sh
RUN ./compocision_carteras_sem.sh 
RUN ./total_carteras_sem.sh

RUN cp composicion_invex_sem.txt carteras_invex_sem.txt /var/shared_volume


