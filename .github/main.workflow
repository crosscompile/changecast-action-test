workflow "Build and Publish ChangeCast" {
  on = "release"
  resolves = ["palmerhq/changecast@feature/github-action"]
}

action "palmerhq/changecast@feature/github-action" {
  uses = "palmerhq/changecast@feature/github-action"
  secrets = ["GITHUB_TOKEN"]
}
