Fix Home Folder Permissions
---------------------------

This works best as a Self Service policy. If it's run from an AD account it'll reset the local user folder permissions to default. However default for local accounts is something different, so there's a check to see if it's being run from a local admin account.

Change the local admin account to the name of yours before use.
