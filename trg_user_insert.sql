create TRIGGER trg_user_insert
AFTER insert on users
for each ROW
BEGIN
    insert into user_log (user_id, action, created_at)
    values (new.user_id, 'User Created', NOW());
END ;

