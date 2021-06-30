class Libkafe < Formula
  desc 'Kafe is an open-source scriptable systems automation toolkit'
  homepage 'https://github.com/libkafe/kafe'
  url 'https://github.com/libkafe/kafe/archive/v1.1.5.1.tar.gz'
  sha256 'dbb9f38d3078cf874f3341e3b8b52ff6292f7a0da8cf7c3b490f8c08cb34c4a3'
  version '1.1.5.1'
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

    if ENV.has_key?('KAFE_CC') then
        ENV['CC'] = ENV['KAFE_CC']
    else
        if File.exist?('/opt/homebrew/opt/llvm/bin/clang') then
            ENV['CC'] = '/opt/homebrew/opt/llvm/bin/clang'
        else
            ENV['CC'] = '/usr/local/opt/llvm/bin/clang'
        end
    end

    if ENV.has_key?('KAFE_CXX') then
        ENV['CXX'] = ENV['KAFE_CXX']
    else
        if File.exist?('/opt/homebrew/opt/llvm/bin/clang') then
            ENV['CXX'] = '/opt/homebrew/opt/llvm/bin/clang++'
        else
            ENV['CXX'] = '/usr/local/opt/llvm/bin/clang++'
        end
    end

    system 'cmake', '../..', '-DCMAKE_MACOSX_RPATH=OFF' ,*std_cmake_args
    system 'make'
    system 'make', 'install'
  end
end
