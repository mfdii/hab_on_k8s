pkg_name=k8s-redis
pkg_version="3.2.4"
pkg_source="http://some_source_url/releases/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="TODO"
pkg_deps=(core/redis michael/kubectl)
pkg_exports=(
  [port]=port
)
pkg_exposes=( port )
pkg_description=$(cat << EOF 
A wrapper around core/redis. This plan provides functionality  
to label Redis instances in Kubernetes based on Habitat 
election results.
EOF
)

do_begin() {
  return 0
}

do_download() {
  return 0
}

do_verify() {
  return 0
}

do_clean() {
  return 0
}

do_unpack() {
  return 0
}

do_prepare() {
  return 0
}

do_build() {
  return 0
}

do_check() {
  return 0
}

do_install() {
  return 0
}

do_strip() {
  return 0
}

do_end() {
  return 0
}

