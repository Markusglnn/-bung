create trigger trg_user_update
after update on users
for each ROW
BEGIN
    insert into user_log(user_id, action, created_at)
    VALUES (new.user_id, 'User Updated', NOW());
END ;