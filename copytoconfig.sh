clear
echo Preparing to copy configs to the .config folder, please note this will potentially break things if done before running the dependency installer, this is because the configs *WILL* require utilities which are included in the script so a reload of any utilities may break if dependencies arent met.

cp -r ./ ~/.config/