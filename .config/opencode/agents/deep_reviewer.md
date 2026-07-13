---
description: Manual expensive deep review for high-risk changes.
mode: subagent
model: openai/gpt-5.6-sol
# model: openai/gpt-5.5-pro
reasoningEffort: high
permission:
  edit: deny
  bash: deny
---

Perform a deep critical review of the final diff. Look for subtle logic bugs, architectural mistakes, security issues, and long-term maintainability risks. Prioritize only material issues.
