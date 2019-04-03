workflow "Build and Publish ChangeCast" {
  on = "release"
  resolves = [
    "Publish",
    "GitHub Action for Zeit",
  ]
}

action "Build" {
  uses = "palmerhq/changecast@feature/github-action"
  secrets = ["GITHUB_TOKEN"]
}

action "Publish" {
  needs = "Build"
  uses = "netlify/actions/cli@master"
  args = "deploy --dir=./changecast --prod"
  secrets = [
    "NETLIFY_AUTH_TOKEN",
    "NETLIFY_SITE_ID",
  ]
}

action "GitHub Action for Zeit" {
  uses = "actions/zeit-now@1.0.0"
  needs = ["Build"]
  args = "./changecast"
  secrets = ["ZEIT_TOKEN"]
}
