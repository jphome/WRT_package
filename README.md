## WRT_package项目介绍
此工程的APP跑在以Raspberry Pi为硬件平台、OpenWrt为软件平台的设备上，作为学习LuCI开发的代码托管分支，当然代码是可以移植到其他所有OpenWrt系统上的
<br/>
添加硬件平台WRTnode

## Raspberry Pi跑OpenWrt
参考[Raspberry Pi烧写Openwrt固件](http://jphome.github.io/blog/2014/08/01/raspberry_pi_openwrt.html)

## WRTnode
[WRTnode 天生骄傲](http://wiki.wrtnode.com/index.php?title=Main_Page/zh-cn)

## APPs
* helloworld [详细介绍](http://jphome.github.io/blog/2014/03/29/openwrt_sdk.html)
* luci-app-njitclient-master [详细介绍](http://jphome.github.io/blog/2014/08/03/luci_add_page.html)

## 编译
<pre>
cd sdk_mt7620n
ln -s xxx/WRT_package ./package
make clean
make menuconfig
make V=99
tree bin
bin
├── packages
└── ramips
    └── packages
        ├── base
        │   ├── helloworld_1.0-1_ramips_24kec.ipk
        │   ├── hik_sniffer_1.0-1_ramips_24kec.ipk
        │   ├── luci-app-demo_1.0-1_all.ipk
        │   ├── luci-app-hik-sniffer_1.0-1_all.ipk
        │   └── luci-app-njitclient_1.0-1_all.ipk
        ├── Packages
        └── Packages.gz
</pre>

