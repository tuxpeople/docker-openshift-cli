# openshift-cli
![Github Workflow Badge](https://github.com/tuxpeople/docker-openshift-cli/actions/workflows/release.yml/badge.svg)
![Github Last Commit Badge](https://img.shields.io/github/last-commit/tuxpeople/docker-openshift-cli)
![Docker Pull Badge](https://img.shields.io/docker/pulls/tdeutsch/openshift-cli)
![Docker Stars Badge](https://img.shields.io/docker/stars/tdeutsch/openshift-cli)
![Docker Size Badge](https://img.shields.io/docker/image-size/tdeutsch/openshift-cli)

## Quick reference

I made this container to debug container infrastructure (eg. Kubernetes). 
This is a image with many handy tools in it.

* **Code repository:**
  https://github.com/tuxpeople/docker-openshift-cli
* **Where to file issues:**
  https://github.com/tuxpeople/docker-openshift-cli/issues
* **Supported architectures:**
  ```amd64```, ```armv7```, ```armv6``` and ```arm64```

## Image tags
- ```latest``` always refers to the latest tagged release
- There are tags for major, minor and dotreleases (eg. ```1.0.0```, ```1.0```, ```1``` )
- ```edge``` gets automatically built on every push to master and also via a weekly cron job

## Usage
You can either deploy this container standalone to test stuff, or use it as a side car if you need some special features in your pod. One use case as a side car is analyse traffic with tcpdump.

```sh
docker pull tdeutsch/openshift-cli:<tag>
```

or

```sh
docker pull quay.io/tdeutsch/openshift-cli:<tag>
```

