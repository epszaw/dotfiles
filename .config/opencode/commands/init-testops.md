Initialize Allure TestOps for this Yarn 4 / Vitest project.

Constraints:
- Do not switch package managers. Use Yarn only; run `corepack enable` before Yarn commands.
- Do not create package-lock.json.
- Allure 3 is already installed via `allure@^3.13.1`; do not reinstall it unless it is missing.
- Keep Vitest Allure results at `./out/allure-results`.
- Do not hardcode TestOps secrets.

Make these changes:
1. Update `allurerc.mjs` TestOps plugin config so it uses environment variables:
   - `ALLURE_TOKEN` -> `accessToken`
   - `ALLURE_ENDPOINT` -> `endpoint`
   - `ALLURE_PROJECT_ID` -> `projectId`
   - `ALLURE_LAUNCH_NAME` -> `launchName`, with a sensible fallback
   - optionally `ALLURE_GIT_FLOW === "true"` -> `gitFlow`

2. Fix the test workflow so one `allure run` wraps both e2e and unit tests.
   Suggested scripts:
   - `test`: `allure run -- yarn run test:ci`
   - `test:ci`: run `test:e2e`, then `test:unit`, then validate Allure results
   - `test:allure-results`: verify `./out/allure-results` exists and is non-empty after tests run, preferably with a portable Node one-liner.

3. Preserve existing Vitest reporter config in:
   - `vitest.config.mts`
   - `vitest.e2e.config.mts`

4. Validation:
   Run, or document if secrets are unavailable:
   `ALLURE_TESTOPS_ENABLED=true ALLURE_ENDPOINT=$ALLURE_ENDPOINT ALLURE_TOKEN=$ALLURE_TOKEN ALLURE_PROJECT_ID=$ALLURE_PROJECT_ID yarn test`

Return the final diff and validation result.
