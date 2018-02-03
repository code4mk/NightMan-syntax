fs = require 'fs'
module.exports =
  # Your config schema
  config:
    CursorBox:
      type: 'boolean'
      default: false
      description: 'Use cursor Box (need to restart atom)'
    CursorBgColor:
      type: 'boolean'
      default: false
      description: 'Use cursor Bg color (need to restart atom)'

atom.config.onDidChange 'NightMan-syntax.CursorBox', ({newValue, oldValue}) ->
   if(newValue)
     fs.createReadStream(atom.packages.getPackageDirPaths() + '/NightMan-syntax/styles/cursor/cursor_box').pipe(fs.createWriteStream(atom.packages.getPackageDirPaths() + '/NightMan-syntax/styles/cursor/cursor_box.less'));
   else
     fs.createReadStream(atom.packages.getPackageDirPaths() + '/NightMan-syntax/styles/cursor/cursor_box1').pipe(fs.createWriteStream(atom.packages.getPackageDirPaths() + '/NightMan-syntax/styles/cursor/cursor_box.less'));

atom.config.onDidChange 'NightMan-syntax.CursorBgColor', ({newValue, oldValue}) ->
   if(newValue)
     fs.createReadStream(atom.packages.getPackageDirPaths() + '/NightMan-syntax/styles/cursor-bg/bg-color').pipe(fs.createWriteStream(atom.packages.getPackageDirPaths() + '/NightMan-syntax/styles/cursor/bg-color.less'));
   else
     fs.createReadStream(atom.packages.getPackageDirPaths() + '/NightMan-syntax/styles/cursor-bg/bg-color-zero').pipe(fs.createWriteStream(atom.packages.getPackageDirPaths() + '/NightMan-syntax/styles/cursor/bg-color.less'));
