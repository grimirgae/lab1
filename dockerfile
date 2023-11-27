FROM debian:12.2
WORKDIR /grimirage/
COPY . /grimirage/
RUN chmod +x ./yashchenko.sh
CMD "/grimirage/yashchenko.sh"
