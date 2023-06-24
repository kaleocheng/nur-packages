{ writeShellApplication, neovim, writeTextFile }:
let
  daysConfig = writeTextFile {
    name = "nvimrc";
    text = (builtins.readFile ./nvimrc);
  };
in writeShellApplication {
  name = "days";
  runtimeInputs = [ neovim ];
  text = ''
    find ~/journal/"$(date +'%Y')"/* -mtime -180 | xargs nvim --cmd "source ${daysConfig}" --cmd "set fillchars+=eob:\ " -O
  '';
}
