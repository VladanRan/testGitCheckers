check_secrets()
{
  have_secrets=false

  # Travis: Secrets are available if we're not running on a fork.
  if [[ -n "${TRAVIS_PULL_REQUEST:-}" ]]; then
    if [[ "$TRAVIS_PULL_REQUEST" == "false" ||
        "$TRAVIS_PULL_REQUEST_SLUG" == "$TRAVIS_REPO_SLUG" ]]; then
          have_secrets=true
    fi
  fi
  # GitHub Actions: Secrets are available if we're not running on a fork.
  # See https://help.github.com/en/actions/automating-your-workflow-with-github-actions/using-environment-variables
  if [[ -n "${GITHUB_WORKFLOW:-}" ]]; then
    if [[ -z "$GITHUB_HEAD_REF" ]]; then
      have_secrets=true
    fi
  fi
}