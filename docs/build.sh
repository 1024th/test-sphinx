if command -v lsb_release >/dev/null; then
  case $(lsb_release -i -s) in
  Ubuntu)
    sudo apt-get install doxygen
    ;;
  Arch)
    sudo pacman -S doxygen
    ;;
  *)
    echo 'unknown system'
    exit 1
    ;;
  esac
  pip install sphinx sphinx-bootstrap-theme breathe
  make html
  cp -rT _build/html docs
  rm -r _build
fi

echo 'unknown system'
exit 1
