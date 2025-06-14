import sys
import snowflake.connector
import os

PR_NUM = sys.argv[1]
schemas_to_delete = [
    f"STAGING_PR_{PR_NUM}",
    f"INTERMEDIATE_PR_{PR_NUM}",
    f"MART_PR_{PR_NUM}",
]

conn = snowflake.connector.connect(
    user=os.environ["SNOWFLAKE_USER"],
    password=os.environ["SNOWFLAKE_PASSWORD"],
    account=os.environ["SNOWFLAKE_ACCOUNT"],
    role=os.environ["SNOWFLAKE_ROLE"],
    warehouse=os.environ["SNOWFLAKE_WAREHOUSE"],
    database=os.environ["SNOWFLAKE_DATABASE"],
)

cursor = conn.cursor()
for schema in schemas_to_delete:
    try:
        print(f"Attempting to drop schema: {schema}")
        cursor.execute(f'DROP SCHEMA IF EXISTS "{schema}" CASCADE;')
        print(f"Dropped schema: {schema} successfully")
    except Exception as e:
        print(f"Failed to drop schema {schema}: {e}")

cursor.close()
conn.close()
