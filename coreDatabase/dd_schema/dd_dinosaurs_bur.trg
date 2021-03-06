CREATE OR REPLACE TRIGGER dd_dinosaurs_bur
BEFORE UPDATE
ON dd_dinosaurs
FOR EACH ROW
  DECLARE
  BEGIN
    :new.changed_on := nvl(:new.changed_on, localtimestamp);
    :new.changed_by := coalesce(SYS_CONTEXT('APEX$SESSION', 'APP_USER'),USER);
  END dd_dinosaurs_bur;
/