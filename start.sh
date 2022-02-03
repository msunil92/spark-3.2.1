#!/bin/sh


pip install -t dependencies -r requirements.txt
cd dependencies
zip -r ../dependencies.zip .
cd ..
spark-submit --master local --name sunil --py-files dependencies.zip  --conf "spark.app.name=true"  test.py