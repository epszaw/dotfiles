---
description: Inspect and remediate Dependabot vulnerability alerts in one coherent PR-ready changeset.
agent: build
---

Fix Dependabot vulnerability alerts for this repository in a single coherent changeset.

User-supplied scope, alert URLs, package names, CVEs, or notes:

$ARGUMENTS

## Goal

Remediate the relevant Dependabot vulnerability alerts in one PR-ready changeset, using the smallest safe dependency, lockfile, configuration, or manifest changes needed.

Prefer minimal safe changes over broad upgrades. Do not perform unrelated refactors, formatting-only edits, or cleanup outside the vulnerability remediation scope.

Make changing attempt for a single package at once, don't fix the next one until the previous passed validation stage!

## Workflow

1. Inspect current state without overwriting unrelated user changes.
   - Check git status before editing.
   - Note any pre-existing user changes.
   - Read only relevant manifests, lockfiles, dependency configuration, and security alert context.

2. Determine the repository’s technologies and package manager(s) before fixing anything.
   - Identify languages, frameworks, workspace or monorepo layout, package manifests, lockfiles, dependency groups, tool versions, and repo-specific install/test/build commands.
   - Use the package manager and tooling the repository actually uses, such as npm, yarn, pnpm, Maven, Gradle, pip, Poetry, Pipenv, uv, Bundler, Cargo, Go modules, NuGet, Composer, or another ecosystem-specific tool.

3. Map each alert to the affected dependency path.
   - Determine which manifest or lockfile is affected.
   - Determine whether each vulnerable package is direct or transitive.
   - Prefer normal package-manager upgrade or resolution mechanisms.
   - Use overrides, resolutions, constraints, or equivalent mechanisms only when necessary and supported by the ecosystem.

4. Apply one consolidated, minimal remediation.
   - Update only the relevant manifest, lockfile, dependency, or security configuration files needed to address the alerts.
   - Keep version changes as narrow, stable, and compatible as practical.
   - Avoid broad dependency refreshes unless required by the package manager or necessary to fix the vulnerabilities.
   - Do not modify unrelated files.

5. Validate with technology-aware commands.
   - First choose validation commands based on the detected stack, package manager(s), and repository conventions.
   - Run the appropriate security audit or vulnerability command for the affected ecosystem when available.
   - Run relevant install or lockfile consistency checks.
   - Run relevant tests, lint/typecheck, and build commands when present and reasonably scoped.
   - If a validation command is unavailable, too expensive, or cannot run in the environment, explain why and provide the exact command the maintainer should run.

6. Review the resulting diff.
   - Confirm changed files are limited to intended manifests, lockfiles, and dependency/security configuration.
   - Confirm no unrelated files or pre-existing user changes were modified.
   - Confirm the change set is coherent and PR-ready.

7. Final response:
   - Summarize fixed alerts, CVEs, advisories, and affected packages.
   - Summarize dependency/version changes and files changed.
   - List validation commands run and their results.
   - List any remaining findings, accepted risks, or follow-up actions.

Do not change unrelated files.
