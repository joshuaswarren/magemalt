Packer scripts to build magemalt, the Vagrant base box for MageScotch

General process:

Packer - https://www.packer.io - is a tool that builds virtual machine images. It reads the magemalt.json file, spins up a virtual machine and then executes the scripts in the scripts subdirectory within that virtual machine. 

Once it has run all of the scripts, it packages the resulting virtual machine box into a VirtualBox file that can be used locally or that can be uploaded to Hashicorp Atlas so that they're available to be referenced in a Vagrantfile and downloaded from the Atlas servers.

Originally based on ScotchBox, this version of MageScotch is completely new and instead uses MageMalt to build a new Ubuntu-based image to work from. I used https://github.com/cbednarski/packer-ubuntu as a foundation for building a basic Ubuntu VirtualBox, and then customized it heavily to add Magento 1, Magento 2 and related tools.

I've setup MageMalt and MageScotch in this manner so that anyone can easily submit a pull request that adds new software to the MageScotch environment. Currently, MageMalt is based on Ubuntu 16.04, so any command that you can run on a standard Ubuntu 16.04 environment can be added to any of the script files. 

So, if you'd like to add a new tool to MageScotch, please submit a pull request here in MageMalt. I'll review it, merge it in, and then build a new copy of MageMalt and upload it to Atlas so that all users of MageScotch can benefit from it.

Specifics to building the MageMalt box:

1. Install Packer, VirtualBox and Vagrant
2. git clone git@github.com:joshuaswarren/magemalt.git
3. cd magemalt
4. make


