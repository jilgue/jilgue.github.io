# YAML

## Anchors and Alias

```yaml
definitions:
  steps:
    - step: &build-test
        name: Build and test
        script:
          - mvn package
        artifacts:
          - target/**
pipelines:
  branches:
    develop:
      - step: *build-test
    master:
      - step: *build-test
```

## Overrides and Extensions

```yaml
definitions:
  steps:
    - step: &build-test
        name: Build and test
        script:
          - mvn package
        artifacts:
          - target/**

pipelines:
  branches:
    develop:
      - step: *build-test
    master:
      - step:
          <<: *build-test
          name: Testing on Master #override
          ongoing: false #extension
```
