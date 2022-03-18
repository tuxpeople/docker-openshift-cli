FROM alpine:3.15.1 AS builder
ARG OCCURVERSION
LABEL stage=builder
WORKDIR /workspace
# hadolint ignore=SC2039
RUN wget -nv https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-client-linux-${OCCURVERSION}.tar.gz \
  && tar -xzf openshift-client-linux-${OCCURVERSION}.tar.gz

FROM alpine:3.15.1
# hadolint ignore=DL3018
RUN apk --no-cache add curl ca-certificates gettext gpgme libc6-compat
COPY --from=builder /workspace/oc /app/oc
CMD ["/app/oc"]
