FROM gradle:5.1.0-jdk11
USER root
WORKDIR /http4k
COPY build.gradle build.gradle
COPY settings.gradle settings.gradle
COPY apache apache
COPY core core
COPY jetty jetty
COPY ktorcio ktorcio
COPY netty netty
COPY undertow undertow
RUN gradle --quiet build netty:shadowJar
CMD ["java", "-server", "-XX:+UseNUMA", "-XX:+UseParallelGC", "-XX:+AggressiveOpts", "-XX:+AlwaysPreTouch", "-jar", "netty/build/libs/http4k-netty-benchmark.jar"]
