# Complete Practical Workflow

## Phase 1 — Create the user

### Step 1 — Create `agent007`

**Run as:** administrative user with `sudo`.

```bash
sudo useradd -m -s /bin/bash -G sudo agent007
```

**Purpose:** Creates `agent007`, creates its home directory, selects `/bin/bash`, and adds the user to `sudo`.

**Verification:**

```bash
getent passwd agent007
groups agent007
```

**Expected:** The account exists, its home is `/home/agent007`, its shell is `/bin/bash`, and `sudo` appears among its groups.

**Evidence:** Capture the account/group verification if desired for your lab record. The task's formal screenshot requirement is covered by the final evidence.

### Step 2 — Set the password

**Run as:** administrative user.

```bash
sudo passwd agent007
```

Enter the password interactively.

**Important:** Do not put the password into repository files.

### Step 3 — Switch to `agent007`

```bash
su - agent007
```

Verify:

```bash
whoami
pwd
```

Expected:

```text
agent007
/home/agent007
```

**Evidence:** Capture this only if useful; it proves the remaining file operations are being performed under the required user.

---

## Phase 2 — Create the workspace

### Step 4 — Navigate to the home directory

**Run as:** `agent007`.

```bash
cd /home/agent007
```

### Step 5 — Create the required structure

```bash
mkdir mission
cd mission
mkdir intel
mkdir ops
cd ops
mkdir backup
cd /home/agent007/mission
```

This uses `mkdir` and `cd` explicitly, matching the task.

Verify:

```bash
ls -la
ls -la ops
```

Expected structure:

```text
mission/
├── intel/
└── ops/
    └── backup/
```

**Evidence:** Suggested screenshot `02-workspace-created.png`.

---

## Phase 3 — Create and list files

### Step 6 — Create the three files

```bash
cd /home/agent007/mission/intel
touch targets.txt routes.txt keys.txt
```

Verify:

```bash
ls
```

Expected names:

```text
keys.txt
routes.txt
targets.txt
```

### Step 7 — Create the three required listing files

Run exactly:

```bash
ls > listing1.txt
ls -l > listing2.txt
ls -la > listing3.txt
```

The `>` operator redirects the output of each listing command into its corresponding file.

Inspect them:

```bash
cat listing1.txt
cat listing2.txt
cat listing3.txt
```

**Important:** The listing files are created during this sequence, so later listings may include files that earlier listings did not. That is a real consequence of the required commands, not an error.

**Evidence:** Suggested screenshot `03-file-listings.png`.

---

## Phase 4 — Copy and remove files

### Step 8 — Copy `routes.txt` to backup

**Run as:** `agent007`.

```bash
cp routes.txt /home/agent007/mission/ops/backup/
```

Verify:

```bash
ls -la /home/agent007/mission/ops/backup/
```

Expected: `routes.txt` exists in the backup directory.

**Evidence:** Suggested screenshot `04-routes-backed-up.png`.

### Step 9 — Delete `keys.txt`

```bash
rm keys.txt
```

Verify:

```bash
ls -la /home/agent007/mission/intel/
```

Expected: `keys.txt` is absent.

---

## Phase 5 — Set and verify permissions

### Step 10 — Set `targets.txt` to the required permissions

The task requires:

- owner: read + write
- group: read only
- others: no permissions

This corresponds to mode `640`.

Run:

```bash
chmod 640 targets.txt
```

Verify:

```bash
ls -l targets.txt
```

Expected permission string:

```text
-rw-r-----
```

The owner/group shown at this point should normally reflect the account that created the file; the task later intentionally changes ownership to root.

**Evidence:** Suggested screenshot `05-targets-permissions.png`.

---

## Phase 6 — Simulate an error and recover

### Step 11 — Intentionally remove the backup

```bash
rm /home/agent007/mission/ops/backup/routes.txt
```

Verify it is absent:

```bash
ls -la /home/agent007/mission/ops/backup/
```

### Step 12 — Recover the file

```bash
cp /home/agent007/mission/intel/routes.txt /home/agent007/mission/ops/backup/
```

Verify:

```bash
ls -la /home/agent007/mission/ops/backup/
```

Expected: `routes.txt` is present again.

**Evidence:** Suggested screenshot `06-recovery-complete.png`.

---

## Phase 7 — Ownership exercise

### Step 13 — Leave `agent007`

```bash
exit
```

You should return to the administrative account.

### Step 14 — Change ownership as root

The task says to change ownership to another user, giving root as an example. Use that example:

```bash
sudo chown root:root /home/agent007/mission/intel/targets.txt
```

Verify from the administrative account:

```bash
ls -l /home/agent007/mission/intel/targets.txt
```

Expected owner/group:

```text
root root
```

### Step 15 — Switch back to `agent007`

```bash
su - agent007
```

Observe the result:

```bash
ls -l /home/agent007/mission/intel/targets.txt
```

The file should still show `root root`. This is the required observation after switching back to `agent007`.

**Evidence:** Suggested screenshot `07-root-ownership-observed.png`.

---

## Phase 8 — Capture final output

### Step 16 — Final recursive listing

Run as `agent007`:

```bash
ls -laR /home/agent007/mission/
```

Capture a screenshot or save the output to a text file.

Optional copy of the required output:

```bash
ls -laR /home/agent007/mission/ > ~/final-output.txt
```

Then inspect:

```bash
cat ~/final-output.txt
```

**Evidence:** Suggested screenshot `08-final-directory-structure.png`.

The final structure should contain:

```text
intel/
├── listing1.txt
├── listing2.txt
├── listing3.txt
├── routes.txt
└── targets.txt

ops/
└── backup/
    └── routes.txt
```

`keys.txt` should be absent.

### Step 17 — Save command history

The task accepts `.bash_history` or a copy/paste of commands used.

A convenient copy is:

```bash
history > ~/command-history.txt
```

Copy the resulting content into `submission/command-history.txt`.

Do not claim the template file is your actual history until you replace its placeholder with your real history.

---

## Phase 9 — Complete the explanation

Prepare a 4–5 line explanation covering:

- `chmod`
- `ls -l`
- `useradd`

Use `submission/README.md` as the submission checklist and `submission/final-output.txt` as the final-output placeholder.

---

# Final Verification Checklist

- [ ] `agent007` was created with a home directory.
- [ ] `/bin/bash` is the shell.
- [ ] `agent007` is in the `sudo` group.
- [ ] Password was set.
- [ ] Work was switched to `agent007` for file operations.
- [ ] `/home/agent007/mission/intel/` exists.
- [ ] `/home/agent007/mission/ops/backup/` exists.
- [ ] `targets.txt` was created.
- [ ] `routes.txt` was created.
- [ ] `keys.txt` was created and later removed.
- [ ] `listing1.txt` contains redirected `ls` output.
- [ ] `listing2.txt` contains redirected `ls -l` output.
- [ ] `listing3.txt` contains redirected `ls -la` output.
- [ ] `routes.txt` was copied to backup.
- [ ] `targets.txt` was changed to mode `640`.
- [ ] Permission was verified using `ls -l`.
- [ ] Backup `routes.txt` was intentionally removed.
- [ ] Backup `routes.txt` was restored from `intel`.
- [ ] `targets.txt` ownership was changed to `root:root` as root.
- [ ] Ownership was observed after switching back to `agent007`.
- [ ] `ls -laR /home/agent007/mission/` was captured.
- [ ] Actual command history was saved.
- [ ] 4–5 line explanation was completed.
- [ ] No fabricated evidence was submitted.
