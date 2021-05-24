class Libkafe < Formula
  desc 'Kafe is an open-source scriptable systems automation toolkit'
  homepage 'https://github.com/libkafe/kafe'
  url 'https://github.com/libkafe/kafe/archive/v1.1.5.tar.gz'
  sha256 '8870309dba6e0f1a474ee19e6acf2a51c73f5cd350b16122c637c00f4d40aba7'
  version '1.1.5'
  license 'Apache-2.0'

  depends_on 'cmake' => :build
  depends_on 'llvm' => :build
  depends_on 'lua'
  depends_on 'libssh'
  depends_on 'libgit2'
  depends_on 'curl'
  depends_on 'libarchive'

  def install
    system 'mkdir', '-p', 'build/osx'
    Dir.chdir('build/osx')
    ENV['CC'] = '/usr/local/opt/llvm/bin/clang'
    ENV['CXX'] = '/usr/local/opt/llvm/bin/clang++'
    system 'cmake', '../..', *std_cmake_args
    system 'make'
    system 'make', 'install'
  end
end
