import duckdb
from tabulate import tabulate

# Path to your DuckDB file (can be inside or outside the container)
db_path = "../duckdb_data_warehouse/duckdb_database/synthea.duckdb"

# Path to your`` SQL query file
sql_file = "./queries/claims_transaction.sql"
dashboard_demographics_sql_file = "./queries/dashboards/demographics/race_eth.sql"
dashboard_maps_sql_file = "./queries/dashboards/maps/gender_distribution.sql"


# Connect to the database
con = duckdb.connect(db_path)

# Read and execute the SQL query
with open(dashboard_demographics_sql_file, "r") as f:
    sql = f.read()
    result = con.execute(sql).fetchdf()

# Print or process results
print(result)
# Pretty print as table
# print(tabulate(result, headers="keys", tablefmt="psql"))
