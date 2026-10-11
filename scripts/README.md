# Scripts

Only one helper script is included because the task is primarily an assessed, manual Linux exercise.

## `verify.sh`

Checks the final workspace paths, expected files, `targets.txt` mode, final `root:root` ownership, and the absence of `keys.txt`.

It does **not** create, delete, modify, or repair the lab. It is a read-only verification helper.

Run it after completing the practical:

```bash
bash scripts/verify.sh
```

It may be run by an administrative account if the final ownership/permissions make some paths inaccessible to an ordinary user.
