set -e
set -u

echo "Starting backup"
PGPASSWORD=${POSTGRES_PASSWORD} pg_dump -Fc -h db -U ${POSTGRES_USER} ${POSTGRES_DB} > /data/${FILENAME}

echo "Backup complete, starting transfer"
aws --region="${S3_REGION}" s3 cp "/data/${FILENAME}" "${S3_BUCKET}"

echo "Transfer complete"
