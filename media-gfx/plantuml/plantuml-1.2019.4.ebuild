# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

JAVA_PKG_IUSE="source"
inherit java-pkg-2 java-ant-2

DESCRIPTION="Draw UML diagrams using a simple and human readable text description"
HOMEPAGE="http://plantuml.com"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/jdk-1.7"

# For future reference: graphviz ebuild currently hard depends on
# dev-libs/expat, which is optional for graphviz AFAICT. If that ever becomes
# USE gated, need to require it here.
RDEPEND=">=virtual/jre-1.7
	dev-java/ant-core:0
	>=media-gfx/graphviz-2.26.3"

EANT_BUILD_TARGET="dist"
EANT_GENTOO_CLASSPATH="ant-core"
JAVA_ANT_REWRITE_CLASSPATH="true"

src_install() {
	java-pkg_dojar ${PN}.jar
	java-pkg_dolauncher ${PN} --jar ${PN}.jar
	use source && java-pkg_dosrc src/*
}
