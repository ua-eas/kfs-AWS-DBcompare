-- do not run on kfs7imp only on a provisioned db
exec mv_replicate.remove_mv('KULOWNER','Y')
