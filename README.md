## What is GitHub Actions
*   Platform to automate developer workflows
    *   It is but is not only a CI/CD tool, CI/CD is just one of the many workflows it can automate
*   With GitHub actions, whens omething happens in or to your repository, you can execute automatic actions in response
*   Listen to events, depending on the event that occurs, trigger a workflow
    *   Each small task that is automatically trigger in response to an event is an Action (e.g. sorting, labelling, assigning, reproducing, etc.)
    *   These actions make up the workflow
*   The most common workflow is the CI/CD Pipeline
    *   Commit, test, build, push, deploy
*   GitHub Actions comes with workflow templates for the technologies that your app uses
*   Automatically creates a configuration YML file
*   Workflows on GitHub actions are managed by GitHub and are executed on GitHub servers
*   Each job in a workflow runs in a fresh virtual environment
*   Jobs run in parallel by default, so use the "needs" attribute and specify the job it's waiting for to override this
*   There are also attributes you can add to test your application on different operating systems using the strategy, matrix, and os attributes

## Syntax of a Workflow File
*   name: name of workflow (optional)
*   on: name of GitHub event that triggers the workflow (can specify which branches these events apply to) - full list of events on GitHub docs
*   jobs: named groups of actions to be executed in response to events
*   uses: selects an action
    *   the actions/ path in GitHub is where predefined actions are hosted (github.com/actions contains all the actions)
*   run: runs a command-line command

```
name: Name of Workflow

on:
    event:
        branches: [ branch-name ]
    event:
        branches: [ branch-name ]

jobs:
    name of job:

    runs-on: (Ubuntu, Windows, or MacOS) - Ubuntu has Docker pre-isntalled

    steps:
    - uses: acions/selected-action

    - name: Name of Step
        uses: actions/selected-action
        with:
            technology: version number
    
    - name: Name of Step
        run: command-to-run
    - name: Name of Step
        run: command-to-run
```

## Deploying to Docker
*   After creating workflows, the application can and should be Dockerized and publised to DockerHub
*   You can add this as a job in the workflow file
    *   Create its own step, then you can use a command (using the "run" attribute and pipe syntax - which is part of yml to write multi-line commands) or find an action that does this'
    *   Secrets like usernames and passwords can be stored on GitHub
