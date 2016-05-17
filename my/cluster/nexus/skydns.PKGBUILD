pkgname=skydns
pkgver=git
pkgrel=1
pkgdesc="SkyNet DNS service"
arch=("i686" "x86_64")
url="https://github.com/skynetservices/skydns"
license=("MIT")
makedepends=("go")
source=("git+https://github.com/skynetservices/skydns")
md5sums=("SKIP")

build() {
	export GOPATH="$startdir"
	cd "$srcdir/$pkgname"
	go get -v -d
	go build -v
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	cp skydns "$pkgdir/usr/bin/"
}
