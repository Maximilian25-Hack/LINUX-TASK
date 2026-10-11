# Evidence Guide

Do not place fabricated screenshots or fabricated terminal output in this directory.

## Suggested screenshots

| Filename | Capture after | What it proves |
|---|---|---|
| `01-user-created.png` | User/account verification | `agent007` exists with the required configuration |
| `02-workspace-created.png` | Workspace creation | `mission/intel` and `mission/ops/backup` exist |
| `03-file-listings.png` | Listing commands | Required listing files were produced |
| `04-routes-backed-up.png` | Initial copy | `routes.txt` exists in backup |
| `05-targets-permissions.png` | `chmod 640` + `ls -l` | Required permissions |
| `06-recovery-complete.png` | Restore operation | Backup `routes.txt` was recovered |
| `07-root-ownership-observed.png` | Ownership test | `targets.txt` shows `root:root` after switching back |
| `08-final-directory-structure.png` | Final recursive listing | Final required structure and contents |

The task formally requires a screenshot or text file showing:

```bash
ls -laR /home/agent007/mission/
```

It also requires command history and a 4–5 line explanation of `chmod`, `ls -l`, and `useradd`.

## Terminal-output directory

Use `terminal-output/` for actual output captured during your session if you choose to store it in the repository.

Suggested file:

```text
final-ls-laR.txt
```

Do not replace actual output with invented examples.
