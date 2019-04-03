workflow "Build and Publish ChangeCast" {
  on = "release"
  resolves = ["Publish"]
}

action "Build" {
  uses = "palmerhq/changecast@feature/github-action"
  secrets = ["GITHUB_TOKEN"]
}

action "Publish" {
  needs = "Build"
  uses = "netlify/actions/cli@master"
  args = "deploy --dir=/changecast"
  secrets = ["NETLIFY_AUTH_TOKEN"]
}
