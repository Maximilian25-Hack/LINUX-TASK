# Task Overview

## Objective

Demonstrate understanding of fundamental Linux file-system and user-management commands by setting up a secure workspace for a newly created user and organizing files with proper permissions and structure.

## Required user

- Username: `agent007`
- Home directory: `/home/agent007`
- Shell: `/bin/bash`
- Group: `sudo`

Required creation command from the task:

```bash
sudo useradd -m -s /bin/bash -G sudo agent007
```

## Workspace

```text
/home/agent007/mission/
├── intel/
└── ops/
    └── backup/
```

## Required files and operations

Inside `intel/`:

- `targets.txt`
- `routes.txt`
- `keys.txt`

Required listing files:

- `listing1.txt` — output of `ls`
- `listing2.txt` — output of `ls -l`
- `listing3.txt` — output of `ls -la`

Required file operations:

- Copy `routes.txt` to `ops/backup/`.
- Remove `keys.txt`.
- Set `targets.txt` permissions to owner read/write, group read-only, others no access (`640`).
- Intentionally remove `ops/backup/routes.txt`.
- Restore it by copying `routes.txt` from `intel/`.

## Ownership exercise

As root, change ownership of:

```text
/home/agent007/mission/intel/targets.txt
```

to another user, with `root` given as the example in the task. This workflow uses the explicit example `root:root`.

Then switch back to `agent007` and inspect the result using `ls -l`.

## Submission requirements

The task requires:

1. `.bash_history` or a copy/paste of commands used.
2. A screenshot or text file showing:
   `ls -laR /home/agent007/mission/`
3. A 4–5 line explanation of `chmod`, `ls -l`, and `useradd`.

## Important restriction

The task says file operations must not be performed as root. After switching to `agent007`, perform the workspace/file operations as that user. The final ownership change is explicitly an elevated/root step.
