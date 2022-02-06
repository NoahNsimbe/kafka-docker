FROM openjdk:8 as base

RUN wget https://dlcdn.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz

RUN tar -xzf kafka_2.13-3.1.0.tgz && mkdir kafka && cp -r kafka_2.13-3.1.0/* kafka/
RUN rm kafka_2.13-3.1.0.tgz && rm -r kafka_2.13-3.1.0/

FROM base as zookeeper
EXPOSE 2181
CMD ["kafka/bin/zookeeper-server-start.sh", "kafka/config/zookeeper.properties"]

FROM base as broker
RUN sed -i 's/zookeeper.connect=localhost:2181/zookeeper.connect=zookeeper:2181/g' kafka/config/server.properties
EXPOSE 9092
CMD ["kafka/bin/kafka-server-start.sh", "kafka/config/server.properties"]

FROM base as docker-image
COPY bootstrap.sh /bootstrap.sh
RUN chmod +x /bootstrap.sh
EXPOSE 9092 2181
ENTRYPOINT ["/bootstrap.sh"]