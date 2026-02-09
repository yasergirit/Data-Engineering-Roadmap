# Fast-Paced Data Engineering Roadmap

This roadmap is designed for high-intensity, self-paced learning. It removes fixed timelines, allowing you to master each module and move immediately to the next. The goal is to build a professional portfolio of modern data engineering tools (Big Data, Streaming, Orchestration, Cloud).

## GitHub Portfolio Structure
Organize your learning into a single repository (`Data-Engineering-Roadmap`) with the following structure to showcase your skills to recruiters.

### Repository Layout
```text
Data-Engineering-Roadmap/
├── 01-Foundations/             # Linux, SQL, Docker, Python
├── 02-Hadoop-Ecosystem/        # HDFS, Hive
├── 03-Real-Time-Streaming/     # Kafka, Spark Streaming
├── 04-Big-Data-Processing/     # Spark Core, Optimization
├── 05-Data-Modeling-Warehousing/ # DWH, Delta Lake
├── 06-Orchestration-Airflow/   # DAGs, Workflow Automation
├── 07-DataOps-Cloud/           # CI/CD, AWS, IaC
└── 08-Final-Project/           # End-to-end Capstone Project
```

---

## Module 1: Foundations (Linux & Git)
**Topic:** Master the operating system and version control essentials.

### Action Item:
- Initialize your `Data-Engineering-Roadmap` repository.
- Use `01-Foundations/linux_basics` for your scripts and notes.

### Linux & Bash Scripting
- **Essentials:** File system hierarchy, core commands (`grep`, `find`, `chmod`), and Stream Editors (`sed`, `awk`).
- **Scripts:** Bash variables, loops, and conditionals.
- **Task:** Write a shell script to parse log files, count keywords, and output to a timestamped file.

### Git & GitHub
- **Workflow:** `branch`, `merge`, `pull-requests`.
- **Task:** Push your first automation script to GitHub.

### Job Scheduling (Crontab)
- **Task:** Automate your script to run at a specific time daily using Cron.

---

## Module 2: Development Environments (Docker & SQL)
**Topic:** Standardizing tools and mastering relational data.

### PostgreSQL & SQL
- **Depth:** Window Functions, Subqueries, Indexing strategies.
- **Task:** Run PostgreSQL in Docker, load the "DVD Rental" dataset, and run performance-driven queries.

### Docker & Containerization
- **Skills:** `Dockerfile` architecture, `docker-compose` for multi-service environments.
- **Task:** Containerize a Python app and link it to a database service.

### Python for DE
- **Advanced:** Generators, Decorators, and API ingestion using `requests`.
- **Task:** Build an API-to-CSV ingestion script.

---

## Module 3: Big Data Storage (Hadoop & Hive)
**Topic:** Distributed storage and SQL on Big Data.

### HDFS & YARN
- **Core:** Data distribution, Replication Factor, and Resource Negotiation.
- **Task:** Deploy a Multi-node Hadoop Cluster using Docker.

### MapReduce
- **Task:** Run a WordCount demo on HDFS to understand the Map-Reduce paradigm.

### Apache Hive & Data Formats
- **Concepts:** Managed vs External tables, Parquet/Avro/ORC.
- **Task:** Convert raw CSVs to Parquet using Hive; analyze the performance gains.

---

## Module 4: Real-Time Streaming (Kafka)
**Topic:** High-throughput event streaming.

### Kafka Architecture
- **Core:** Brokers, Partitions, Offsets, and Replication.
- **Task:** Setup a 3-broker cluster. Practice with Console Producers/Consumers.

### Python Development
- **Task:** Build a custom Python Producer (data generator) and a Consumer (processor).

### CDC (Change Data Capture)
- **Task:** Integrate Debezium to stream database changes directly into Kafka topics.

---

## Module 5: Distributed Processing (Apache Spark)
**Topic:** Large-scale data transformation.

### Spark Core & SQL
- **Concepts:** Spark Session, Lazy Evaluation, Transformations vs Actions.
- **Task:** Clean and aggregate 1M+ records from a Parquet source.

### Integration & Submit
- **Task:** Read from Postgres, process with Spark, and write to S3/MinIO. Understand `spark-submit` for cluster deployment.

---

## Module 6: Spark Optimization & Streaming
**Topic:** Performance tuning and micro-batch processing.

### Performance Tuning
- **Skills:** Broadcast Joins, Partitioning vs Bucketing, Caching.
- **Task:** Optimize a slow Join operation using Broadcast techniques.

### Structured Streaming
- **Task:** Connect Spark Streaming to Kafka. Implement `ForEachBatch` to sink data into a database.

---

## Module 7: Data Architecture & Modeling
**Topic:** Warehouse design and modern table formats.

### Lakehouse & Table Formats
- **Skills:** Delta Lake, Iceberg. ACID transactions on storage.
- **Task:** Implement a Delta Table with Upsert/Delete capabilities.

### Data Modeling
- **DW Concepts:** Star Schema, Snowflake Schema, Fact/Dimension tables.
- **Task:** Design a Star Schema for E-commerce sales analytics.

---

## Module 8: Orchestration (Apache Airflow)
**Topic:** Automating the data lifecycle.

### Airflow DAGs
- **Skills:** BashOperator, PythonOperator, Hooks (Postgres/S3).
- **Task:** Deploy Airflow on Docker. Build a DAG that automates an ingestion-to-storage pipeline.

### Advanced Workflows
- **Task:** Implement Branching and XComs for dynamic task execution based on data volume.

---

## Module 9: DataOps & NoSQL
**Topic:** Reliability and non-relational storage.

### DataOps & Testing
- **Skills:** CI/CD via GitHub Actions, Data Quality checks (Great Expectations), Pytest for ETL.
- **Task:** Setup a pipeline that runs unit tests automatically on PR.

### Elasticsearch & Kibana
- **Skills:** Full-text search, Sharding, Visualizations.
- **Task:** Index a dataset into Elasticsearch and build a Kibana dashboard.

---

## Module 10: Cloud & Final Project
**Topic:** AWS Engineering and End-to-End mastery.

### AWS Ecosystem
- **Services:** S3, Glue, Lambda, Athena.
- **Task:** Build a serverless ingestion pipeline (S3 -> Lambda -> Athena).

### Final Capstone: "Real-time Analytics Platform"
1. **Producer:** Python script streaming events to Kafka.
2. **Processor:** Spark Streaming performing windowed aggregations.
3. **Storage:** Sink to Delta Lake (S3) and Postgres (Reporting Layer).
4. **Automation:** Schedule via Airflow.
5. **Dashboard:** Visualize with Superset.

---

## Portfolio & Interview Readiness
- **SQL Mastery:** Finish LeetCode SQL 50.
- **Documentation:** Your GitHub repositories MUST have architecture diagrams and clear setup guides.

**Move at your speed. Master the module, push the code, move on.**
