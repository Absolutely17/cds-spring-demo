docker container rm cds_test
docker build -t cds_test .
docker run -d --name cds_test -p 8080:8080 cds_test