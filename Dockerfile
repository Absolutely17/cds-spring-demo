FROM eclipse-temurin:17
COPY target/cds-spring-demo-1.0-SNAPSHOT.jar /app.jar
RUN java -Djarmode=tools -jar /app.jar extract
RUN rm /app.jar
RUN java -Dspring.aot.enabled=true -Dspring.context.exit=onRefresh -XX:ArchiveClassesAtExit=application.jsa -jar /app/app.jar
ENTRYPOINT ["java", "-Xlog:class+load:file=cds.log:tags", "-Dspring.aot.enabled=true", "-XX:SharedArchiveFile=/application.jsa","-jar","/app/app.jar"]