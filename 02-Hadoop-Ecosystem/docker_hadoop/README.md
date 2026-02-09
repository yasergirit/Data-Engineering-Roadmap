# Module 3: Big Data Storage (Hadoop Ecosystem)

This module introduces the core components of Apache Hadoop: HDFS for storage and YARN for resource management.

## 1. Deploying the Hadoop Cluster

Navigate to the directory and spin up the cluster:
```powershell
cd 02-Hadoop-Ecosystem/docker_hadoop
docker-compose up -d
```

### Accessing Interfaces:
- **Namenode UI (HDFS)**: [http://localhost:9870](http://localhost:9870)
- **ResourceManager UI (YARN)**: [http://localhost:8088](http://localhost:8088)

---

## 2. Basic HDFS Operations

Wait for the services to be healthy, then try these commands:

### Create a directory in HDFS:
```powershell
docker exec -it namenode hdfs dfs -mkdir -p /user/root/input
```

### Upload a file to HDFS:
```powershell
# Create a local file first
echo "Hadoop is cool. Data engineering is awesome. Hadoop is powerful." > sample.txt

# Upload to HDFS
docker cp sample.txt namenode:/tmp/sample.txt
docker exec -it namenode hdfs dfs -put /tmp/sample.txt /user/root/input/
```

### List files in HDFS:
```powershell
docker exec -it namenode hdfs dfs -ls /user/root/input/
```

---

## 3. MapReduce Task: WordCount Demo

Hadoop comes with example jars. Let's run the classic WordCount:

```powershell
docker exec -it namenode hadoop jar /opt/hadoop-3.2.1/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.1.jar wordcount /user/root/input /user/root/output
```

### View Results:
```powershell
docker exec -it namenode hdfs dfs -cat /user/root/output/part-r-00000
```

---

## 4. Next Steps: Hive
In the next session, we will mount Hive on top of this storage to perform SQL queries on Big Data.
