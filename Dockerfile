FROM alpine:3.12 AS builder
ARG OCCURVERSION
ARG TARGETARCH
ARG URL
LABEL stage=builder
WORKDIR /workspace
RUN echo TARGETARCH is ${TARGETARCH}
RUN if [ "${TARGETARCH}" = "arm64" ]; then export URL=https://mirror.openshift.com/pub/openshift-v4/clients/oc/${OCCURVERSION}/linux-aarch64/oc.tar.gz ; fi; \
  if [ "${TARGETARCH}" = "amd64" ]; then export URL=https://mirror.openshift.com/pub/openshift-v4/clients/oc/${OCCURVERSION}/linux/oc.tar.gz ; fi; \
  if [ "${TARGETARCH}" = "ppc64le" ]; then export URL=https://mirror.openshift.com/pub/openshift-v4/clients/oc/${OCCURVERSION}/linux-ppc64le/oc.tar.gz ; fi; \
  if [ "${TARGETARCH}" = "s390x" ]; then export URL=https://mirror.openshift.com/pub/openshift-v4/clients/oc/${OCCURVERSION}/linux-s390x/oc.tar.gz ; fi; \
  wget ${URL}
RUN tar -xzf oc.tar.gz

FROM alpine:3.12
RUN apk --no-cache add curl ca-certificates gettext gpgme
COPY --from=builder /workspace/oc /app/oc
CMD ["/app/oc"]