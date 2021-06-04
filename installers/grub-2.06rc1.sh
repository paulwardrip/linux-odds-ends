mkdir -p ~/Development/grub206rc1/
cd ~/Development/grub206rc1/

wget https://unifoundry.com/pub/unifont/unifont-13.0.06/font-builds/unifont-13.0.06.pcf.gz
gunzip unifont-13.0.06.pcf.gz
sudo mkdir -pv /usr/share/fonts/unifont
sudo mv unifont-13.0.06.pcf /usr/share/fonts/unifont/

wget https://alpha.gnu.org/gnu/grub/grub-2.06~rc1.tar.xz
tar xf grub-2.06~rc1.tar.xz
cd grub-2.06~rc1

unset {C,CPP,CXX,LD}FLAGS

./configure --prefix=/usr        \
            --sysconfdir=/etc    \
            --disable-efiemu     \
            --enable-grub-mkfont \
            --with-platform=efi  \
            --disable-werror     &&
make

sudo make install
sudo mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions