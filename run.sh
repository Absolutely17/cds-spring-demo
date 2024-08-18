mvn clean package
cd target
# Распаковываем, дабы наша .jar запускалась без использования JarLauncher, что обеспечит возможность использования CDS
java -Djarmode=tools -jar cds-spring-demo-1.0-SNAPSHOT.jar extract
cd cds-spring-demo-1.0-SNAPSHOT
# Запускаем приложение, но говорим ему завершить работу как только контекст будет создан. Это позволит нам подгрузить все необходимые классы и сделать по этому состоянию дамп классов, т.е. наш CDS архив
# Также здесь используется AOT, добавленный в Spring 6 (Spring Boot 3), позволяющий работать с CDS и native image
java -Dspring.aot.enabled=true -Dspring.context.exit=onRefresh -XX:ArchiveClassesAtExit=application.jsa -jar cds-spring-demo-1.0-SNAPSHOT.jar
# Теперь запускаем приложение, но уже с применением ранее созданного CDS архива
java -Xlog:class+load:file=cds.log:tags -Dspring.aot.enabled=true -XX:SharedArchiveFile=application.jsa -jar cds-spring-demo-1.0-SNAPSHOT.jar