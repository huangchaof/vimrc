
#备份debian10虚拟机上的.vimrc文件
#步骤如下：

cd ~
mkdir dotfiles
cd dotfiles
git init

#设置本地与远程仓库同步
git remote add origin https://github.com/huangchaof/vimrc.git
git branch -M main
git push -u origin main

#原有.vimrc设置为符号链接
mv ~/.vimrc ./vimrc
ln -s vimrc ~/.vimrc

#提交
git add .
git commit -m "commit message"
git push
