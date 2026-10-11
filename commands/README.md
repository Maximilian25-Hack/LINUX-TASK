# Commands

`commands.sh` is an ordered command reference for the practical.

It intentionally does **not** automate everything:

- `passwd` requires interactive password entry.
- `su - agent007` changes the interactive account.
- The final `chown` must be performed as the explicitly required root/administrative step.
- File operations are shown under the `agent007` section so the user does not accidentally perform them as root.

Review the comments before running commands.
