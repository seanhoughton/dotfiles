# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(exa &>/dev/null)
then
  alias ls="exa"
  alias l="exa -lh"
  alias ll="exa -la"
  alias la='exa -aa'
fi