#!/bin/bash

# for systemd-boot
#echo "quiet intel_iommu=on iommu=pt nofb nomodeset video=vesafb:off,efifb:off" > /etc/kernel/cmdline
#proxmox-boot-tool refresh

# for grub
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on iommu=pt nofb nomodeset video=vesafb:off video=efifb:off"/g' /etc/default/grub
update-grub

# Load modules
echo "vfio" >> /etc/modules
echo "vfio_iommu_type1" >> /etc/modules
echo "vfio_pci" >> /etc/modules
echo "vfio_virqfd" >> /etc/modules

echo "options vfio_iommu_type1 allow_unsafe_interrupts=1" > /etc/modprobe.d/iommu_unsafe_interrupts.conf
echo "options kvm ignore_msrs=1" > /etc/modprobe.d/kvm.conf

# Add blacklist
echo "blacklist amdgpu" >> /etc/modprobe.d/blacklist.conf
echo "blacklist radeon" >> /etc/modprobe.d/blacklist.conf
echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf
echo "blacklist nvidia" >> /etc/modprobe.d/blacklist.conf
echo "blacklist snd_hda_intel" >> /etc/modprobe.d/blacklist.conf

# for AMD R9 270X
#echo "options vfio-pci ids=1002:6810,1002:aab0 disable_vga=1" > /etc/modprobe.d/vfio.conf

# for NVIDIA GTX960
#echo "options vfio-pci ids=10de:1401,10de:0fba disable_vga=1" > /etc/modprobe.d/vfio.conf

# for NVIDIA GTX1060
echo "options vfio-pci ids=10de:10f1,10de:1c02 disable_vga=1" > /etc/modprobe.d/vfio.conf
update-initramfs -u
