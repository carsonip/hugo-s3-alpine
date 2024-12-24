# hugo-s3-alpine

DockerHub image: https://hub.docker.com/r/carsonip/hugo-s3-alpine

This is like https://github.com/rabidgremlin/hugo-s3 but with Alpine Linux base image.

The image contains `hugo` and `aws` binaries.

## Using this image on CircleCI

In your project repository, create `.circleci/config.yml`:
```yml
version: 2
jobs:
  build:
    docker:
      - image: carsonip/hugo-s3-alpine

    steps:
      - checkout

      - run:
          name: Build
          command: hugo --minify

      - run:
          name: Upload
          command: |
            cd public
            aws s3 sync . s3://$S3_BUCKET/ --delete
```

Ensure that environment variables `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `S3_BUCKET` are present on CircleCI.
