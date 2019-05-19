FROM java:8
MAINTAINER nanhaidetianzhi <957186816@qq.com>
VOLUME /tmp
ADD yatoujiang-api-im-0.0.1-SNAPSHOT.jar app.jar
RUN bash -c 'touch /app.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]