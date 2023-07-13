const current_branch = (await $`git branch --show-current`).toString().trim()
const previous_branch = (await $`git rev-parse --symbolic-full-name --abbrev-ref=loose @{-1}`).toString().trim()
await $`git push --quiet -u origin ${current_branch}`
await $`gh pr create --base ${previous_branch} --head ${current_branch} --web`

// Translate to bash:
// #!/bin/bash
//
// function push_and_pr() {
//   local current_branch=$(git branch --show-current)
//   local previous_branch=$(git rev-parse --symbolic-full-name --abbrev-ref=loose @{-1})
//   git push -u origin $current_branch
//   gh pr create --base $previous_branch --head $current_branch --web
// }
