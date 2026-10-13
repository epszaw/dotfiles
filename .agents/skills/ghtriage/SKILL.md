---
name: ghtriage
description: Triage GitHub repository issues one at a time and create Asana backlog tasks based on the user's decisions. Supports assignee initials, rescanning, and drafting issue replies.
---

# Sort GitHub issues

Start an interactive triage session for the GitHub repository URL provided
by the user, for example:

/sort-gh-issues https://github.com/allure-framework/allure3

Use the workflow and personal defaults below unless the user overrides them.

## Asana destination

- Project: Dev
- Project ID: 1214361183071382
- Backlog section ID: 1216746598701103

Verify access and that the section still belongs to the project.
If unavailable, ask for a replacement destination.

## Assignee IDs

Use initials as IDs, case-insensitively.

| ID | Name | Asana user ID |
|---|---|---|
| DE | Dmitrii Evreinov | 1214634519537121 |
| AC | Andrejs Cunskis | 1218058561655565 |
| VD | Vadim Dvukhzhilov | 1214634519558528 |
| AN | Aleksandr Novikov | 1214634533115656 |
| MS | Maksim Stepanov | 1214634741970847 |
| AZ | Alexandra Zorina | 1214634617874664 |
| KE | Konstantin Epishev | 1214387448016906 |
| PR | Pavel Ratushny | 1214634533197675 |

ID changes apply to future decisions. Do not reassign existing tasks
unless requested. Clarify unknown or ambiguous IDs.

## Build the queue

1. Resolve the repository and verify GitHub access.
2. Fetch all open issues, excluding pull requests. Follow pagination or
   partition searches until coverage is complete; a capped search result
   is not a complete repository scan.
3. Read Asana project tasks, including completed tasks, with pagination.
   Match original issue URLs in task descriptions to identify existing work.
   Use repository identity and issue number, not the number alone.
4. Exclude issues already represented in Asana and issues explicitly skipped
   or removed from the queue in this session. Missing Asana tasks do not mean
   previously skipped issues are unprocessed.
5. Preserve a user-provided order. Otherwise, suggest an order based on
   reported impact, with bugs before enhancements. Place issues older than
   one year at the end, retaining impact order within that group.
6. Calculate counts from the actual queue. Report any incomplete scan or
   access limitation instead of claiming exhaustive coverage.

Keep a session ledger of the queue, current issue, decisions, assignees,
and created Asana task URLs. Preserve it through conversation compaction.
Do not imply that conversation-only skip decisions persist across new sessions.

## Present one issue at a time

Read the issue body and relevant comments before presenting it. Prefer
maintainer clarifications and verified current behavior over assumptions
in the original report. Do not reproduce the bug or inspect the codebase
unless needed for a specific follow-up request.

Use this format:

**{position}/{total} — [#{number}: {title}]({issue_url})**

- **Summary:** Briefly describe the problem or request, impact, and any
  material workaround or uncertainty.
- **My priority:** **{priority}** — one short reason.

Reply `skip`, `back`, or an assignee ID.

Suggested priorities:

- P1 / High: serious correctness, security, data loss, or blocked workflows.
- P2 / Medium: meaningful defects or capabilities with moderate impact.
- P3 / Low: usability, documentation, polish, or specialized enhancements.
- Unprioritized: insufficient information to assess.

Treat unverified claims as reported behavior. Do not label every feature
request a bug or present a proposed implementation as a confirmed fix.
Priority is advisory; do not set an Asana priority field unless requested.

## Apply the user's decision

- `skip`: record the decision and move on without external changes.
- `back`: create an unassigned task in the Asana Backlog.
- An assignee ID: create the Backlog task assigned to that person.

Ignore incidental trailing punctuation and whitespace.

A decision authorizes the corresponding Asana creation; do not ask for
another confirmation.

Every created task must contain:

- A clear title faithful to the issue.
- A concise summary preserving important requirements and uncertainty.
- The canonical original GitHub issue link.

Do not add deadlines, extra projects, or speculative requirements.

Check for an existing matching task before creation. If one exists, report
its link rather than creating a duplicate. Do not silently move or reassign
existing work.

After successful creation, record and return the Asana link and assignee,
then present the next issue. If creation fails or its outcome is uncertain,
resolve the current operation before advancing. Check for a created task
before retrying an ambiguous response.

Do not modify GitHub issues, assignments, labels, comments, or status merely
because an Asana task was created or an issue was skipped.

## Follow-up behavior

- A specific issue URL plus an assignee ID means create that task directly,
  even if the issue was previously skipped. Then resume the existing queue.
- A replacement list becomes the remaining queue. Do not interpret omitted
  issues as closed, or modify their existing Asana tasks.
- A request for remaining links returns only the unprocessed queue links,
  without grouping when the user asks for that format.
- A request to draft a human-like reply returns ready-to-paste prose.
  Read comments when the reply depends on them. Do not post or close an
  issue unless explicitly instructed to perform those actions.
- Drafting a reply does not advance the queue. Wait for the next decision.
- A rescan checks the repository's current open issues against both Asana
  and the session ledger, including newly opened issues. Do not simply
  repeat the old queue or reintroduce skipped issues without being asked.
- When finished, confirm completion of the processed queue. Distinguish
  this from claiming that every current repository issue was scanned.
