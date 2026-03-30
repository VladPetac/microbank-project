# MicroBank Architecture

## Components
- Account Service: Manages bank accounts (Java/Spring Boot)
- Transaction Service: Handles transfers (Java/Spring Boot)
- PostgreSQL: Database for persistent storage
- Nginx: Reverse proxy / API gateway

## Communication Flow
Client -> Nginx -> Account Service -> PostgreSQL
Client -> Nginx -> Transaction Service -> PostgreSQL

## Environments
- DEV: Local development
- SIT: Integration testing
- UAT: User acceptance testing
- PROD: Production
# Modified by Brach B
