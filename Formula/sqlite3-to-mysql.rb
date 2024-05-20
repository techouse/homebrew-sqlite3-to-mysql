class Sqlite3ToMysql < Formula
  include Language::Python::Virtualenv

  desc "Transfer data from SQLite to MySQL"
  homepage "https://github.com/techouse/sqlite3-to-mysql"
  url "https://files.pythonhosted.org/packages/5a/cf/e4cf35115ae320c7271e2953a0baf65bcdfed5a7bd7c7f1bfe637f97b112/sqlite3_to_mysql-2.1.10.tar.gz"
  sha256 "2e6352fa8e3f4fcff71b7e29a9e085d067b81d81756ee655f90e700f1672ad25"
  license "MIT"

  depends_on "python3"
  depends_on "python-setuptools"
  depends_on "sqlite"

  resource "click" do
    url "https://files.pythonhosted.org/packages/96/d3/f04c7bfcf5c1862a2a5b845c6b2b360488cf47af55dfa79c98f6a6bf98b5/click-8.1.7.tar.gz"
    sha256 "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
  end

  resource "mysql-connector-python" do
    url "https://github.com/mysql/mysql-connector-python/archive/refs/tags/8.4.0.tar.gz"
    sha256 "52944d6fa84c903fd70723a47d2f8c3153c50ae91773f1584a7bd30606c58b35"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/ee/b5/b43a27ac7472e1818c4bafd44430e69605baefe1f34440593e0332ec8b4d/packaging-24.0.tar.gz"
    sha256 "eb82c5e3e56209074766e6885bb04b8c38a0c015d0a30036ebe7ece34c9989e9"
  end

  resource "pytimeparse2" do
    url "https://files.pythonhosted.org/packages/19/10/cc63fecd69905eb4d300fe71bd580e4a631483e9f53fdcb8c0ad345ce832/pytimeparse2-1.7.1.tar.gz"
    sha256 "98668cdcba4890e1789e432e8ea0059ccf72402f13f5d52be15bdfaeb3a8b253"
  end

  resource "simplejson" do
    url "https://files.pythonhosted.org/packages/79/79/3ccb95bb4154952532f280f7a41979fbfb0fbbaee4d609810ecb01650afa/simplejson-3.19.2.tar.gz"
    sha256 "9eb442a2442ce417801c912df68e1f6ccfcd41577ae7274953ab3ad24ef7d82c"
  end

  resource "tabulate" do
    url "https://files.pythonhosted.org/packages/ec/fe/802052aecb21e3797b8f7902564ab6ea0d60ff8ca23952079064155d1ae1/tabulate-0.9.0.tar.gz"
    sha256 "0095b12bf5966de529c0feb1fa08671671b3368eec77d7ef7ab114be2c068b3c"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/5a/c0/b7599d6e13fe0844b0cda01b9aaef9a0e87dbb10b06e4ee255d3fa1c79a2/tqdm-4.66.4.tar.gz"
    sha256 "e4d936c9de8727928f3be6079590e97d9abfe8d39a590be678eb5919ffc186bb"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/f6/f3/b827b3ab53b4e3d8513914586dcca61c355fa2ce8252dea4da56e67bf8f2/typing_extensions-4.11.0.tar.gz"
    sha256 "83f085bd5ca59c80295fc2a82ab5dac679cbe02b9f33f7d83af68e241bea51b0"
  end

  resource "Unidecode" do
    url "https://files.pythonhosted.org/packages/f7/89/19151076a006b9ac0dd37b1354e031f5297891ee507eb624755e58e10d3e/Unidecode-1.3.8.tar.gz"
    sha256 "cfdb349d46ed3873ece4586b96aa75258726e2fa8ec21d6f00a591d98806c2f4"
  end

  def install
    virtualenv_create(libexec, "python3")

    resource("mysql-connector-python").stage do
      cd "mysql-connector-python" do
        system libexec/"bin/python3", *Language::Python.setup_install_args(libexec)
      end
    end

    virtualenv_install_with_resources
  end

  test do
    assert_match "Usage: sqlite3mysql [OPTIONS]", shell_output("#{bin}/sqlite3mysql --help")
  end
end
