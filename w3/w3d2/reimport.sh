export db='questions.db'

rm $db
cat import_db.sql | sqlite3 $db

sqlite3 $db