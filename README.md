# Secure File Management & User Configuration on Kali Linux

## Project purpose

This repository is a GitHub-ready workflow for the practical task **“Secure File Management & User Configuration on Kali Linux.”** It is a learning/template package: it does not contain fabricated command output, screenshots, or completed lab results.

The workflow follows the supplied task exactly, including its user, paths, filenames, permission requirements, recovery exercise, and submission requirements.

## Objective

Demonstrate fundamental Linux file-system and user-management commands by creating a secure workspace for a newly created user and organizing files with appropriate permissions and structure.

## Task restrictions

- Create the user `agent007` with a home directory and `/bin/bash`.
- Add `agent007` to the `sudo` group.
- Set a password and switch to `agent007`.
- Perform all file/directory operations as `agent007`, except the explicitly required `useradd`, `usermod`/group configuration, and final ownership change performed as root.
- Do not fabricate evidence or results.
- The final ownership test intentionally changes `intel/targets.txt` to `root:root`.

## Technologies/tools

- Kali Linux
- Bash shell
- `useradd`
- `passwd`
- `su`
- `mkdir`
- `cd`
- `touch`
- `ls`
- shell output redirection (`>`)
- `cp`
- `rm`
- `chmod`
- `chown`
- `history`

## Prerequisites

- A Kali Linux system.
- Administrative access sufficient to create `agent007` and perform the required ownership change.
- A terminal.
- Ability to capture screenshots and save command history.

## Project structure

```text
secure-file-management-user-configuration/
├── README.md
├── .gitignore
├── docs/
│   ├── README.md
│   └── task-overview.md
├── workflow/
│   ├── README.md
│   └── workflow.md
├── commands/
│   ├── README.md
│   └── commands.sh
├── scripts/
│   ├── README.md
│   └── verify.sh
├── evidence/
│   ├── README.md
│   ├── screenshots/
│   │   └── .gitkeep
│   └── terminal-output/
│       └── .gitkeep
└── submission/
    ├── README.md
    ├── command-history.txt
    └── final-output.txt
```

## Workflow

The complete procedure is in [`workflow/workflow.md`](workflow/workflow.md). In summary:

1. Create `agent007` with the required home directory, shell, and sudo-group membership.
2. Set the password and switch to `agent007`.
3. Create `/home/agent007/mission/intel` and `/home/agent007/mission/ops/backup`.
4. Create `targets.txt`, `routes.txt`, and `keys.txt` in `intel`.
5. Produce the three required redirected listings.
6. Copy `routes.txt` to `ops/backup`.
7. Remove `keys.txt`.
8. Set `targets.txt` to mode `640` and verify it.
9. Remove the backup copy of `routes.txt`, then restore it from `intel`.
10. As root, change `targets.txt` ownership to `root:root`; switch back to `agent007` and observe it with `ls -l`.
11. Capture the required final recursive listing and command history.

## Commands

The ordered command reference is in [`commands/commands.sh`](commands/commands.sh). It deliberately marks interactive/manual steps and does not attempt to automate the assessment-critical user switch, password entry, or root ownership step.

## Evidence

The evidence plan is in [`evidence/README.md`](evidence/README.md). No screenshots or terminal output are pre-created because those must come from the student's actual lab session.

Suggested evidence filenames include:

- `01-user-created.png`
- `02-workspace-created.png`
- `03-file-listings.png`
- `04-routes-backed-up.png`
- `05-targets-permissions.png`
- `06-recovery-complete.png`
- `07-root-ownership-observed.png`
- `08-final-directory-structure.png`

## Submission

The supplied task requires:

- command history (`.bash_history` or a copy/paste of commands used)
- screenshot or text file showing `ls -laR /home/agent007/mission/`
- a 4–5 line explanation of `chmod`, `ls -l`, and `useradd`

Templates are provided under `submission/`.

## Expected final state

The expected directory/file arrangement is:

```text
/home/agent007/mission/
├── intel/
│   ├── listing1.txt
│   ├── listing2.txt
│   ├── listing3.txt
│   ├── routes.txt
│   └── targets.txt
└── ops/
    └── backup/
        └── routes.txt
```

`keys.txt` should have been removed. `targets.txt` should have mode `640`; after the ownership exercise its owner/group should be `root:root`.

The listing files' exact contents depend on the point in the session at which each `ls` command is redirected, so this repository does not fabricate their output.

## Troubleshooting

### `su - agent007` fails

Check that the user was created:

```bash
getent passwd agent007
```

Check the shell:

```bash
getent passwd agent007 | cut -d: -f7
```

It should report `/bin/bash`.

### `mkdir` or `touch` reports permission denied

Check that you are actually `agent007`:

```bash
whoami
pwd
```

The file-operation stages should be performed from the `agent007` account.

### `chmod 640 targets.txt` does not show `-rw-r-----`

Run:

```bash
ls -l targets.txt
```

The permission string should begin with:

```text
-rw-r-----
```

### `routes.txt` is missing from backup

Restore it with:

```bash
cp /home/agent007/mission/intel/routes.txt /home/agent007/mission/ops/backup/
```

### `targets.txt` is owned by root

That is expected after the final ownership exercise. The task intentionally requires the root ownership change.

## Final verification checklist

- [ ] `agent007` exists with a home directory.
- [ ] `agent007` uses `/bin/bash`.
- [ ] `agent007` is in the `sudo` group.
- [ ] Workspace directories exist at the required paths.
- [ ] `targets.txt`, `routes.txt`, and `keys.txt` were initially created in `intel`.
- [ ] `listing1.txt`, `listing2.txt`, and `listing3.txt` contain actual redirected listing output.
- [ ] `routes.txt` was copied to `ops/backup`.
- [ ] `keys.txt` was removed.
- [ ] `targets.txt` has mode `640`.
- [ ] The backup `routes.txt` was intentionally removed and then restored.
- [ ] `targets.txt` ownership was changed to `root:root`.
- [ ] The ownership result was observed after switching back to `agent007`.
- [ ] Final `ls -laR /home/agent007/mission/` output was captured.
- [ ] Command history was saved.
- [ ] 4–5 line command explanation was completed.
