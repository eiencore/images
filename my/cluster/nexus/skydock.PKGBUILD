pkgname=skydock
pkgver=git
pkgrel=1
pkgdesc="SkyDock"
arch=("i686" "x86_64")
url="https://github.com/crosbymichael/skydock"
license=("MIT")
makedepends=("go")
source=(
	"git+https://github.com/crosbymichael/skydock"
	"skydock-log.patch"
)
md5sums=(
	"SKIP"
	"e392cceb5313a735b8052e57ce5694ee"
)

prepare() {
	export GOPATH="$startdir"
	go get -v -d github.com/crosbymichael/skydock || true
	patch -d "$srcdir/$pkgname" -p1 < skydock-log.patch
	patch -d "$srcdir/github.com/crosbymichael/skydock" -p1 < skydock-log.patch
}

build() {
	export GOPATH="$startdir"
	cd "$srcdir/$pkgname"
	go get -v -d
	go build -v
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	cp skydock "$pkgdir/usr/bin/"
}
