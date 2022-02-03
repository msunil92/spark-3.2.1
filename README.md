

# pip install -t dependencies -r requirements.txt
# cd dependencies
# zip -r ../dependencies.zip .
# apt-get update && apt-get install -y pip vim
# pip install pyspark
# spark-submit --master local --name sunil --py-files dependencies.zip  --conf "spark.app.name=true"  test.py