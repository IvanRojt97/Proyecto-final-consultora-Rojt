DROP USER 'read_only@consultora';

flush privileges;

CREATE USER 'read_only@consultora' IDENTIFIED BY 'password_read_only';

GRANT SELECT ON consultora.* TO 'read_only@consultora';

DROP USER 'read_insert_update@consultora';

flush privileges;

CREATE USER 'read_insert_update@consultora' identified BY 'password_read_insert_update';

GRANT SELECT, INSERT, UPDATE ON consultora.* TO 'read_insert_update@consultora';