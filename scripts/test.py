from pyspark.sql import SparkSession
import sys
import requests
from pyspark.sql.functions import col, explode_outer, lit, expr
from datetime import datetime, timedelta


def test(spark):
    newJson = '{"Name":"something","Url":"https://stackoverflow.com","Author":"jangcy","BlogEntries":100,"Caller":"jangcy"}'
    sc = spark.sparkContext
    df = spark.read.json(sc.parallelize([newJson]))
    app = spark.sparkContext._conf.get("spark.app.name")
    print("App ", app)
    df.show(truncate=False)


if __name__ == '__main__':
    print("Spark Execution Started!")
    spark = SparkSession.builder.master("local[*]").enableHiveSupport().getOrCreate()
    spark.sparkContext.setLogLevel("OFF")

    latestDF = test(spark)

    print("Spark Execution Ended Successfully")
