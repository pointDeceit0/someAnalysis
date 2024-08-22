import pandas as pd


def generate_sql_code(path: str, file: str, table_name: str) -> None:
    """
    Print MySQL query to create table and load it to MySQL database with specified type

    Variables:
        path: str
            destination path

        file: str
            csv or excel are allowed
        
        table_name: str
            name of the table in database

    return: None


    Remark: Some code could be change, e.g. here you should delete \r in 'lines terminated by' to import data succesfully
    
    """
    if file == "excel":
        df = pd.read_excel(path)
    elif file == "csv":
        df = pd.read_csv(path)

    name_datatype, name_creating, name_fill_with_nulls = '', '', ''
    for name, dt in zip((col.strip() for col in list(df.columns)), df.dtypes):
        dt = str(dt)
        dts = ''

        if "int" in dt:
            dts = 'INT'
        if "float" in dt:
            dts = 'FLOAT'
        if "object" in dt:
            dts = 'VARCHAR(50)'
        if "date" in dt:
            dts = "DATE"

        name = name if len(name.split()) == 1 else "_".join(name.split())
        name_datatype += f'    {name} {dts},\n'
        name_creating += f'    @{name},\n'
        name_fill_with_nulls += f'    {name} = NULLIF(@{name}, \'\'),\n'

    print(
f"""CREATE TABLE {table_name}(\n{name_datatype[:-2]}\n);

LOAD DATA LOCAL INFILE "{path}" INTO TABLE {table_name}
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\\r\\n'
IGNORE 1 ROWS
(
{name_creating[:-2]}
)
SET {name_fill_with_nulls[2:-2]};"""
    )