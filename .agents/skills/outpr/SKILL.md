---
name: outpr
description: Output PR title and description as code blocks from current branch changes and original task or issue context. Summarize changes in 1-3 user-facing paragraphs, provide examples or fixed scenarios when useful, target users/customers rather than developers, and include fixes #123-style lines for issues this PR closes. Use when the user invokes /outpr or $outpr, or asks for PR title and description.
---

# Out PR

## Overview

Draft PR copy from the current branch changes and the original task context. Summarize the change for users and customers, not developers, while staying concrete about the problem being solved and what improved or was fixed.

## Workflow

1. Inspect the current Git state before drafting:
   - Current branch name.
   - `git status --short`.
   - Upstream branch or likely base branch.
   - Commit list since the base.
   - Changed files and diff stat.
   - Relevant diffs needed to understand user impact.
2. Choose the comparison base in this order:
   - Upstream fork point, when available.
   - `origin/main`.
   - `origin/master`.
   - `main`.
   - `master`.
3. Include uncommitted worktree changes in the analysis, because they are part of the branch state the user is asking about.
4. Recover the original problem context before drafting:
   - Use the current conversation, the original user request, linked issue title/body, acceptance criteria, branch name, and commit messages when available.
   - Preserve the main task, problem, user need, or product intent behind the change.
   - Ignore implementation debates, review comments, temporary constraints, and session-only notes that are not part of the user-facing reason for the change.
   - Identify issue numbers that this PR clearly closes from explicit context such as "fixes #123", "closes #123", the issue being worked on, or a branch/commit that unambiguously names the issue.
5. Synthesize the actual shipped value:
   - Summarize the changes in 1-3 focused paragraphs.
   - Name the user-facing improvement, fixed workflow, corrected behavior, or enabled use case.
   - Include the original task/problem intent when it clarifies why the change matters.
   - Provide concrete examples or fixed scenarios when they help users understand the impact.
   - Prefer "what users can now do" and "what no longer goes wrong" over implementation mechanics.
6. Keep the audience and tone user-facing:
   - Write for product users, customers, support, sales, or release-note readers.
   - Use product and domain language when it helps clarity.
   - Do not flatten the message into vague business-speak; preserve specific behavior and outcomes.
7. Exclude unnecessary technical or contributor-centered details:
   - Do not include file lists, implementation mechanics, test commands, refactor notes, or internal constraints from the conversation.
   - Do not mention session-only tradeoffs or constraints unless they are directly relevant to the customer-facing outcome.
   - Avoid developer jargon unless the target users would naturally use the same term.

## Output

Return exactly two labeled code blocks and no extra commentary:

PR Title

```text
<one concise customer-oriented title>
```

PR Description

```markdown
<1-3 concise paragraphs summarizing the user-facing change; include examples or fixed scenarios when useful>

fixes #<issue-number-if-this-pr-closes-it>
```

Use paragraphs by default. Use bullets only when the branch contains several distinct user-facing changes and bullets make the description easier to scan.

When the PR closes multiple issues, append one lowercase closing line per issue at the end of the PR Description code block:

```markdown
fixes #123
fixes #456
```

Only include `fixes #<number>` lines for issues that this PR closes with high confidence. Do not invent issue numbers, and do not use a closing line for an issue that is merely related.
