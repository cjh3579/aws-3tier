# aws-3tier


🚀 AWS 3-Tier Web-DB 인프라 구축 (Terraform)
📌 프로젝트 개요
이 프로젝트는 AWS 클라우드 환경에서 고가용성(High Availability), 확장성(Scalability), 보안(Security)을 고려한 3-Tier 아키텍처를 구축하는 것을 목표로 합니다.
Terraform을 활용하여 AWS 인프라를 코드로 관리하고, Auto Scaling + Load Balancing을 적용하여 트래픽 증가 시 EC2를 자동 확장하며, RDS(MySQL) 클러스터를 이용해 안정적인 데이터베이스 운영을 보장합니다.

📌 사용 기술
AWS 서비스: VPC, EC2, ALB, Auto Scaling, RDS(MySQL), Security Group
IaC (Infrastructure as Code):** Terraform
웹 서버: Apache (httpd), PHP
데이터베이스: MySQL (AWS RDS)
📌 3-Tier 아키텍처 구성
📌 작동 방식

사용자가 웹사이트 접속 (http://ALB-DNS)
ALB가 요청을 ASG 내 EC2 웹 서버로 전달
EC2는 PHP 기반 웹 애플리케이션 실행 & RDS(MySQL)에서 데이터 조회
MySQL DB에서 데이터를 받아 사용자에게 웹 페이지로 응답
트래픽 증가 시 Auto Scaling이 EC2 인스턴스를 자동 추가하여 부하 분산
DB 장애 발생 시 RDS 클러스터의 다른 인스턴스로 자동 전환
📂 miniporject2
┣ 📂 modules # Terraform 모듈화된 코드
┃ ┣ 📂 network # VPC, Subnet, IGW 등
┃ ┣ 📂 security_groups # 보안 그룹 설정
┃ ┣ 📂 alb # Application Load Balancer
┃ ┣ 📂 autoscaling # Auto Scaling + EC2 설정
┃ ┣ 📂 database # RDS (MySQL)
┣ 📄 main.tf # Terraform 메인 코드
┣ 📄 variables.tf # 변수 정의
┣ 📄 outputs.tf # 출력 값 정리
┣ 📄 README.md # 프로젝트 설명 문서
┣ 📄 .gitignore # Terraform, AWS Key 등 제외 파일
