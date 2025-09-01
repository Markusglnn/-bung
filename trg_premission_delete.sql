create trigger trg_premission_delete
after delete on premissions
for each ROW
BEGIN
    insert into premission_log(premission_id, action, created_at)
    VALUES (old.premission_id, 'Premission Deleted', NOW());
END ;