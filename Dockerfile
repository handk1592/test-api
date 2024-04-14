# stage 1
FROM maven:3.8.4-openjdk-17 AS builder
WORKDIR /app

COPY pom.xml .
COPY src ./src

# 애플리케이션 빌드
RUN mvn clean package -DskipTests

# stage 2
FROM openjdk:11-ea-17-jre-slim

WORKDIR /app

# 빌드된 JAR 파일 복사
COPY --from=builder /app/target/test-api-0.0.1-SNAPSHOT .

# 애플리케이션 실행
CMD ["java", "-jar", "test-api-0.0.1-SNAPSHOT"]