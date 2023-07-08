# Branded Syncthing example

This repo shows how to create a Docker image that overrides parts of the
Syncthing GUI for branding purposes.

## Overrides

The original GUI source is available in
https://github.com/syncthing/syncthing/tree/main/gui. Use this as a guide to
the existing assets that you might want to override. In this example we're
making a couple of smaller changes:

- We replace the blue Syncthing logo with an orange Kastelo logo. The logo
  is served from `default/assets/img/logo-horizontal.svg` so we override
  that path with another file in SVG format.

- We replace `default/assets/css/theme.css` to change the default font to
  Comic Sans and the background colour to `aquamarine`.

Other customizations are also possible, for example it might be an idea to
add vendor metadata to the Docker image itself to differentiate it from the
original.

```
# Set image metadata as required
LABEL org.label-schema.vendor "Kastelo USA, Inc."
LABEL org.label-schema.url "https://kastelo.net/"
```


## Build and test

Create a branded Docker image and run it:

```
% docker build -t my-org/branded-syncthing:latest .
% docker run -it --rm -p 8384:8384 my-org/branded-syncthing:latest
```

Visit the GUI to observe the changes.

The Syncthing version is a build arg (defaulting to `latest`), so you can be
specific when building for reproducibility:

```
% docker build --build-arg SYNCTHING_VERSION=1.23.6 -t my-org/branded-syncthing:1.23.6 .
```

## Like this

Default:

![before](/screenshots/before.png)

Branded:

![after](/screenshots/after.png)