pkgname=skydock
pkgver=git
pkgrel=1
pkgdesc="SkyDock"
arch=("i686" "x86_64")
url="https://github.com/crosbymichael/skydock"
license=("MIT")
makedepends=("go")
source=(
	"git+https://github.com/eiencore/skydock"
)
md5sums=(
	"SKIP"
)

build() {
	export GOPATH="$srcdir"
	cd "$srcdir/$pkgname"
	go get -v -d
	go build -v
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	cp skydock "$pkgdir/usr/bin/"
}
